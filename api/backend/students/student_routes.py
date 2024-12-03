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
# curl http://127.0.0.1:4000/s/create -X POST -H 'Content-Type: application/json' -d '{ "studentId": "010101010", "firstName": "Sam", "lastName": "Ehlers", "email": "ehlers.s@northeastern.edu", "password": "P@s5w0rD", "profile": "A student at northeastern university" }'


@students.route("/create", methods=["POST"])
def create_student():
    data = request.get_json()
    student_id = data["studentId"]
    first_name = data["firstName"]
    last_name = data["lastName"]
    name = f"{first_name} {last_name}"
    email = data["email"]
    password = data["password"]
    profile = data["profile"]

    passwordHash = hashpw(password.encode("utf-8"), gensalt(12)).decode("utf-8")

    query = f"""
        INSERT INTO users (studentId, name, firstName, lastName, email, passwordHash, profile) VALUES 
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


@students.route("/students/<student_id>", methods=["GET"])
def get_student_by_id(student_id):
    query = f"""
        SELECT * FROM users WHERE studentId = {int(student_id)};
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response


@students.route("/students/<student_id>/applications", methods=["GET"])
def get_student_applications(student_id):
    query = f"""
        SELECT a.* FROM applications a NATURAL JOIN users u, WHERE u.studentId = {int(student_id)};
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response


@students.route("/students/<student_id>/advisor", methods=["GET"])
def get_student_advisor(student_id):
    query = f"""
        SELECT a.* FROM users u JOIN users a ON u.advisorId = a.id, WHERE u.studentId = {int(student_id)};
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response


@students.route("/students/search/<res>", methods=["GET"])
def student_search(res):
    query = f"""
        SELECT * FROM users u, WHERE u.studentId = {int(student_id)} OR INSTR(u.name, "{res}") OR INSTR(u.email, "{res}");
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response


# curl http://127.0.0.1:4000/s/students/010101010/update -X PUT -H 'Content-Type: application/json' -d '{ "studentId": "010101010", "firstName": "Bob", "mobile": "1234567890" }'


@students.route("/students/<student_id>/update", methods=["PUT"])
def update_student(student_id):
    data = request.get_json()
    if student_id != data["studentId"]:
        response = make_response(
            jsonify({"message": "student_id in URL does not match student_id in body"})
        )
        response.status_code = 400
        return response

    query = f"""
        SELECT * FROM users WHERE studentId = {int(student_id)};
    """
    cursor = db.get_db().cursor()

    cursor.execute(query)
    student = cursor.fetchall()[0]

    if len(student) == 0:
        response = make_response(jsonify({"message": "student_id not found"}))
        response.status_code = 404
        return response

    query = "UPDATE users SET "

    for key in data:
        if key in student and key != "studentId":
            if type(data[key]) is int:
                query = query + f"{key} = {data[key]}, "
            else:
                query = query + f'{key} = "{data[key]}", '

    query = query[:-2] + f" WHERE studentId = {int(student_id)};"

    current_app.logger.error(query)

    cursor = db.get_db().cursor()

    cursor.execute(query)
    db.get_db().commit()
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response


def delete_student(student_id):
    pass
