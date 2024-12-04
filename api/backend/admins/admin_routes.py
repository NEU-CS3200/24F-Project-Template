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


@admins.route("/add_company", methods=["POST"])
def add_company():
    data = request.get_json()
    comp_name = str(data["name"])

    query = f"""
        INSERT INTO cosint.companies (name) VALUES
        (
            {comp_name}
        );
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    db.get_db().commit()
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response

@admins.route("/tickets", methods=["GET"])
def get_tickets():
    query = """
        SELECT u.name AS 'helping', h.name AS 'assignedTo', t.summary, t.completed, t.updatedAt, t.registeredAt FROM cosint.tickets t
        JOIN cosint.users u ON t.helperId = u.id
        JOIN cosint.users h ON t.userId = h.id
        WHERE completed = 0;
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response

@admins.route("/stats", methods=["GET"])
def get_tickets():
    query = """
        SELECT
            MIN(lastLogin) AS intervalStart,
            DATE_ADD(MIN(lastLogin), INTERVAL 15 MINUTE) AS intervalEnd,
            COUNT(*) AS loginCount
        FROM cosint.users u
        WHERE lastLogin BETWEEN u.lastLogin AND DATE_ADD(u.lastLogin, INTERVAL 15 MINUTE)
        GROUP BY u.lastLogin
        ORDER BY loginCount DESC
        LIMIT 1;
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response