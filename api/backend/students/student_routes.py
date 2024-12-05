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

@students.route('/students/<student_id>/feedback', methods=['GET'])
def get_student_feedback(student_id):
    
    query = '''
    SELECT * FROM Feedback
    WHERE StudentID = %s
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (student_id, ))  
    theData = cursor.fetchall()
    
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

@students.route('/students/<student_id>/feedback/<feedback_id>', methods=['DELETE'])
def del_feedback(student_id, feedback_id):
    try:
        query = '''
        DELETE FROM Feedback
        WHERE StudentID = %s AND FeedbackID = %s
        '''
        cursor = db.get_db().cursor()
        cursor.execute(query, (student_id, feedback_id))
        
        db.get_db().commit()

        if cursor.rowcount == 0:
            response = make_response(jsonify({
                "error": "No feedback entry found for the given student ID and feedback ID."
            }))
            response.status_code = 404
            return response
        
        response = make_response(jsonify({"message": "Feedback entry deleted successfully."}))
        response.status_code = 200
        return response
    except Exception as e:
        response = make_response(jsonify({"error": str(e)}))
        response.status_code = 500
        return response



@students.route('/students/feedback', methods=['GET'])
def get_all_feedback():
    query = '''
        SELECT 
            s.StudentID,
            s.Name as student_name,
            f.FeedbackID,
            f.Description,
            f.Date,
            f.ProgressRating
        FROM Feedback f
        JOIN Student s ON f.StudentID = s.StudentID
        JOIN Advisor a ON f.AdvisorID = a.AdvisorID
        ORDER BY f.Date DESC;
        '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response