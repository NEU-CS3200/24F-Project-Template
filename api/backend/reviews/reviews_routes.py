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
        SELECT jobListingId as 'Job Listing ID', anonymous as Anonymous, description as Descriotion, jobSatisfaction as 'Job Satisfaction', hourlyWage as 'Hourly Wage'
        FROM review
        WHERE jobListingId = {str(job_listing_id)} AND deleted = false
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

#------------------------------------------------------------
# Get all reviews created by a specific student
#------------------------------------------------------------
@reviews.route('/reviews/<student_id>', methods=['GET'])
def get_reviews_by_student(student_id):
    query = f'''
        SELECT jobListingId as 'Job Listing ID', anonymous as Anonymous, description as Descriotion, jobSatisfaction as 'Job Satisfaction', hourlyWage as 'Hourly Wage'
        FROM review
        WHERE studentId = {str(student_id)} AND deleted = false
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

#------------------------------------------------------------
# Get all deleted reviews
#------------------------------------------------------------
@reviews.route('/reviews/deleted', methods=['GET'])
def get_deleted_reviews():
    query = '''
        SELECT jobListingId, anonymous, description, jobSatisfaction, hourlyWage
        FROM review
        WHERE deleted = true
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

#------------------------------------------------------------
# Get review by id
#------------------------------------------------------------
@reviews.route('/review/<review_id>', methods=['POST'])
def toggle_delete_review(review_id):
    query_select = f'''
        SELECT deleted
        FROM review
        WHERE reviewId = {str(review_id)}
    '''
    
    # Fetch the current deleted state
    cursor = db.get_db().cursor()
    cursor.execute(query_select)
    current_state = cursor.fetchone()
    
    if current_state is None:
        response = make_response(jsonify({'error': 'Review not found'}))
        response.status_code = 404
        return response

    # Toggle the deleted state
    new_state = not current_state[0]
    query_update = f'''
        UPDATE review
        SET deleted = {str(new_state).lower()}
        WHERE reviewId = {str(review_id)}
    '''
    
    cursor.execute(query_update)
    db.get_db().commit()

    action = 'deleted' if new_state else 'undeleted'
    response = make_response(jsonify(f'Review {action} successfully'))
    response.status_code = 200
    return response
