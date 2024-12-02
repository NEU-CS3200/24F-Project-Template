from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db
from backend._ml_models.model01 import predict

advisors = Blueprint('advisors', __name__)