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


# Example of a PUT request
# curl http://127.0.0.1:4000/pos/positions/1/update -X PUT -H 'Content-Type: application/json' -d '{ "id": 1, "summary": "Front end engineer" }'


@positions.route("/positions/<id>/update", methods=["PUT"])
def update_student(id):
    data = request.get_json()
    if int(id) != int(data["id"]):
        response = make_response(
            jsonify({"message": "id in URL does not match student_id in body"})
        )
        response.status_code = 400
        return response

    query = f"""
        SELECT * FROM positions
        WHERE id = {int(id)};
    """
    cursor = db.get_db().cursor()

    cursor.execute(query)
    student = cursor.fetchall()[0]

    if len(student) == 0:
        response = make_response(jsonify({"message": "id not found"}))
        response.status_code = 404
        return response

    query = "UPDATE positions "

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


# Example of a PUT request
# curl http://127.0.0.1:4000/pos/positions/1/delete -X DELETE


@positions.route("/positions/<id>/delete", methods=["DELETE"])
def delete_student(id):
    query = f"""
        DELETE FROM positions
        WHERE id = {int(id)};
    """

    cursor = db.get_db().cursor()

    cursor.execute(query)
    db.get_db().commit()
    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response
