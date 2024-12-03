'''
from flask import Flask
from backend.db_connection import init_app
from backend.students.student_routes import students


# Register blueprints
app.register_blueprint(students, url_prefix='/api/students')


app = Flask(__name__)

# Initialize database
init_app(app)

# Register blueprints
app.register_blueprint(students, url_prefix='/api')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=4000)
'''