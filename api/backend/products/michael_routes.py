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
    

# This is a POST route to add a new product.
# Remember, we are using POST routes to create new entries
# in the database. 
@tech_support_analyst.route('/chats', methods=['POST'])
def add_new_chats():
    
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
    # TODO: Make sure the version of the query above works properly
    # Constructing the query
    # query = 'insert into products (product_name, description, category, list_price) values ("'
    # query += name + '", "'
    # query += description + '", "'
    # query += category + '", '
    # query += str(price) + ')'
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    response = make_response("Successfully initiated chat")
    response.status_code = 200
    return response

# Mark a ticket as completed or update its status
@tech_support_analyst.route('/logs/{user_id}', methods = ['PUT'])
def update_logs():
    logs_info = request.json
    if not logs_info:
        return {"error": "Invalid JSON payload"}, 400
    current_app.logger.info(f"Updating logs for user {user_id}: {logs_info}")
    return {"message": "Logs updated successfully"}, 200


# Archive completed tickets
@tech_support_analyst.route('/tickets/<int:ticket_id>', methods=['DELETE'])
def archive_ticket(ticket_id):
    ticket = TicketModel.query.filter_by(id=ticket_id, status="completed").first()
    if not ticket:
        return {"error": "Ticket not found or not completed"}, 404
    db.session.delete(ticket)
    db.session.commit()
    return {"message": "Ticket archived successfully"}, 200