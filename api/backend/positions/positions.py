### FILE FOR POSITIONS FROM THE REST API MATRIX
from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db



#------------------------------------------------------------
# Create a new Blueprint object, which is a collection of 
# routes.
positions = Blueprint('positions', __name__)

# Making a request given the blueprint
# Looking at all available positions
@positions.route('/positions', methods=['GET'])
def job_apps(jobID):
    cursor = db.get_db().cursor()
    cursor.execute('''
    SELECT * 
    FROM positions;
    ''')
    
    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response

# Making a request given the blueprint
# Creating a new position
@positions.route('/positions', methods=['POST'])
def create_position():
    # Get the position details from the request body
    current_app.logger.info('Processing position creation request')
    position_details = request.json
    
    cursor = db.get_db().cursor()
    cursor.execute('''
    INSERT INTO positions (
        title,
        company,
        location,
        salary,
        description
    ) VALUES (
        %s, %s, %s, %s, %s
    )''', (
        position_details['title'],
        position_details['company'],
        position_details['location'],
        position_details.get('salary'),  # Using get() in case salary is optional
        position_details['description']
    ))
    
    # Commit the transaction
    db.get_db().commit()
    
    return_value = {
        'message': 'Position created successfully'
    }
    
    the_response = make_response(jsonify(return_value))
    the_response.status_code = 201  # 201 means "Created"
    return the_response