from backend.db_connection import db
from flask import Blueprint, jsonify, make_response


advisor = Blueprint('advisor', __name__)


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

@advisor.route('/', methods=['GET'])
def get_all_tasks():
    """
    Fetch all tasks with student details.
    """
    try:
        connection = db.get_db()
        cursor = connection.cursor()
        query = '''
        SELECT 
            t.TaskID,
            t.Description,
            t.Reminder,
            t.DueDate,
            t.Status,
            t.AdvisorID,
            s.StudentID,
            s.Name AS student_name
        FROM Task t
        JOIN Student s ON t.AssignedTo = s.StudentID;
        '''
        cursor.execute(query)
        theData = cursor.fetchall()

        # Debug: Temporarily return raw data for troubleshooting
        response = make_response(jsonify(theData))
        response.status_code = 200
        return response
    except Exception as e:
        print(f"Database error: {str(e)}")
        return jsonify({'error': 'Failed to fetch tasks'}), 500
    


@advisor.route('/advisor', methods=['GET'])
def get_all_tasks2():
    """
    Fetch all tasks with student details.
    """
    try:
        connection = db.get_db()
        cursor = connection.cursor()
        query = '''
        SELECT 
            t.TaskID,
            t.Description,
            t.Reminder,
            t.DueDate,
            t.Status,
            t.AdvisorID,
            s.StudentID,
            s.Name AS student_name
        FROM Task t
        JOIN Student s ON t.AssignedTo = s.StudentID;
        '''
        cursor.execute(query)
        theData = cursor.fetchall()

        # Debug: Temporarily return raw data for troubleshooting
        response = make_response(jsonify(theData))
        response.status_code = 200
        return response
    except Exception as e:
        print(f"Database error: {str(e)}")
        return jsonify({'error': 'Failed to fetch tasks'}), 500