from flask import (
    Blueprint,
    request,
    jsonify,
    make_response,
    current_app,
    redirect,
    url_for,
)
from bcrypt import hashpw, gensalt
from backend.db_connection import db

positions = Blueprint("positions", __name__)

# curl http://127.0.0.1:4000/pos/positions -X GET


@positions.route("/positions", methods=["GET"])
def get_positions():
    query = """
        SELECT c.name, p.* FROM positions p NATURAL JOIN companies c 
        LIMIT 100;
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response


# curl http://127.0.0.1:4000/pos/positions/1 -X GET


@positions.route("/positions/<id>", methods=["GET"])
def get_positions_by_id(id):
    query = f"""
        SELECT c.name, p.* FROM positions p NATURAL JOIN companies c
        WHERE p.id = {int(id)};
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response


# curl http://127.0.0.1:4000/pos/positions/1/questions -X GET


@positions.route("/positions/<id>/questions", methods=["GET"])
def get_positions_questions_by_id(id):
    query = f"""
        SELECT p.applicantQuestions FROM positions p
        WHERE p.id = {int(id)};
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response
