from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

community = Blueprint('community', __name__)

@community.route('/community/<communityid>/housing', methods=['GET'])
# route for retrieving housing for the students in the same community
def community_housing(communityid):
    query = '''
    SELECT s.Name, s.Major, s.Company, c.Location, s.HousingStatus, s.Budget, s.LeaseDuration, s.Cleanliness, s.Lifestyle, s.Bio
    FROM Student s
    JOIN CityCommunity c ON s.CommunityID=c.CommunityID
    WHERE c.Location = %s;
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (communityid,))
    theData = cursor.fetchall()
    
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

@community.route('/community/<communityid>/carpool', methods=['GET'])
# route for retrieving carpools for the students in the same community
def community_carpool(communityid):
    query = '''
    SELECT s.Name, s.Major, s.Company, c.Location, s.CarpoolStatus, s.Budget, s.CommuteTime, s.CommuteDays, s.Bio
    FROM Student s
    JOIN CityCommunity c ON s.CommunityID=c.CommunityID
    WHERE c.Location = %s;
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (communityid,))
    theData = cursor.fetchall()
    
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response










