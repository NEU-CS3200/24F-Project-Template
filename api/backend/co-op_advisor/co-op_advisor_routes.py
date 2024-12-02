from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

advisor = Blueprint('advisor', __name__)

@advisor.route('/advisor', methods=['GET'])
# route for retreiving all student profiles
def get_advisor():
    query = '''

    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

@advisor.route('/students/<student_id>/reminders', methods=['GET'])
# route for retrieving recommendation for specific student
def get_students():
    query = '''

    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

@advisor.route('/students/<student_id>/feedback', methods=['GET'])
# route for retrieving feedback for specific student
def get_students():
    query = '''

    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response
