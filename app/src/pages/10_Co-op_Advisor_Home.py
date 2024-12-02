import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks
import mysql.connector
import pandas as pd
from mysql.connector import Error

# Set Streamlit page configuration
st.set_page_config(layout="wide")

# Add navigation sidebar
SideBarLinks()

# Page title and welcome message
st.title('Co-op Advisor Home Page')
st.write(f"Welcome, {st.session_state.get('first_name', 'Advisor')}!")

st.write('')
st.write('### What would you like to do today?')

# Create top row of metric cards
col1, col2, col3, col4 = st.columns([1, 1, 1, 1])

with col1:
    if st.button("🔔 NOTIFICATION\n9 Unread Notifications", key="notification_btn"):
        st.write("Redirecting to Notifications...")

with col2:
    if st.button("📝 FORMS\n4 Student Forms Update", key="forms_btn"):
        st.write("Redirecting to Forms...")

with col3:
    if st.button("🏠 HOUSING\n6 Students Waiting", key="housing_btn"):
        st.write("Redirecting to Housing...")

with col4:
    if st.button("➕ CREATE NEW\nCase", key="create_btn"):
        st.write("Redirecting to Create New Case...")

# Database connection and student data retrieval
@st.cache_data
def load_student_data():
    try:
        # Connect to MySQL database
        conn = mysql.connector.connect(
            host='db',
            user='root',
            password='password123',
            database='SyncSpace',
            port=3306
        )
        
        if conn.is_connected():
            cursor = conn.cursor()
            
            # Query to get student data
            query = """
            SELECT 
                StudentID AS student_id,
                Name AS student_name,
                Location AS co_op_location,
                Company AS company_name,
                Major AS major
            FROM Student
            ORDER BY student_id ASC
            """
            
            df = pd.read_sql_query(query, conn)
            return df
        
    except Error as e:
        st.error(f"Database error: {e}")
        return pd.DataFrame()
    finally:
        if 'conn' in locals() and conn.is_connected():
            conn.close()

# Load student data
df = load_student_data()

# Display the student list
st.subheader(f"Student List ({len(df)})")

# Display the DataFrame with Streamlit's built-in table display
st.dataframe(
    df,
    use_container_width=True,
    column_config={
        "student_id": "Student ID",
        "student_name": "Name",
        "co_op_location": "Co-op Location",
        "company_name": "Company",
        "major": "Major"
    }
)

