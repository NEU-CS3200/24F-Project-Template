from flask import Blueprint, jsonify, make_response
from backend.db_connection import db

students = Blueprint('students', __name__)


@students.route('/students', methods=['GET'])
def get_all_students():
    try:
        connection = db.get_db()
        cursor = connection.cursor()
        query = '''
        SELECT 
             s.Name as student_name,
            s.StudentID as student_id,
            s.Location as co_op_location,
            s.Company as company_name,
            s.Major as major
        FROM Student s
        JOIN CityCommunity c ON s.CommunityID = c.CommunityID
        ORDER BY s.StudentID ASC
        '''
        cursor.execute(query)
        theData = cursor.fetchall()
        
        response = make_response(jsonify(theData))
        response.status_code = 200
        return response
    except Exception as e:
        print(f"Database error: {str(e)}")
        return jsonify({'error': 'Failed to fetch students'}), 500

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
    -- Add your SQL query here
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

@students.route('/test', methods=['GET'])
def test_connection():
    try:
        connection = db.get_db()
        cursor = connection.cursor(dictionary=True)
        cursor.execute('SELECT COUNT(*) as count FROM Student')
        result = cursor.fetchone()
        cursor.close()
        return jsonify({'student_count': result['count']}), 200
    except Exception as e:
        print(f"Database connection test failed: {str(e)}")
        return jsonify({'error': 'Database connection test failed'}), 500



