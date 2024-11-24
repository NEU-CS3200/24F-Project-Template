from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

job_listings = Blueprint('job_listings', __name__)

#------------------------------------------------------------
# Get all the job_listings
#------------------------------------------------------------
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

#------------------------------------------------------------
# Get all job listings for a company
#------------------------------------------------------------
@job_listings.route('/job_listing/<company_id>', methods=['GET'])
def get_job_listing_by_company(company_id):
    query = f'''
        SELECT jobTitle, description, startDate, endDate, hourlyWage, skills, location
        FROM jobListing
        WHERE companyId = {str(company_id)} AND deleted = false
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

#------------------------------------------------------------
# Get all deleted job_listings
#------------------------------------------------------------
@job_listings.route('/job_listings/deleted', methods=['GET'])
def get_deleted_job_listings():
    query = '''
        SELECT jobTitle, description, startDate, endDate, hourlyWage, skills, location
        FROM jobListing
        WHERE deleted = true
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

#------------------------------------------------------------
# Get all job listings created by a specific recruiter
#------------------------------------------------------------
@job_listings.route('/job_listing/<recruiter_id>', methods=['GET'])
def get_job_listing_by_recruiter(recruiter_id):
    query = f'''
        SELECT jobTitle, description, startDate, endDate, hourlyWage, skills, location
        FROM jobListing
        WHERE recruiterId = {str(recruiter_id)} AND deleted = false
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

#------------------------------------------------------------
# Get job_listing by id
#------------------------------------------------------------
@job_listings.route('/job_listing/<job_listing_id>', methods=['POST'])
def toggle_delete_job_listing(job_listing_id):
    query_select = f'''
        SELECT deleted
        FROM jobListing
        WHERE jobListingId = {str(job_listing_id)}
    '''
    
    # Fetch the current deleted state
    cursor = db.get_db().cursor()
    cursor.execute(query_select)
    current_state = cursor.fetchone()
    
    if current_state is None:
        response = make_response(jsonify({'error': 'Job Listing not found'}))
        response.status_code = 404
        return response

    # Toggle the deleted state
    new_state = not current_state[0]
    query_update = f'''
        UPDATE jobListing
        SET deleted = {str(new_state).lower()}
        WHERE jobListingId = {str(job_listing_id)}
    '''
    
    cursor.execute(query_update)
    db.get_db().commit()

    action = 'deleted' if new_state else 'undeleted'
    
    response = make_response(jsonify({'message': f'Job Listing {action}'}))
    response.status_code = 200
    return response


#------------------------------------------------------------
# Companies Section
#------------------------------------------------------------

#------------------------------------------------------------
# Get all companies
#------------------------------------------------------------
@job_listings.route('/companies', methods=['GET'])
def get_all_companies():
    query = '''
        SELECT name, headline, description, websiteLink
        FROM company
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response