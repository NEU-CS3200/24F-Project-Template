from flask import (
    Blueprint,
    request,
    jsonify,
    make_response,
)
from bcrypt import hashpw, gensalt
from backend.db_connection import db

employers = Blueprint("employers", __name__)


@employers.route("/<id>/employees", methods=["GET"])
def get_employees(id):
    query = f"""
        SELECT * FROM users u
        WHERE employerId = {int(id)}
        LIMIT 100;
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    db.get_db().commit()
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response


# curl http://127.0.0.1:4000/emp/1/employees -X POST -H 'Content-Type: application/json' -d '{ "firstName": "Bob", "lastName": "Marley", "email": "bmarley@google.com", "password": "P@s5w0rD", "profile": "An employee at Google" }'


@employers.route("/<id>/employees", methods=["POST"])
def add_employee(id):
    data = request.get_json()
    first_name = data["firstName"]
    last_name = data["lastName"]
    name = f"{first_name} {last_name}"
    email = data["email"]
    password = data["password"]
    profile = data["profile"]
    company_id = int(id)

    passwordHash = hashpw(password.encode("utf-8"), gensalt(12)).decode("utf-8")

    query = f"""
        INSERT INTO users (employerId, name, firstName, lastName, email, passwordHash, profile) VALUES 
        (
            "{company_id}", "{name}", "{first_name}", "{last_name}", "{email}", "{passwordHash}", "{profile}"
        );
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    db.get_db().commit()
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response


@employers.route("/<id>/create_position", methods=["POST"])
def create_pos(id):
    data = request.get_json()
    address = data["address"]
    city = data["city"]
    country = data["country"]
    summary = data["summary"]
    applicant_questions = data["applicatnQuestions"]
    expected_salary = int(data["expectedSalary"])
    company_id = int(id)

    query = f"""
        INSERT INTO positions (address, city, country, summary, applicantQuestions, expectedSalary, companyId) VALUES 
        (
            "{address}", "{city}", "{country}", "{summary}", "{applicant_questions}", {expected_salary}, {company_id}
        );
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    db.get_db().commit()
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response


@employers.route("/<id>/positions/<pos_id>", methods=["POST"])
def offer_position(id, pos_id):
    data = request.get_json()

    query = f"""
        INSERT INTO cosint.offer_list (positionId, userId) VALUES
        (
            {int(pos_id)}, {int(data["userId"])}
        );
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    db.get_db().commit()
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response


@employers.route("/<id>/positions", methods=["GET"])
def get_positions(id):
    query = f"""
        SELECT * FROM positions p
        WHERE p.companyId = {int(id)}
        LIMIT 100;
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    db.get_db().commit()
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response
