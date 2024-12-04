'''
from flask import Flask
from backend.db_connection import init_app
from backend.students.student_routes import students
from backend.advisor.co_op_advisor_routes import advisor


app = Flask(__name__)

init_app(app)



@@ -15,6 +17,7 @@ init_app(app)

# Register blueprints
app.register_blueprint(students, url_prefix='/api')
app.register_blueprint(advisor, url_prefix='/api')


# Register blueprints
app.register_blueprint(students, url_prefix='/api/students')
app.register_blueprint(advisor, url_prefix='/api/advisor')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=4000)
'''



