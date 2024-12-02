from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

commmunity = Blueprint('community', __name__)

@community.route('/community/<community_id>/housing', methods=['GET'])
# route for retrieving carpools for the students in the same community
def community_housing():
    query = '''
    SELECT s.Name, s.Major, s.Company, s.Location, s.HousingStatus, s.Budget, s.LeaseDuration, s.Cleanliness, s.LifeStyle, s.Bio, s.CommunityID
    FROM Student s
    JOIN Community c ON s.CommunityID=c.CommunityID
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

@community.route('/community/<community_id>/carpool', methods=['GET'])
# route for retrieving carpools for the students in the same community
def community_housing():
    query = '''

    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

@community.route('/community/<community_id>/housing', methods=['PUT'])
# route to update student profiles -- CODE NOT UPDATED YET
def update_profile():
    current_app.logger.info('PUT /community/<community_id>/housing route')
    cust_info = request.json
    cust_id = cust_info['id']
    first = cust_info['first_name']
    last = cust_info['last_name']
    company = cust_info['company']

    query = 'UPDATE customers SET first_name = %s, last_name = %s, company = %s where id = %s'
    data = (first, last, company, cust_id)
    cursor = db.get_db().cursor()
    r = cursor.execute(query, data)
    db.get_db().commit()
    return 'profile updated!'

@products.route('/product', methods=['POST'])
def add_new_product():
    
    # In a POST request, there is a 
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    name = the_data['product_name']
    description = the_data['product_description']
    price = the_data['product_price']
    category = the_data['product_category']
    
    #INSERT statement
    query = f'''
        INSERT INTO products (product_name,
                              description,
                              category, 
                              list_price)
        VALUES ('{name}', '{description}', '{category}', {str(price)})
    '''
 
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    response = make_response("Successfully added product")
    response.status_code = 200
    return response



