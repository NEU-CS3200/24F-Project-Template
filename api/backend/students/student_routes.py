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

students = Blueprint('students', __name__)

def create_student():
    pass

def get_students():
    pass

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
