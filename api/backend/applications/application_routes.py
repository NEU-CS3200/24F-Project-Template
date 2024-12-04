from flask import (
    Blueprint,
    request,
    jsonify,
    make_response,
    current_app,
)
from backend.db_connection import db

applications = Blueprint("applications", __name__)

# curl http://localhost:4000/app/applications -X POST -H "Content-Type: application/json" -d '{"userId": 1,"questionResponse": "I am a student", "summary": "I am a student", "GPA": 3.5}'


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
    user_id = data["userId"]

    query = f"""
        INSERT INTO application_bookmark (applicationId, userId) VALUES
        (
            {int(application_id)}, {int(user_id)}
        );
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    db.get_db().commit()
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response


@applications.route("/applications/<id>/related_coursework", methods=["POST"])
def create_related_coursework(id):
    create_app_addon_helper(id, "related_coursework")


@applications.route("/applications/<id>/work_experience", methods=["POST"])
def create_work_experience(id):
    create_app_addon_helper(id, "work_experience")


@applications.route("/applications/<id>/notable_skills", methods=["POST"])
def create_notable_skills(id):
    create_app_addon_helper(id, "notable_skills")


def create_app_addon_helper(id, table_name):
    data = request.get_json()
    query = f"""
        INSERT INTO {table_name} (applicationId, name, summary) VALUES
        (
            {int(id)}, "{data["name"]}", {data["summary"]}
        );
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    db.get_db().commit()
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response


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


@applications.route("/applications/<id>/related_coursework", methods=["GET"])
def get_related_coursework(id):
    get_app_addon_helper(id, "related_coursework")


@applications.route("/applications/<id>/work_experience", methods=["GET"])
def get_work_experience(id):
    get_app_addon_helper(id, "work_experience")


@applications.route("/applications/<id>/notable_skills", methods=["GET"])
def get_notable_skills(id):
    get_app_addon_helper(id, "notable_skills")


def get_app_addon_helper(id, table_name):
    query = f"""
        SELECT * FROM {table_name} a
        WHERE a.applicationId = {int(id)};
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


@applications.route("/applications/<id>/related_coursework", methods=["DELETE"])
def delete_related_coursework(id):
    delete_app_addon_helper(id, "related_coursework")


@applications.route("/applications/<id>/work_experience", methods=["DELETE"])
def delete_work_experience(id):
    delete_app_addon_helper(id, "work_experience")


@applications.route("/applications/<id>/notable_skills", methods=["DELETE"])
def delete_notable_skills(id):
    delete_app_addon_helper(id, "notable_skills")


def delete_app_addon_helper(id, table_name):
    query = f"""
        DELETE FROM {table_name}
        WHERE applicationId = {int(id)};
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response
