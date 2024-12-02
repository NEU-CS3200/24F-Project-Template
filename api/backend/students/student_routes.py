from flask import Blueprint, jsonify, make_response
from backend.db_connection import db

students = Blueprint('students', __name__)

@students.route('/students', methods=['GET'])
def get_all_students():
    try:
        query = '''
        SELECT 
            StudentID AS student_id,
            Name AS student_name,
            Location AS co_op_location,
            Company AS company_name,
            Major AS major
        FROM Student
        ORDER BY student_id ASC
        '''
        cursor = db.get_db().cursor()
        cursor.execute(query)
        
        # Convert the data to a list of dictionaries
        columns = [column[0] for column in cursor.description]
        results = []
        for row in cursor.fetchall():
            results.append(dict(zip(columns, row)))
        
        # Add debug logging
        print(f"Query results: {results}")
        
        return jsonify(results), 200
        
    except Exception as e:
        # Enhanced error logging
        print(f"Database error: {str(e)}")
        return jsonify({
            "error": str(e),
            "type": type(e).__name__
        }), 500

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
