from flask import Blueprint, jsonify
from backend.db_connection import db

students = Blueprint('students', __name__)

@students.route('/students', methods=['GET'])
def get_all_students():
    try:
        # First, let's check if we can connect to the database
        connection = db.get_db()
        print("Database connection successful")
        
        # Let's check if the Student table exists and has data
        cursor = connection.cursor()
        cursor.execute("SELECT COUNT(*) FROM Student")
        count = cursor.fetchone()[0]
        print(f"Number of students in database: {count}")
        
        if count == 0:
            print("No students found in database")
            return jsonify([]), 200
            
        # Now execute the main query
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
        print(f"Executing query: {query}")
        cursor.execute(query)
        
        # Get column names and data
        columns = [column[0] for column in cursor.description]
        results = []
        for row in cursor.fetchall():
            results.append(dict(zip(columns, row)))
        
        print(f"Query returned {len(results)} results")
        if len(results) > 0:
            print("Sample first row:", results[0])
            
        cursor.close()
        return jsonify(results), 200
        
    except Exception as e:
        error_msg = f"Error in get_all_students: {str(e)}"
        print(error_msg)
        print(f"Error type: {type(e).__name__}")
        import traceback
        print("Traceback:", traceback.format_exc())
        return jsonify({
            "error": error_msg,
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
