########################################################
# Sample customers blueprint of endpoints
# Remove this file if you are not using it in your project
########################################################
from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

#------------------------------------------------------------
# Create a new Blueprint object, which is a collection of 
# routes.
student2 = Blueprint('student2', __name__)


#------------------------------------------------------------
# Get all students from the system
@student2.route('/student2', methods=['GET'])
def get_students():

    cursor = db.get_db().cursor()
    cursor.execute('''SELECT Name, Major,
                    Company, Location FROM Student
    ''')
    
    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response

# Route to retrieve student information
@student2.route('/retrieve_student_info', methods=['GET'])
def retrieve_student():
    cursor = db.get_db().cursor()
    cursor.execute('''
        SELECT StudentID, Name, Major, Company, Lifestyle, Location, Bio
        FROM Student
    ''')
    theData = cursor.fetchall()
    
    # Convert to a list of dictionaries for better response handling
    result = [
        {
            "StudentID": row[0],
            "Name": row[1],
            "Major": row[2],
            "Company": row[3],
            "Lifestyle": row[4],
            "Location": row[5],
            "Bio": row[6]
        }
        for row in theData
    ]
    
    the_response = make_response(jsonify(result))
    the_response.status_code = 200
    return the_response


# Route to update student profile information
@student2.route('/update_student_profile', methods=['PUT'])
def update_student_profile():
    try:
        # Parse JSON data from request
        data = request.json
        student_id = data.get('StudentID')
        name = data.get('Name')
        major = data.get('Major')
        company = data.get('Company')
        location = data.get('Location')
        bio = data.get('Bio')

        # Validate that student_id is provided
        if not student_id:
            return make_response(jsonify({"error": "StudentID is required"}), 400)

        # Build the SQL query dynamically based on fields to be updated
        query = '''
            UPDATE Student
            SET 
                Name = %s,
                Major = %s,
                Company = %s,
                Location = %s,
                Bio = %s
            WHERE StudentID = %s
        '''
        values = (name, major, company, location, bio, student_id)

        # Execute the query
        cursor = db.get_db().cursor()
        cursor.execute(query, values)
        db.get_db().commit()

        return make_response(jsonify({"message": "Student profile updated successfully"}), 200)

    except Exception as e:
        # Handle exceptions and return an error response
        return make_response(jsonify({"error": str(e)}), 500)