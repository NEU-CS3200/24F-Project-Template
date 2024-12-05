########################################################
# Sample customers blueprint of endpoints
# Remove this file if you are not using it in your project
########################################################
from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

#------------------------------------------------------------
# Create a new Blueprint object, which is a collection of 
# routes.
student2 = Blueprint('student2', __name__)


#------------------------------------------------------------
# Get all students from the system
@student2.route('/student2', methods=['GET'])
def get_students():

    cursor = db.get_db().cursor()
    cursor.execute('''SELECT StudentId, Name, Major,
                    Company, Lifestyle FROM students
    ''')
    
    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response