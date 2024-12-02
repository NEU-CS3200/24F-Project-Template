########################################################
# Sample company blueprint of endpoints
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
companies = Blueprint('companies', __name__)

@companies.route('/companies', methods=['GET'])
def get_companies():

    cursor = db.get_db().cursor()
    cursor.execute('''SELECT id, name FROM companies
    ''')
    
    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response

@companies.route('/companiesSpecific', methods=['GET'])
def get_companiesSpecific():

    cursor = db.get_db().cursor()
    cursor.execute('''SELECT 
    c.name AS CompanyName,
                   c.id as id,
    AVG(r.rating) AS AverageRating
FROM 
    reviews r
JOIN 
    job_posting jp ON r.jobId = jp.id
JOIN 
    companies c ON jp.companyId = c.id
GROUP BY 
    c.name, jp.companyId
ORDER BY 
    averageRating DESC;''')
    
    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response

@companies.route('/companies/<company_id>', methods=['GET'])
def get_company(company_id):

    cursor = db.get_db().cursor()
    cursor.execute('''SELECT 
    students.firstName AS FirstName,
    students.lastName AS LastName,
    reviews.title AS ReviewTitle,
    reviews.content AS ReviewContent,
    reviews.rating
FROM 
    reviews
JOIN 
    job_posting ON reviews.jobId = job_posting.id
JOIN 
    companies ON job_posting.companyId = companies.id
JOIN 
    students ON reviews.studentId = students.id
WHERE companies.id = %s''', (company_id,))
    
    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response

