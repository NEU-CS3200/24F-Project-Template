from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

advisor = Blueprint('advisor', __name__)

@advisor.route('/advisor', methods=['GET'])
# route for retreiving all student profiles
def get_advisor():
    query = '''

    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

@advisor.route('/students/<student_id>/reminders', methods=['GET'])
# route for retrieving recommendation for specific student
def get_student_reminders(student_id):
    query = '''

    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

@advisor.route('/students/<student_id>/feedback', methods=['GET'])
# route for retrieving feedback for specific student
def get_student_feedback(student_id):
    query = '''

    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

@advisor.route('/advisor/notifications', methods=['GET'])
def get_notifications():
    try:
        cursor = db.get_db().cursor()
        query = '''
        SELECT 
            s.Name as student_name,
            t.Status as notification_status,
            t.Reminder as date_assigned,
            t.Description as description
        FROM Task t
        JOIN Student s ON t.AssignedTo = s.StudentID
        ORDER BY t.Reminder DESC
        '''
        cursor.execute(query)
        theData = cursor.fetchall()
        
        response = make_response(jsonify(theData))
        response.status_code = 200
        return response
    except Exception as e:
        print(f"Database error: {str(e)}")
        return jsonify({'error': 'Failed to fetch notifications'}), 500

@advisor.route('/advisor/tasks', methods=['GET'])
def get_student_tasks():
    try:
        cursor = db.get_db().cursor()
        query = '''
        SELECT 
            s.Name as student_name,
            t.Status as task_status,
            t.DueDate as due_date,
            t.Reminder as date_assigned,
            t.Description as description
        FROM Task t
        JOIN Student s ON t.AssignedTo = s.StudentID
        ORDER BY t.DueDate ASC
        '''
        cursor.execute(query)
        theData = cursor.fetchall()
        
        if not theData:
            return jsonify([]), 200
            
        response = make_response(jsonify(theData))
        response.status_code = 200
        return response
    except Exception as e:
        print(f"Database error: {str(e)}")
        return jsonify({'error': 'Failed to fetch student tasks'}), 500
