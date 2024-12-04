from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

# Kevin routes 

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
    
    params = [communityid]  

    if cleanliness_filter is not None:
        query += ' AND s.Cleanliness >= %s'
        params.append(cleanliness_filter)

    if lease_duration_filter and lease_duration_filter != "Any":
        query += ' AND s.LeaseDuration = %s'
        params.append(lease_duration_filter)

    if budget_filter is not None:
        query += ' AND s.Budget <= %s'
        params.append(budget_filter)

    cursor = db.get_db().cursor()
    cursor.execute(query, tuple(params))  
    theData = cursor.fetchall()
    
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response


@community.route('/community/<communityid>/carpool', methods=['GET'])
def community_carpool(communityid):
    time_filter = request.args.get('commute_time', type=int)
    days_filter = request.args.get('commute_days', type=int)

    # Base query
    query = '''
    SELECT s.Name, s.Major, s.Company, c.Location, s.CarpoolStatus, s.Budget, s.CommuteTime, s.CommuteDays, s.Bio
    FROM Student s
    JOIN CityCommunity c ON s.CommunityID=c.CommunityID
    WHERE c.Location = %s
    '''
    params = [communityid]  

    # Append filters conditionally
    if time_filter is not None:
        query += ' AND s.CommuteTime <= %s'
        params.append(time_filter)

    if days_filter is not None:
        query += ' AND s.CommuteDays <= %s'
        params.append(days_filter)

    # Execute the query
    cursor = db.get_db().cursor()
    cursor.execute(query, tuple(params))  
    theData = cursor.fetchall()
    
    # Format the response
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

# retrieve kevin's profile
@community.route('/profile/<name>', methods=['GET'])
def get_profile(name):
    query = '''
    SELECT *
    FROM Student s
    JOIN CityCommunity c
    WHERE s.Name = %s
    '''
    # Execute the query
    cursor = db.get_db().cursor()
    cursor.execute(query, (name, ))  
    theData = cursor.fetchall()
    
    # Format the response
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

# 
@community.route('/profile', methods=['POST'])
def create_profile():

    the_data = request.json
    current_app.logger.info(the_data)

    name = the_data.get('Name', None)
    major = the_data.get('Major', None)
    company = the_data.get('Company', None)
    location = the_data.get('Location', None)
    housing_status = the_data.get('HousingStatus', None)
    carpool_status = the_data.get('CarpoolStatus', None)
    #budget = the_data.get('Budget', float('nan'))
    lease_duration = the_data.get('LeaseDuration', None)
    #cleanliness = the_data.get('Cleanliness', None)
    #lifestyle = the_data.get('Lifestyle', None)
    #commute_time = the_data.get('CommuteTime', None)
    #commute_days = the_data.get('CommuteDays', None)
    bio = the_data.get('Bio', None)

    query = '''
    INSERT INTO Student (Name, Major, Company, Location, HousingStatus, CarpoolStatus,
                            LeaseDuration, Bio)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
    '''
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query, (name, major, company, location, housing_status, carpool_status, lease_duration, bio))
    db.get_db().commit()
    
    response = make_response("Successfully added product")
    response.status_code = 200
    return response


    











