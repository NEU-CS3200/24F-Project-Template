from flask import Blueprint, jsonify
from backend.db_connection import db

students = Blueprint('students', __name__)

@students.route('/students', methods=['GET'])
def get_all_students():
    try:
        connection = db.get_db()
        cursor = connection.cursor()
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
        cursor.execute(query)
        columns = [desc[0] for desc in cursor.description]
        results = [dict(zip(columns, row)) for row in cursor.fetchall()]
        cursor.close()
        return jsonify(results), 200
    except Exception as e:
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
