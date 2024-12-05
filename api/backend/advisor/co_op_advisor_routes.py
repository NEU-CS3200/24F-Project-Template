from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from datetime import datetime

from backend.db_connection import db

advisor = Blueprint('advisor', __name__)


@advisor.route('/advisor/tasks', methods=['GET'])
def get_all_tasks():
    query = '''
    SELECT 
        t.TaskID,
        s.StudentID,
        s.Name as student_name,
        t.Status as task_status,
        t.Description,
        t.Reminder,
        t.DueDate
    FROM Task t
    JOIN Student s ON t.AssignedTo = s.StudentID
    ORDER BY t.DueDate ASC


        '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()
    response = make_response(jsonify(theData))
    response.status_code = 200
    return response



@advisor.route('/advisor/notifications', methods=['GET'])
def get_notifications():
    try:
        cursor = db.get_db().cursor()
        query = '''
        SELECT 
            s.Name as student_name,
            t.Status as notification_status,
            t.Reminder as date_assigned,
            t.Description as description
        FROM Task t
        JOIN Student s ON t.AssignedTo = s.StudentID
        ORDER BY t.Reminder DESC
        '''
        cursor.execute(query)
        theData = cursor.fetchall()
        
        response = make_response(jsonify(theData))
        response.status_code = 200
        return response
    except Exception as e:
        print(f"Database error: {str(e)}")
        return jsonify({'error': 'Failed to fetch notifications'}), 500



@advisor.route('/advisor/tasks/<task_id>', methods=['PUT'])
def update_task_status(task_id):
    try:
        # Parse JSON data from request
        data = request.json
        new_status = data.get('status')

        # Validate that status is provided
        if not new_status:
            return make_response(jsonify({"error": "Status is required"}), 400)

        # Build the SQL query to update the task status
        query = '''
            UPDATE Task
            SET Status = %s
            WHERE TaskID = %s
        '''
        values = (new_status, task_id)

        # Execute the query
        cursor = db.get_db().cursor()
        cursor.execute(query, values)
        
        # Check if any rows were affected
        if cursor.rowcount == 0:
            db.get_db().rollback()
            return make_response(jsonify({
                "error": f"No task found with ID {task_id}"
            }), 404)
            
        db.get_db().commit()
        print(f"Successfully updated status for task {task_id} to {new_status}")  # Debug log

        # Return success response
        return make_response(jsonify({
            "message": "Task status updated successfully",
            "task_id": task_id,
            "new_status": new_status
        }), 200)

    except Exception as e:
        print(f"Error updating task status: {str(e)}")  # Debug log
        db.get_db().rollback()
        return make_response(jsonify({"error": str(e)}), 500)


@advisor.route('/advisor/tasks/<task_id>/reminder', methods=['PUT'])
def update_task_reminder(task_id):
    try:
        # Get the new reminder date from request body
        data = request.get_json()
        new_reminder = data.get('reminder')
        
        # Validate the reminder date format
        try:
            # Convert string to datetime object to validate format
            reminder_date = datetime.strptime(new_reminder, '%Y-%m-%d')
        except ValueError:
            return jsonify({
                'error': 'Invalid date format. Please use YYYY-MM-DD format'
            }), 400

        # Update using the correct column name (Reminder)
        query = '''
        UPDATE Task 
        SET Reminder = %s
        WHERE TaskID = %s
        '''
        cursor = db.get_db().cursor()
        cursor.execute(query, (reminder_date, task_id))
        db.get_db().commit()

        return jsonify({
            'message': 'Task reminder updated successfully',
            'task_id': task_id,
            'new_reminder': new_reminder
        }), 200

    except Exception as e:
        db.get_db().rollback()
        return jsonify({'error': str(e)}), 500


@advisor.route('/advisor/events', methods=['POST'])
def create_event():
    try:
        data = request.get_json()
        print("Received data:", data)  # Log the received data
        
        query = '''
        INSERT INTO Events (
            CommunityID,
            Date,
            Name,
            Description
        ) VALUES (%s, %s, %s, %s)
        '''
        
        cursor = db.get_db().cursor()
        print("Executing query:", query)  # Log the query
        cursor.execute(query, (
            data.get('community_id'),
            data.get('date'),
            data.get('name'),
            data.get('description')
        ))
        db.get_db().commit()
        print("Event created successfully")  # Log success
        
        return jsonify({
            'message': 'Event created successfully'
        }), 201

    except Exception as e:
        print(f"Error creating event: {str(e)}")  # Log the error
        db.get_db().rollback()
        return jsonify({'error': str(e)}), 500

@advisor.route('/advisor/events/<event_id>', methods=['PUT'])
def update_event(event_id):
    try:
        data = request.get_json()
        
        query = '''
        UPDATE Events 
        SET CommunityID = %s,
            Date = %s,
            Name = %s,
            Description = %s
        WHERE EventID = %s
        '''
        
        cursor = db.get_db().cursor()
        cursor.execute(query, (
            data.get('community_id'),
            data.get('date'),
            data.get('name'),
            data.get('description'),
            event_id
        ))
        db.get_db().commit()
        
        return jsonify({
            'message': 'Event updated successfully'
        }), 200

    except Exception as e:
        db.get_db().rollback()
        return jsonify({'error': str(e)}), 500

@advisor.route('/advisor/events/<event_id>', methods=['DELETE'])
def delete_event(event_id):
    try:
        query = '''
        DELETE FROM Events 
        WHERE EventID = %s
        '''
        
        cursor = db.get_db().cursor()
        cursor.execute(query, (event_id,))
        db.get_db().commit()
        
        return jsonify({
            'message': 'Event deleted successfully'
        }), 200

    except Exception as e:
        db.get_db().rollback()
        return jsonify({'error': str(e)}), 500

@advisor.route('/advisor/events/<event_id>', methods=['GET'])
def get_event(event_id):
    try:
        query = '''
        SELECT 
            EventID,
            CommunityID,
            Date,
            Name,
            Description
        FROM Events 
        WHERE EventID = %s
        '''
        
        cursor = db.get_db().cursor()
        cursor.execute(query, (event_id,))
        event = cursor.fetchone()
        
        if event:
            # Convert the result to a dictionary with proper keys
            event_dict = {
                'EventID': event['EventID'],
                'CommunityID': event['CommunityID'],
                'Date': event['Date'].strftime('%Y-%m-%d') if event['Date'] else None,
                'Name': event['Name'],
                'Description': event['Description']
            }
            return jsonify(event_dict), 200
        else:
            return jsonify({'error': 'Event not found'}), 404

    except Exception as e:
        print(f"Error fetching event: {str(e)}")  # Add debugging
        return jsonify({'error': str(e)}), 500




