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
from backend._ml_models.model01 import predict

advisors = Blueprint('advisors', __name__)