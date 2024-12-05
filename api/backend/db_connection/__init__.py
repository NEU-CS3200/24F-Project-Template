#------------------------------------------------------------
# This file creates a shared DB connection resource
#------------------------------------------------------------
from flaskext.mysql import MySQL
from pymysql import cursors
from flask import current_app

#db = MySQL(cursorclass=cursors.DictCursor)


print("Loading db_connection/__init__.py...")

try:
    from .db_config import DB_CONFIG
    print("Successfully imported DB_CONFIG")
except ImportError as e:
    print(f"Error importing DB_CONFIG: {e}")
    raise

# Initialize MySQL with dictionary cursor
db = MySQL(cursorclass=cursors.DictCursor)

def init_app(app):
    print("Initializing database connection...")
    # Configure database connection
    app.config['MYSQL_DATABASE_HOST'] = DB_CONFIG['host']
    app.config['MYSQL_DATABASE_USER'] = DB_CONFIG['user']
    app.config['MYSQL_DATABASE_PASSWORD'] = DB_CONFIG['password']
    app.config['MYSQL_DATABASE_PORT'] = DB_CONFIG['port']
    app.config['MYSQL_DATABASE_DB'] = DB_CONFIG['database']
    
    # Initialize the MySQL connection
    db.init_app(app)
    print("Database connection initialized")


