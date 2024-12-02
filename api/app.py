from flask import Flask
from backend.students.student_routes import students  # Correct import path

app = Flask(__name__)

# Add some debug endpoints
@app.route('/')
def hello():
    return {"message": "API is running"}

@app.route('/debug/routes')
def list_routes():
    routes = []
    for rule in app.url_map.iter_rules():
        routes.append({
            "endpoint": rule.endpoint,
            "methods": list(rule.methods),
            "path": str(rule)
        })
    return {"routes": routes}

# Register the blueprint with a prefix
app.register_blueprint(students, url_prefix='/api')

# Add debug logging
app.logger.setLevel('DEBUG')

if __name__ == '__main__':
    print("Available routes:")
    for rule in app.url_map.iter_rules():
        print(f"{rule.endpoint}: {rule}")
    app.run(host='0.0.0.0', port=4000, debug=True)