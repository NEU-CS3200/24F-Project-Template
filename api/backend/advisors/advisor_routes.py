########################################################
# Sample advisors blueprint of endpoints
# Remove this file if you are not using it in your project
########################################################
from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
import logging as logger
from backend.db_connection import db

#------------------------------------------------------------
# Create a new Blueprint object, which is a collection of 
# routes.
advisors = Blueprint('advisors', __name__)


#------------------------------------------------------------
# Get all students that are associated with the advisor
@advisors.route('advisors/1/students', methods=['GET'])
def get_students(advisor_id):
    # Log entry to the route
    logger.info(f"GET request received for /advisors/{advisor_id}/students")

    # Validate advisor_id
    if not advisor_id:
        logger.error("advisor_id is missing.")
        return jsonify({"error": "advisor_id is required"}), 400

    try:
        # SQL query
        query = """
            SELECT student.studentId, student.name, student.email, student.phoneNumber
            FROM student
            INNER JOIN advisor ON student.advisorId = advisor.advisorId
            WHERE advisor.advisorId = %s
        """
        logger.info(f"Executing query for advisor_id: {advisor_id}")
        cursor = db.get_db().cursor()
        cursor.execute(query, (advisor_id,))
        students = cursor.fetchall()

        if not students:
            logger.info(f"No students found for advisor_id: {advisor_id}")
            return jsonify([]), 200

        # Format results
        students_data = [
            {"Student ID": row[0], "Name": row[1], "Email": row[2], "Phone": row[3]}
            for row in students
        ]
        return jsonify(students_data), 200
    except Exception as e:
        logger.error(f"Error: {str(e)}")
        return jsonify({"error": str(e)}), 500
