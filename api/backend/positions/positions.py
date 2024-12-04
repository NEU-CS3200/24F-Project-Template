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
def get_positions():
    cursor = db.get_db().cursor()
    
    # Get filter parameters from query string
    # TO DO: Add correct filters
    filters = {
        'company': request.args.get('company'),
        'location': request.args.get('location'),
        'min_salary': request.args.get('min_salary'),
        'max_salary': request.args.get('max_salary'),
        'title': request.args.get('title')
    }
    
    # Start with base query
    query = 'SELECT * FROM positions WHERE 1=1'
    params = []
    
    # Dynamically add filters if they're provided
    if filters['company']:
        query += ' AND company LIKE %s'
        params.append(f'%{filters["company"]}%')
        
    if filters['location']:
        query += ' AND location LIKE %s'
        params.append(f'%{filters["location"]}%')
        
    if filters['min_salary']:
        query += ' AND salary >= %s'
        params.append(filters['min_salary'])
        
    if filters['max_salary']:
        query += ' AND salary <= %s'
        params.append(filters['max_salary'])
        
    if filters['title']:
        query += ' AND title LIKE %s'
        params.append(f'%{filters["title"]}%')
    
    # Execute the query with any applied filters
    cursor.execute(query, tuple(params))
    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response

# Making a request given the blueprint
# Creating a new position
# TO DO: Add correct filters
@positions.route('/positions', methods=['POST'])
def create_position():
    # Get the position details from the request body
    current_app.logger.info('Processing position creation request')
    position_details = request.json
    
    cursor = db.get_db().cursor()
    cursor.execute('''
    INSERT INTO positions (
        
    ) VALUES (
        %s, %s, %s, %s, %s
    )''', (
       ### TO DO
    ))
    
    # Commit the transaction
    db.get_db().commit()
    
    return_value = {
        'message': 'Position created successfully'
    }
    
    the_response = make_response(jsonify(return_value))
    the_response.status_code = 201  # 201 means "Created"
    return the_response

# Making a request given the blueprint
# Deleting a position
@positions.route('/positions/<int:job_id>', methods=['DELETE'])
def delete_position(job_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute('DELETE FROM positions WHERE JobID = %s', (job_id,))
        
        if cursor.rowcount == 0:
            # No position found with this ID
            return_value = {
                'error': f'No position found with ID {job_id}'
            }
            return make_response(jsonify(return_value), 404)
        
        # Commit the transaction
        db.get_db().commit()
        
        return_value = {
            'message': f'Position {job_id} deleted successfully'
        }
        return make_response(jsonify(return_value), 200)
        
    except Exception as e:
        return_value = {
            'error': f'Error deleting position: {str(e)}'
        }
        return make_response(jsonify(return_value), 500)