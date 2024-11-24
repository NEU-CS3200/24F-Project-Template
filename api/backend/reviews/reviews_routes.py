from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

#------------------------------------------------------------
# Create a new Blueprint object, which is a collection of 
# routes.
reviews = Blueprint('reviews', __name__)

#------------------------------------------------------------
# Get all the reviews from the database, package them up,
# and return them to the client
@reviews.route('/reviews', methods=['GET'])
def get_all_reviews():
    query = '''
        SELECT jobListingId, anonymous, description, jobSatisfaction, hourlyWage
        FROM review
        WHERE deleted = false
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response
