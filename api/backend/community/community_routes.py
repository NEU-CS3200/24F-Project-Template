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

    query = '''
    SELECT s.Name, s.Major, s.Company, c.Location, s.CarpoolStatus, s.Budget, s.CommuteTime, s.CommuteDays, s.Bio
    FROM Student s
    JOIN CityCommunity c ON s.CommunityID=c.CommunityID
    WHERE c.Location = %s
    '''
    params = [communityid]  

    if time_filter is not None:
        query += ' AND s.CommuteTime <= %s'
        params.append(time_filter)

    if days_filter is not None:
        query += ' AND s.CommuteDays <= %s'
        params.append(days_filter)


    cursor = db.get_db().cursor()
    cursor.execute(query, tuple(params))  
    theData = cursor.fetchall()

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

# kevins profile - update
@community.route('/profile', methods=['PUT'])
def update_profile():
    the_data = request.json
    current_app.logger.info(the_data)

    company = the_data.get('Company')
    location = the_data.get('Location')
    housing_status = the_data.get('HousingStatus')
    carpool_status = the_data.get('CarpoolStatus')
    lease_duration = the_data.get('LeaseDuration')
    budget = the_data.get('Budget')
    cleanliness = the_data.get('Cleanliness')
    lifestyle = the_data.get('Lifestyle')
    time = the_data.get('CommuteTime')
    days = the_data.get('CommuteDays')
    bio = the_data.get('Bio')

    query = '''
    UPDATE Student
    SET Company = %s, Location = %s, HousingStatus = %s,
        CarpoolStatus = %s, Budget = %s, LeaseDuration = %s, 
        Cleanliness = %s, Lifestyle=%s, CommuteTime=%s, CommuteDays=%s, Bio = %s
    WHERE Name = 'Kevin Chen'
    '''
    
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query, (company, location, housing_status, carpool_status, budget, lease_duration, cleanliness, lifestyle, time, days, bio))
    db.get_db().commit()

    response = make_response({"message": "Profile updated successfully"})
    response.status_code = 200
    return response

# obtain housing resources based on location
@community.route('/community/<community_id>/housing-resources', methods=['GET'])
def get_feedback(community_id):
    query = '''
    SELECT * FROM
    CityCommunity c
    JOIN Housing h
    ON c.CommunityID=h.CommunityID
    WHERE c.Location = %s
    '''
    # Execute the query
    cursor = db.get_db().cursor()
    cursor.execute(query, (community_id, ))  
    theData = cursor.fetchall()
    
    # Format the response
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

# route to provide feedback to advisor
@community.route('/feedback', methods=['POST'])

