########################################################
# Sample common question blueprint of endpoints
# Remove this file if you are not using it in your project
########################################################
from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db
import pymysql

#------------------------------------------------------------
# Create a new Blueprint object, which is a collection of 
# routes.
commonQuestions = Blueprint('commonQuestions', __name__)

@commonQuestions.route('/commonQuestions/<company_id>', methods=['GET'])
def get_commonQuestions(company_id):

    cursor = db.get_db().cursor()
    cursor.execute('''SELECT id, commonQuestion FROM common_questions
    WHERE company_id = {0}'''.format(company_id))

    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response

@commonQuestions.route('/commonQuestions', methods=['POST'])
def add_commonQuestion():
    payload = request.json
    company_id = payload['company_id']
    question = payload['question']

    cursor = db.get_db().cursor()

    cursor.execute('''INSERT INTO common_questions (company_id, commonQuestion)
    VALUES ({0}, '{1}')'''.format(company_id, question))

    db.get_db().commit()
    
    the_response = make_response(jsonify('Common Question Added'))
    the_response.status_code = 200
    return the_response

@commonQuestions.route('/commonQuestions/<question_id>', methods=['PUT'])
def update_commonQuestion(question_id):
    payload = request.json
    edited_question = payload['edited_question']

    cursor = db.get_db().cursor()

    cursor.execute('''UPDATE common_questions SET commonQuestion = '{0}'
    WHERE id = {1}'''.format(edited_question, question_id))

    db.get_db().commit()
    
    the_response = make_response(jsonify('Common Question Updated'))
    the_response.status_code = 200
    return the_response

@commonQuestions.route('/commonQuestions/<question_id>', methods=['DELETE'])
def delete_commonQuestion(question_id):
    cursor = db.get_db().cursor()

    cursor.execute('''DELETE FROM common_questions WHERE id = {0}'''.format(question_id))

    db.get_db().commit()
    
    the_response = make_response(jsonify('Common Question Deleted'))
    the_response.status_code = 200
    return the_response

@commonQuestions.route('/commonQuestions/filterBy/<keyphrase>', methods=['GET'])
def search_commonQuestions(keyphrase):

    cursor = db.get_db().cursor()
    
    # Necessary due to errors with "Unknown columns _____ in 'where clause'"
    escaped_keyphrase = pymysql.converters.escape_string(keyphrase)

    query = f'''SELECT id, commonQuestion FROM common_questions
                WHERE commonQuestion LIKE '%{escaped_keyphrase}%';'''

    print(f"Received keyphrase: {keyphrase}")
    print(f"Constructed Query: {query}")
    cursor.execute(query)
    theData = cursor.fetchall()

    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response