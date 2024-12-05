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
        # Get the new status from request body
        data = request.get_json()
        new_status = data.get('status')
        
        # Validate the status
        valid_statuses = ['Pending', 'In Progress', 'Completed', 'Received']
        if new_status not in valid_statuses:
            return jsonify({
                'error': f'Invalid status. Must be one of: {", ".join(valid_statuses)}'
            }), 400

        # Update using the correct column name (Status)
        query = '''
        UPDATE Task 
        SET Status = %s
        WHERE TaskID = %s
        '''
        cursor = db.get_db().cursor()
        cursor.execute(query, (new_status, task_id))
        db.get_db().commit()

        return jsonify({
            'message': 'Task status updated successfully',
            'task_id': task_id,
            'new_status': new_status
        }), 200

    except Exception as e:
        db.get_db().rollback()
        return jsonify({'error': str(e)}), 500


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
        
        query = '''
        INSERT INTO Events (
            CommunityID,
            Date,
            Name,
            Description
        ) VALUES (%s, %s, %s, %s)
        '''
        
        cursor = db.get_db().cursor()
        cursor.execute(query, (
            data.get('community_id'),
            data.get('date'),
            data.get('name'),
            data.get('description')
        ))
        db.get_db().commit()
        
        return jsonify({
            'message': 'Event created successfully'
        }), 201

    except Exception as e:
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
        DELETE FROM Event 
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

