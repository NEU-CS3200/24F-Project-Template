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
        print("Created cursor")
        
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
        print(f"Executing query: {query}")
        cursor.execute(query)
        
        # Get column names from cursor description
        columns = [desc[0] for desc in cursor.description]
        
        # Convert results to list of dictionaries
        results = []
        for row in cursor.fetchall():
            results.append(dict(zip(columns, row)))
            
        print(f"Query returned {len(results)} results")
        if results:
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
            "type": type(e).__name__,
            "traceback": traceback.format_exc()
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
