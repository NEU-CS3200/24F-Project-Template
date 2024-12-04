from flask import (
    Blueprint,
    request,
    jsonify,
    make_response,
    current_app,
    redirect,
    url_for,
)
from backend.db_connection import db

admins = Blueprint("admins", __name__)

@admins.route("/coop_rep", methods=["GET"])
def get_reps():
    query = """
        SELECT u.firstName, u.middleName, u.lastName, u.mobile, u.email FROM cosint.users u
        WHERE u.firstName = 'John' AND u.lastName = 'Doe' AND u.companyId = 1;
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response