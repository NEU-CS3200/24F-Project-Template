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

applications = Blueprint("applications", __name__)

# curl http://localhost:4000/app/applications -X POST -H "Content-Type: application/json" -d '{"questionResponse": "I am a student", "summary": "I am a student", "GPA": 3.5}'


@applications.route("/applications", methods=["POST"])
def create_app():
    data = request.get_json()
    query = f"""
        INSERT INTO applications (questionResponse, summary, GPA, submittedAt) VALUES
        (
            "{data["questionResponse"]}", "{data["summary"]}", {float(data["GPA"])}, CURRENT_TIMESTAMP
        );
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    db.get_db().commit()

    application_id = cursor.lastrowid

    current_app.logger.error(application_id)

    return "ok"


@applications.route("/applications/<id>", methods=["GET"])
def get_app():
    query = f"""
        SELECT * FROM applications a
        WHERE a.id = {int(id)};
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response


@applications.route("/applications/<id>", methods=["PUT"])
def update_app(id):
    data = request.get_json()
    if int(id) != int(data["studentId"]):
        response = make_response(
            jsonify({"message": "id in URL does not match id in body"})
        )
        response.status_code = 400
        return response

    query = f"""
        SELECT * FROM applications
        WHERE id = {int(id)};
    """
    cursor = db.get_db().cursor()

    cursor.execute(query)
    student = cursor.fetchall()[0]

    if len(student) == 0:
        response = make_response(jsonify({"message": "id not found"}))
        response.status_code = 404
        return response

    query = "UPDATE applications "

    if len(data) > 1:
        query += "SET "

    for key in data:
        if key in student and key != "id":
            if type(data[key]) is int:
                query = query + f"{key} = {data[key]}, "
            else:
                query = query + f'{key} = "{data[key]}", '

    query = query[:-2] + f" WHERE id = {int(id)};"

    current_app.logger.error(query)

    cursor = db.get_db().cursor()

    cursor.execute(query)
    db.get_db().commit()
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response


@applications.route("/applications/<id>", methods=["DELETE"])
def delete_app(id):
    query = f"""
        DELETE FROM applications
        WHERE id = {int(id)};
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response
