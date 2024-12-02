from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db


tech_support_analyst = Blueprint('tech_support_analyst', __name__)

# View real-time diagnostics on app performance 
@tech_support_analyst.route('/SystemLog', methods=['GET'])
def get_SystemLog():
    query = '''
        SELECT  TicketID, 
                Timestamp, 
                Activity, 
                MetricType, 
                Privacy,
                Security 
        FROM SystemLog
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

# Review user activity logs for troubleshooting
@tech_support_analyst.route('/SystemHealth', methods=['GET'])
def get_SystemHealth():
    query = '''
        SELECT  LogID, 
                Timestamp, 
                Status, 
                MetricType
        FROM SystemLog
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

# View all tickets and their statuses
@tech_support_analyst.route('/tickets', methods=['GET'])
def get_tickets():
    query = '''
        SELECT  TicketID, 
                UserID, 
                IssueType, 
                Status, 
                Priority,
                ReceivedDate,
                ResolvedDate 
        FROM ticket
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response
    

# Create a new ticket or prioritize tickets
@tech_support_analyst.route('/tickets', methods=['POST'])
def add_new_tickets():
    
    # In a POST request, there is a 
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    name = the_data['product_name']
    content = the_data['chat_content']
    time = the_data['chat_time']
    category = the_data['product_category']
    
    query = f'''
        INSERT INTO products (product_name,
                              description,
                              category, 
                              list_price)
        VALUES ('{name}', '{content}', '{category}', {str(time)})
    '''

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    response = make_response("Successfully initiated chat")
    response.status_code = 200
    return response

# Mark a ticket as completed or update its status
@tech_support_analyst.route('/tickets', methods = ['PUT'])
def update_tickets():
    logs_info = request.json
    if not logs_info:
        return {"error": "Invalid JSON payload"}, 400
    current_app.logger.info(f"Updating logs for user {user_id}: {logs_info}")
    return {"message": "Logs updated successfully"}, 200

@tech_support_analyst.route('/tickets', methods = ['PUT'])
def update_tickets():
    current_app.logger.info('PUT /tickets route')
    ticket_info = request.json
    ticket_id = ticket_info['TicketID']
    timestamp = ticket_info.get('Timestamp')
    activity = ticket_info.get('Activity')
    metric_type = ticket_info.get('MetricType')
    privacy = ticket_info.get('Privacy')
    security = ticket_info.get('Security')

    # Build the SQL query dynamically
    update_fields = []
    params = []
    if timestamp:
        update_fields.append("Timestamp = %s")
        params.append(timestamp)
    if activity:
        update_fields.append("Activity = %s")
        params.append(activity)
    if metric_type:
        update_fields.append("MetricType = %s")
        params.append(metric_type)
    if privacy:
        update_fields.append("Privacy = %s")
        params.append(privacy)
    if security:
        update_fields.append("Security = %s")
        params.append(security)

    if not update_fields:
        return 'No valid fields to update', 400

    # Add TicketID to parameters
    params.append(ticket_id)

    # Prepare the SQL query
    query = f'UPDATE tickets SET {", ".join(update_fields)} WHERE TicketID = %s'

    # Execute the query
    cursor = db.get_db().cursor()
    cursor.execute(query, params)
    db.get_db().commit()

    # Check if the update was successful
    if cursor.rowcount == 0:
        return 'No ticket found with the given TicketID', 404

    return 'Ticket updated successfully!'

# Archive completed tickets
@tech_support_analyst.route('/tickets/<int:ticket_id>', methods=['DELETE'])
def archive_ticket(ticket_id):
    ticket = TicketModel.query.filter_by(id=ticket_id, status="completed").first()
    if not ticket:
        return {"error": "Ticket not found or not completed"}, 404
    db.session.delete(ticket)
    db.session.commit()
    return {"message": "Ticket archived successfully"}, 200