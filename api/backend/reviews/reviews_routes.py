from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

reviews = Blueprint('reviews', __name__)

#------------------------------------------------------------
# Get all the reviews
#------------------------------------------------------------
@reviews.route('/reviews', methods=['GET'])
def get_all_reviews():
    query = '''
        SELECT jobListingId as 'Job Listing ID', anonymous as Anonymous, description as Descriotion, jobSatisfaction as 'Job Satisfaction', hourlyWage as 'Hourly Wage'
        FROM review
        WHERE deleted = false
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

#------------------------------------------------------------
# Get all reviews for a job listing
#------------------------------------------------------------
@reviews.route('/reviews/<job_listing_id>', methods=['GET'])
def get_reviews_by_job_listing(job_listing_id):
    query = f'''
        SELECT jobListingId as 'Job Listing ID', anonymous as Anonymous, description as Description, jobSatisfaction as 'Job Satisfaction', hourlyWage as 'Hourly Wage', S.name as 'Student Name'
        FROM review
        JOIN student S ON review.studentId = S.studentId
        WHERE jobListingId = '{str(job_listing_id)}' AND deleted = false
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response


#------------------------------------------------------------
# Get all reviews by a student
#------------------------------------------------------------
@reviews.route('/reviews/student/<student_id>', methods=['GET'])
def get_reviews_by_student(student_id):
    query = f'''
        SELECT jobListingId as 'Job Listing ID', anonymous as Anonymous, description as Description, jobSatisfaction as 'Job Satisfaction', hourlyWage as 'Hourly Wage', S.name as 'Student Name'
        FROM review
        JOIN student S ON review.studentId = S.studentId
        WHERE review.studentId = '{str(student_id)}' AND deleted = false
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

#------------------------------------------------------------
# Add a review
#------------------------------------------------------------
@reviews.route('/review', methods=['POST'])
def add_review():
    data = request.json
    description = data['description']
    jobSatisfaction = data['jobSatisfaction']
    hourlyWage = data['hourlyWage']
    anonymous = data['anonymous']
    jobListingId = data['jobListingId']
    studentId = data['studentId']
    
    query = f'''
        INSERT INTO review (description, jobSatisfaction, hourlyWage, anonymous, jobListingId, studentId)
        VALUES ('{description}', {jobSatisfaction}, '{hourlyWage}', {anonymous}, '{jobListingId}', '{studentId}')
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    response = make_response(jsonify({"message": "Review added."}))
    response.status_code = 200
    return response