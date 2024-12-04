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
        'Location': request.args.get('Location'),
        'ExperienceRequired': request.args.get('ExperienceRequired'),
        'Skills': request.args.get('Skills'),
        'Industry': request.args.get('Industry'),
        'SalaryRange': request.args.get('SalaryRange'),
        'PositionType': request.args.get('PositionType'),
        'StartUpName': request.args.get('StartUpName'),
    }
    
    # Start with base query
    query = 'SELECT * FROM positions WHERE 1=1'
    params = []
    
    # Dynamically add filters if they're provided
    if filters['Location']:
        query += ' AND Location LIKE %s'
        params.append(f'%{filters["Location"]}%')
        
    if filters['ExperienceRequired']:
        query += ' AND ExperienceRequired LIKE %s'
        params.append(f'%{filters["ExperienceRequired"]}%')
        
    if filters['Skills']:
        query += ' AND salary >= %s'
        params.append(filters['min_salary'])
        
    if filters['Industry']:
        query += ' AND Industry LIKE %s'
        params.append(f'%{filters["Industry"]}%')

    if filters['SalaryRange']: 
        query += ' AND SalaryRange LIKE %s'
        params.append(f'%{filters["SalaryRange"]}%')    
        
    if filters['PositionType']:
        query += ' AND PositionType LIKE %s'
        params.append(f'%{filters["PositionType"]}%')
        
    if filters['StartUpName']:
        query += ' AND StartUpName LIKE %s'
        params.append(f'%{filters["StartUpName"]}%')
    
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
    try:
        # Get the position details from the request body
        current_app.logger.info('Processing position creation request')
        position_details = request.json
        
        cursor = db.get_db().cursor()
        cursor.execute('''
        INSERT INTO positions (
            Location,
            ExperienceRequired,
            Skills,
            Industry,
            SalaryRange,
            PositionType,
            StartUpName
        ) VALUES (
            %s, %s, %s, %s, %s, %s, %s
        )''', (
            position_details['Location'],
            position_details['ExperienceRequired'],
            position_details['Skills'],
            position_details['Industry'],
            position_details['SalaryRange'],
            position_details['PositionType'],
            position_details['StartUpName']
        ))
        
        # Commit the transaction
        db.get_db().commit()
        
        return_value = {
            'message': 'Position created successfully'
        }
        
        the_response = make_response(jsonify(return_value))
        the_response.status_code = 201  # 201 means "Created"
        return the_response
        
    except KeyError as e:
        return_value = {
            'error': f'Missing required field: {str(e)}'
        }
        return make_response(jsonify(return_value), 400)
    except Exception as e:
        return_value = {
            'error': f'Error creating position: {str(e)}'
        }
        return make_response(jsonify(return_value), 500)

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

# Making a request given the blueprint
# Updating a position
@positions.route('/positions/<int:job_id>', methods=['PATCH'])
def update_position(job_id):
    try:
        current_app.logger.info(f'Processing position update request for ID {job_id}')
        updates = request.json
        
        # Start building the dynamic update query
        query_parts = []
        params = []
        
        # Build query dynamically based on provided fields
        if 'title' in updates:
            query_parts.append('title = %s')
            params.append(updates['title'])
            
        if 'company' in updates:
            query_parts.append('company = %s')
            params.append(updates['company'])
            
        if 'location' in updates:
            query_parts.append('location = %s')
            params.append(updates['location'])
            
        if 'salary' in updates:
            query_parts.append('salary = %s')
            params.append(updates['salary'])
            
        if 'description' in updates:
            query_parts.append('description = %s')
            params.append(updates['description'])
            
        if not query_parts:
            return_value = {
                'error': 'No valid fields provided for update'
            }
            return make_response(jsonify(return_value), 400)
        
        # Construct the final query
        query = 'UPDATE positions SET ' + ', '.join(query_parts) + ' WHERE JobID = %s'
        params.append(job_id)
        
        # Execute the update
        cursor = db.get_db().cursor()
        cursor.execute(query, tuple(params))
        
        if cursor.rowcount == 0:
            return_value = {
                'error': f'No position found with ID {job_id}'
            }
            return make_response(jsonify(return_value), 404)
        
        # Commit the transaction
        db.get_db().commit()
        
        return_value = {
            'message': f'Position {job_id} updated successfully'
        }
        return make_response(jsonify(return_value), 200)
        
    except Exception as e:
        return_value = {
            'error': f'Error updating position: {str(e)}'
        }
        return make_response(jsonify(return_value), 500)