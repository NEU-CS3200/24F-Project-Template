from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db
from backend.ml_models.model01 import predict

#------------------------------------------------------------
# Create a new Blueprint object, which is a collection of 
# routes.
abroad_programs = Blueprint('students', __name__)

#------------------------------------------------------------
# Get all students from the system
@abroad_programs.route('/students', methods=['GET'])
def get_all_students():

    cursor = db.get_db().cursor()
    query = '''SELECT fName, lName, email, majorID, blurb, role, programID FROM Student'''
    cursor.execute(query)
    
    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response

#------------------------------------------------------------
# Get all student mentors from the system
@abroad_programs.route('/students', methods=['GET'])
def get_all_mentors():

    cursor = db.get_db().cursor()
    query = '''
        SELECT fName, lName, email, majorID, blurb, role, programID 
        FROM Student
        WHERE role = 'mentor' '''
    cursor.execute(query)
    
    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response

#------------------------------------------------------------
# Get all student mentees from the system
@abroad_programs.route('/students', methods=['GET'])
def get_all_mentees():

    cursor = db.get_db().cursor()
    query = '''
        SELECT fName, lName, email, majorID, blurb, role, programID 
        FROM Student
        WHERE role = 'mentee' '''
    cursor.execute(query)
    
    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response
