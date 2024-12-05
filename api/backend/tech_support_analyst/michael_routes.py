from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from datetime import datetime
from backend.db_connection import db


tech_support_analyst = Blueprint('tech_support_analyst', __name__)

# View real-time diagnostics on app performance 
@tech_support_analyst.route('/SystemLog', methods=['GET'])
def get_SystemLog():
    query = '''
        SELECT LogID, 
               TicketID, 
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

    # test
    
    # Convert the fetched data (list of tuples) to a list of dictionaries
    column_names = ["LogID", "TicketID", "Timestamp", "Activity", "MetricType", "Privacy", "Security"]
    formatted_data = [dict(zip(column_names, row)) for row in theData]
    
    # Return the formatted data as JSON
    response = make_response(jsonify(formatted_data))
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
        FROM Ticket
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
    
    # In a POST request, collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    # Extracting the variables
    user_id = 1
    issue = the_data['IssueType']
    status = the_data['Status']
    priority = the_data['Priority']
    received = the_data['ReceivedDate']
    resolved = the_data.get('ResolvedDate', None)

    query = '''
        INSERT INTO Ticket (UserID, IssueType, Status, Priority, ReceivedDate, ResolvedDate)
        VALUES (%s, %s, %s, %s, %s, %s)
    '''
    data = (user_id, issue, status, priority, received, resolved)

    cursor = db.get_db().cursor()
    cursor.execute(query, data)
    db.get_db().commit()
    
    # Building a response
    response = make_response("Ticket successfully created!")
    response.status_code = 200
    return response

# Mark a ticket as completed or update its status
@tech_support_analyst.route('/tickets', methods = ['PUT'])
def update_tickets():
    current_app.logger.info('PUT /tickets route')
    the_data = request.json
    ticket_id = the_data['TicketID']
    status = the_data['Status']
    priority = the_data['Priority']
    resolved = the_data['ResolvedDate']

    # Build the SQL query
    update_fields = []
    params = []
    if status:
        update_fields.append("Status = %s")
        params.append(status)
    if priority:
        update_fields.append("Priority = %s")
        params.append(priority)
    if resolved:
        update_fields.append("ResolvedDate = %s")
        params.append(resolved)

    if not update_fields:
        return 'No valid fields to update', 400

    # Add TicketID to parameters
    params.append(ticket_id)

    # Prepare the SQL query
    query = f'UPDATE Ticket SET {", ".join(update_fields)} WHERE TicketID = %s'

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
    try:
        query = '''
        DELETE FROM Ticket WHERE TicketID = %s
        '''
        cursor = db.get_db().cursor()
        cursor.execute(query, ticket_id)
        db.get_db().commit()

        if cursor.rowcount == 0:
                response = make_response(jsonify({
                    "error": "No feedback entry found for the given student ID and feedback ID."
                }))
                response.status_code = 404
                return response
        
        response = make_response(jsonify({"message": "Feedback entry deleted successfully."}))
        response.status_code = 200
        return response
    except Exception as e:
        response = make_response(jsonify({"error": str(e)}))
        response.status_code = 500
        return response



