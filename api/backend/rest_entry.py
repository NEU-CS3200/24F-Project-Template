from flask import Flask
from flask_cors import CORS
from backend.db_connection import init_app
from backend.students.student_routes import students

def create_app():
    app = Flask(__name__)
    CORS(app)
    
    # Initialize database
    init_app(app)
    
    # Register blueprints
    app.register_blueprint(students, url_prefix='/api')
    
    return app

