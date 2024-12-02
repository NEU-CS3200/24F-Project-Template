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

# This blueprint handles some basic routes that you can use for testing
simple_routes = Blueprint("simple_routes", __name__)


# ------------------------------------------------------------
# / is the most basic route
# Once the api container is started, in a browser, go to
# localhost:4000/playlist
@simple_routes.route("/")
def welcome():
    current_app.logger.info("GET / handler")
    welcome_message = "<h1>Welcome to the cosint REST API</h1>"
    response = make_response(welcome_message)
    response.status_code = 200
    return response


@simple_routes.route("/test")
def api_test():
    message = "API is working"
    response = make_response(jsonify({"message": message}))
    response.status_code = 200
    return response
