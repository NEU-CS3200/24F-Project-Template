from flask import Blueprint
from flask import request, jsonify, make_response, current_app
from backend.db_connection import db

# create a blueprint for engagement analytics
engagement_analytics = Blueprint('engagement_analytics', __name__)

# ------------------------------------------------------------
# Get all engagement analytics data
@engagement_analytics.route('/engagementAnalytics', methods=['GET'])
def get_all_engagement_analytics():
    query = '''
        SELECT AnalyticsID, 
               Feature, 
               Date, 
               UsageCount 
        FROM engagementAnalytics
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

# ------------------------------------------------------------
# get engagement analytics for a specific feature
@engagement_analytics.route('/engagementAnalytics/feature/<feature>', methods=['GET'])
def get_analytics_by_feature(feature):
    query = f'''
        SELECT AnalyticsID, 
               Feature, 
               Date, 
               UsageCount 
        FROM engagementAnalytics
        WHERE Feature = '{feature}'
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    
    current_app.logger.info(f'GET /engagementAnalytics/feature/{feature} - Results: {theData}')
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

# ------------------------------------------------------------
# get engagement analytics for a specific date range
@engagement_analytics.route('/engagementAnalytics/date', methods=['GET'])
def get_analytics_by_date():
    start_date = request.args.get('start_date')
    end_date = request.args.get('end_date')
    
    if not start_date or not end_date:
        response = make_response("start_date and end_date query parameters are required", 400)
        return response
    
    query = f'''
        SELECT AnalyticsID, 
               Feature, 
               Date, 
               UsageCount 
        FROM engagementAnalytics
        WHERE Date BETWEEN '{start_date}' AND '{end_date}'
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    
    current_app.logger.info(f'GET /engagementAnalytics/date - Query: {query} - Results: {theData}')
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

# ------------------------------------------------------------
# add a new engagement analytics record
@engagement_analytics.route('/engagementAnalytics', methods=['POST'])
def add_engagement_analytics():
    the_data = request.json
    current_app.logger.info(the_data)

    feature = the_data['Feature']
    date = the_data['Date']
    usage_count = the_data['UsageCount']
    
    query = f'''
        INSERT INTO engagementAnalytics (Feature, Date, UsageCount)
        VALUES ('{feature}', '{date}', {usage_count})
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    response = make_response("Successfully added analytics record")
    response.status_code = 201
    return response

# ------------------------------------------------------------
# update an engagement analytics record
@engagement_analytics.route('/engagementAnalytics/<analytics_id>', methods=['PUT'])
def update_engagement_analytics(analytics_id):
    the_data = request.json
    current_app.logger.info(the_data)
    
    feature = the_data.get('Feature')
    date = the_data.get('Date')
    usage_count = the_data.get('UsageCount')
    
    updates = []
    if feature:
        updates.append(f"Feature = '{feature}'")
    if date:
        updates.append(f"Date = '{date}'")
    if usage_count:
        updates.append(f"UsageCount = {usage_count}")
    
    if not updates:
        response = make_response("No fields provided for update", 400)
        return response
    
    query = f'''
        UPDATE engagementAnalytics
        SET {", ".join(updates)}
        WHERE AnalyticsID = {analytics_id}
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    response = make_response("Successfully updated analytics record")
    response.status_code = 200
    return response

# ------------------------------------------------------------
# delete an engagement analytics record
@engagement_analytics.route('/engagementAnalytics/<analytics_id>', methods=['DELETE'])
def delete_engagement_analytics(analytics_id):
    query = f'''
        DELETE FROM engagementAnalytics
        WHERE AnalyticsID = {analytics_id}
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    response = make_response("Successfully deleted analytics record")
    response.status_code = 200
    return response