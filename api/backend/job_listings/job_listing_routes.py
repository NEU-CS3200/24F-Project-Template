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
        SELECT J.jobListingId as 'Job Listing ID', J.jobTitle as 'Job Title', J.description as Description, J.startDate as 'Start Date', J.endDate as 'End Date', J.hourlyWage as 'Hourly Wage', J.skills as 'Skills', J.location as 'Location', C.name as Company, C.companyId as 'Company ID'
        FROM jobListing J
        JOIN company C ON J.companyId = C.companyId
        WHERE J.companyId = '{str(company_id)}' AND deleted = false
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
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
