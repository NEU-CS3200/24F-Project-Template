
from os import getenv

print("Loading db_config.py...")

# Database configuration
DB_CONFIG = {
    'host': getenv('DB_HOST', 'db'),
    'user': getenv('DB_USER', 'root'),
    'password': getenv('MYSQL_ROOT_PASSWORD', 'password123'),
    'port': int(getenv('DB_PORT', 3306)),
    'database': getenv('DB_NAME', 'SyncSpace')
}

print(f"DB_CONFIG loaded: {DB_CONFIG}") 
