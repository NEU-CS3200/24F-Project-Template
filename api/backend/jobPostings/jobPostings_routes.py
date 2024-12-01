########################################################
# Sample job postings blueprint of endpoints
# Remove this file if you are not using it in your project
########################################################
from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

#------------------------------------------------------------
# Create a new Blueprint object, which is a collection of 
# routes.
jobPostings = Blueprint('jobPostings', __name__)

@jobPostings.route('/jobPostings/<company_id>', methods=['GET'])
def get_jobPostings(company_id):

    cursor = db.get_db().cursor()
    cursor.execute('''SELECT jp.name, jp.description, jp.location, jp.datePosted, cc.firstName, cc.lastName, cc.email, cc.phone
                      FROM job_posting jp
                      JOIN company_contact cc ON jp.contactId = cc.id
                      WHERE jp.companyId = %s''', (company_id,))

    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response