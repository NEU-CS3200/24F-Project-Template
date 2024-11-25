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
        SELECT J.jobListingId as 'Job Listing ID', J.jobTitle as 'Job Title', J.description as Description, J.startDate as 'Start Date', J.endDate as 'End Date', J.hourlyWage as 'Hourly Wage', J.skills as 'Skills', J.location as 'Location', C.name as Company, C.companyId as 'Company ID'
        FROM jobListing J
        JOIN company C ON J.companyId = C.companyId
        WHERE deleted = false
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

#------------------------------------------------------------
# Get a single job listing
#------------------------------------------------------------
@job_listings.route('/job_listing/<job_listing_id>', methods=['GET'])
def get_job_listing_by_company(job_listing_id):
    query = f'''
        SELECT J.jobListingId as 'Job Listing ID', J.jobTitle as 'Job Title', J.description as Description, J.startDate as 'Start Date', J.endDate as 'End Date', J.hourlyWage as 'Hourly Wage', J.skills as 'Skills', J.location as 'Location', C.name as Company, C.companyId as 'Company ID'
        FROM jobListing J
        JOIN company C ON J.companyId = C.companyId
        WHERE J.jobListingId = '{str(job_listing_id)}' AND deleted = false
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchone()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

#------------------------------------------------------------
# Get all job listings for a company
#------------------------------------------------------------
@job_listings.route('/job_listings/company/<company_id>', methods=['GET'])
def get_job_listings_by_company(company_id):
    query = f'''
        SELECT J.jobListingId as 'Job Listing ID', J.jobTitle as 'Job Title', J.description as Description, J.startDate as 'Start Date', J.endDate as 'End Date', J.hourlyWage as 'Hourly Wage', J.skills as 'Skills', J.location as 'Location', C.name as Company, C.companyId as 'Company'
        FROM jobListing J
        JOIN company C ON J.companyId = C.companyId
        WHERE C.companyId = '{str(company_id)}' AND deleted = false
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchmany()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response


#------------------------------------------------------------
# Toggle job_listing is deleted
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
        SELECT name as Name, headline as Headline, description as Description, websiteLink as 'Website Link', companyId as 'Company ID'
        FROM company
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

#------------------------------------------------------------
# Get a single company
#------------------------------------------------------------
@job_listings.route('/company/<company_id>', methods=['GET'])
def get_company_by_id(company_id):
    query = f'''
        SELECT name as Name, headline as Headline, description as Description, websiteLink as 'Website Link', companyId as 'Company ID'
        FROM company
        WHERE companyId = '{str(company_id)}'
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchone()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response