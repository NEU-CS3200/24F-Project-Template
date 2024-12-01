########################################################
# Sample reviews blueprint of endpoints
# Remove this file if you are not using it in your project
########################################################
from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db
import pymysql

#------------------------------------------------------------
# Create a new Blueprint object, which is a collection of 
# routes.
reviews = Blueprint('reviews', __name__)