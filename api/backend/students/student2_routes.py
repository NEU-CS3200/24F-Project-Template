########################################################
# Sample customers blueprint of endpoints
# Remove this file if you are not using it in your project
########################################################
from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

#------------------------------------------------------------
# Create a new Blueprint object, which is a collection of 
# routes.
student2 = Blueprint('student2', __name__)


#------------------------------------------------------------
# Get all students from the system
@student2.route('/student2', methods=['GET'])
def get_students():

    cursor = db.get_db().cursor()
    cursor.execute('''SELECT Name, Major,
                    Company, Location FROM Student
    ''')
    
    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response

# Route to retrieve student information
@student2.route('/retrieve_student_info', methods=['GET'])
def retrieve_student():
    cursor = db.get_db().cursor()
    cursor.execute('''
        SELECT StudentID, Name, Major, Company, Lifestyle, Location, Bio
        FROM Student
    ''')
    theData = cursor.fetchall()
    
    # Convert to a list of dictionaries for better response handling
    result = [
        {
            "StudentID": row[0],
            "Name": row[1],
            "Major": row[2],
            "Company": row[3],
            "Lifestyle": row[4],
            "Location": row[5],
            "Bio": row[6]
        }
        for row in theData
    ]
    
    the_response = make_response(jsonify(result))
    the_response.status_code = 200
    return the_response


# Route to update student profile information
@student2.route('/update_student_profile', methods=['PUT'])
def update_student_profile():
    try:
        # Parse JSON data from request
        data = request.json
        student_id = data.get('StudentID')
        name = data.get('Name')
        major = data.get('Major')
        company = data.get('Company')
        location = data.get('Location')
        bio = data.get('Bio')

        # Validate that student_id is provided
        if not student_id:
            return make_response(jsonify({"error": "StudentID is required"}), 400)

        # Build the SQL query dynamically based on fields to be updated
        query = '''
            UPDATE Student
            SET 
                Name = %s,
                Major = %s,
                Company = %s,
                Location = %s,
                Bio = %s
            WHERE StudentID = %s
        '''
        values = (name, major, company, location, bio, student_id)

        # Execute the query
        cursor = db.get_db().cursor()
        cursor.execute(query, values)
        db.get_db().commit()

        return make_response(jsonify({"message": "Student profile updated successfully"}), 200)

    except Exception as e:
        # Handle exceptions and return an error response
        return make_response(jsonify({"error": str(e)}), 500)

# route to provide feedback to advisor
@student2.route('/feedback', methods=['POST'])
def give_feedback():
    data = request.json
    current_app.logger.info(data)

    description = data['Description']
    date = data['Date']
    rating = data['ProgressRating']
    student_id = data['StudentID']
    advisor_id = data.get('AdvisorID', None)

    query = '''
    INSERT INTO Feedback (Description, Date, ProgressRating, StudentID, AdvisorID)
        VALUES (%s, %s, %s, %s, %s)
    '''

    current_app.logger.info(query)
    connection = db.get_db()  
    cursor = connection.cursor()  

    cursor.execute(query, (description, date, rating, student_id, advisor_id))
    connection.commit() 

    cursor.close()  

    response = make_response("Successfully added feedback")
    response.status_code = 200
    return response

@student2.route('/student/<name>', methods=['GET'])
def get_profile(name):
    query = '''
    SELECT *
    FROM Student s
    WHERE Name = %s
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (name, ))  
    theData = cursor.fetchall()
    
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

@student2.route('/students/<student_id>/feedback/<feedback_id>', methods=['DELETE'])
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