from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

community = Blueprint('community', __name__)

@community.route('/community/<community_id>', methods=['GET'])
# route for retrieving students in the same community
def get_community_students():
    query = '''

    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

@community.route('/community')