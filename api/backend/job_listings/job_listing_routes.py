from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

#------------------------------------------------------------
# Create a new Blueprint object, which is a collection of 
# routes.
job_listings = Blueprint('job_listings', __name__)

#------------------------------------------------------------
# Get all the job_listings from the database, package them up,
# and return them to the client
@job_listings.route('/job_listings', methods=['GET'])
def get_all_job_listings():
    query = '''
        SELECT jobTitle, description, startDate, endDate, hourlyWage, skills, location
        FROM jobListing
        WHERE deleted = false
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response
