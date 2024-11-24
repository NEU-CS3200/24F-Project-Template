from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

#------------------------------------------------------------
# We will use this one for admins, advisors, and recruiters
management = Blueprint('management', __name__)

#------------------------------------------------------------
# Get all the management from the database, package them up,
# and return them to the client
@management.route('/recruiter/<recruiter_id>', methods=['GET'])
def get_recruiter_by_id(recruiter_id):
    query = f'''
        SELECT name, email, phoneNumber
        FROM recruiter
        WHERE recruiterId = {str(recruiter_id)}
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response
