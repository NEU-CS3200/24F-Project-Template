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

#------------------------------------------------------------
# Gets all the reviews for an advisors students
#------------------------------------------------------------
@management.route('/advisor/<advisor_id>', methods=['GET'])
def get_students_reviews(advisor_id):
    query = f'''
        SELECT jobListingId, anonymous, description, jobSatisfaction, hourlyWage
        FROM review
        JOIN student ON review.studentId = student.studentId
        WHERE advisorId = {str(advisor_id)} AND deleted = false
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response