from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

community = Blueprint('community', __name__)

@community.route('/community/<communityid>/housing', methods=['GET'])
# route for retrieving carpools for the students in the same community
def community_housing():
    query = '''
    SELECT s.Name, s.Major, s.Company, s.Location, s.HousingStatus, s.Budget, s.LeaseDuration, s.Cleanliness, s.LifeStyle, s.Bio, s.CommunityID
    FROM Student s
    JOIN Community c ON s.CommunityID=c.CommunityID
    WHERE s.CommunityID = %s;
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

@community.route('/community', methods=['GET'])
# route for retrieving carpools for the students in the same community
def community_all():
    query = '''
    SELECT *
    FROM Student;
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response






