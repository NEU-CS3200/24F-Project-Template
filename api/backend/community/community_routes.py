from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

community = Blueprint('community', __name__)

@community.route('/community/<communityid>/housing', methods=['GET'])
# Route for retrieving housing for students in the same community
def community_housing(communityid):
    cleanliness_filter = request.args.get('cleanliness', type=int)
    lease_duration_filter = request.args.get('lease_duration', type=str)
    budget_filter = request.args.get('budget', type=int)
    
    # Base query
    query = '''
    SELECT s.Name, s.Major, s.Company, c.Location, s.HousingStatus, s.Budget, s.LeaseDuration, s.Cleanliness, s.Lifestyle, s.Bio
    FROM Student s
    JOIN CityCommunity c ON s.CommunityID=c.CommunityID
    WHERE c.Location = %s
    '''
    
    params = [communityid]  # initial params with communityid

    # Add filters based on cleanliness and lease_duration if they are provided
    if cleanliness_filter is not None:
        query += ' AND s.Cleanliness >= %s'
        params.append(cleanliness_filter)

    if lease_duration_filter and lease_duration_filter != "Any":
        query += ' AND s.LeaseDuration = %s'
        params.append(lease_duration_filter)
    
    if budget_filter is not None:
        query += ' AND s.Budget <= %s'
        params.append(budget_filter)

    # Execute the query with the parameters
    cursor = db.get_db().cursor()
    cursor.execute(query, tuple(params))
    theData = cursor.fetchall()
    
    # Prepare and return the response
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










