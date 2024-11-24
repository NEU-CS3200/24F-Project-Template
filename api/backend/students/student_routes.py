from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

#------------------------------------------------------------
# Create a new Blueprint object, which is a collection of 
# routes.
students = Blueprint('students', __name__)

#------------------------------------------------------------
# Get all the students from the database, package them up,
# and return them to the client
@students.route('/student/<student_id>', methods=['GET'])
def get_user_by_id(student_id):
    query = f'''
        SELECT name, email, phoneNumber
        FROM student
        WHERE studentId = {str(student_id)}
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response
