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
    current_app.logger.info('PUT /community route')
    cust_info = request.json
    cust_id = cust_info['id']
    first = cust_info['first_name']
    last = cust_info['last_name']
    company = cust_info['company']

    query = 'UPDATE customers SET first_name = %s, last_name = %s, company = %s where id = %s'
    data = (first, last, company, cust_id)
    cursor = db.get_db().cursor()
    r = cursor.execute(query, data)
    db.get_db().commit()
    return 'profile updated!'


# Archive completed tickets
@tech_support_analyst.route('/tickets/<int:ticket_id>', methods=['DELETE'])
def archive_ticket(ticket_id):
    ticket = TicketModel.query.filter_by(id=ticket_id, status="completed").first()
    if not ticket:
        return {"error": "Ticket not found or not completed"}, 404
    db.session.delete(ticket)
    db.session.commit()
    return {"message": "Ticket archived successfully"}, 200