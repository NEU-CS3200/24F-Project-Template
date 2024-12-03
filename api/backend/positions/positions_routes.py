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


@positions.route("/positions", methods=["GET"])
def get_positions():
    query = """
        SELECT * FROM positions;
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response
