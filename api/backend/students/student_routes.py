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

students = Blueprint("students", __name__)


# Example of a POST request
# curl http://127.0.0.1:4000/s/create -X POST -H 'Content-Type: application/json' -d '{ "student_id": "010101010", "first_name": "Sam", "last_name": "Ehlers", "email": "ehlers.s@northeastern.edu", "password": "P@s5w0rD", "profile": "A student at northeastern university" }'


@students.route("/create", methods=["POST"])
def create_student():
    data = request.get_json()
    student_id = data["student_id"]
    first_name = data["first_name"]
    last_name = data["last_name"]
    name = f"{first_name} {last_name}"
    email = data["email"]
    password = data["password"]
    profile = data["profile"]

    passwordHash = hashpw(password.encode("utf-8"), gensalt(12)).decode("utf-8")

    query = f"""
        INSERT INTO cosint.users (studentId, name, firstName, lastName, email, passwordHash, profile) VALUES 
        (
            "{student_id}", "{name}", "{first_name}", "{last_name}", "{email}", "{passwordHash}", "{profile}"
        );
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    db.get_db().commit()
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response


@students.route("/students", methods=["GET"])
def get_students():
    query = """
        SELECT * FROM users WHERE studentId IS NOT NULL;
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response


def get_student_by_id(student_id):
    pass


def get_student_applications(student_id):
    pass


def get_student_advisor(student_id):
    pass


def student_search(res):
    pass


def update_student(student_id):
    pass


def delete_student(student_id):
    pass
