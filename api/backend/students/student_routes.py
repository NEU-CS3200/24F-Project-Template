from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response

from backend.db_connection import db

students = Blueprint('students', __name__)



@students.route('/students', methods=['GET'])
def get_all_students():
    query = '''
        SELECT 
            StudentID as student_id,
            Name as student_name,
            Location as co_op_location,
            Company as company_name,
            Major as major
        FROM Student
        ORDER BY StudentID ASC
        '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

@students.route('/students/<student_id>/reminders', methods=['GET'])
def get_student_reminders(student_id):
    query = '''
    -- Add your SQL query here
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response



@students.route('/students/feedback', methods=['GET'])
def get_all_feedback():
    query = '''
    SELECT
    s.Name AS student_name
    s.StudentID,
    f.Date,
    f.FeedbackID,
    f.Description,
    f.ProgressRating,
        FROM Feedback f
        JOIN Student s ON f.StudentID = s.StudentID
        ORDER BY f.Date DESC;
        '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response
