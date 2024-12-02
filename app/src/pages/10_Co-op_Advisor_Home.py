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
            st.write("Successfully connected to MySQL!")
            cursor = conn.cursor()
            
            # Check if Student table exists
            cursor.execute("SHOW TABLES")
            tables = cursor.fetchall()
            st.write("Available tables:")
            for table in tables:
                st.write(f"- {table[0]}")
                
            # Check Student table structure
            try:
                cursor.execute("DESCRIBE Student")
                st.write("\nStudent table structure:")
                columns = cursor.fetchall()
                for col in columns:
                    st.write(f"- {col[0]}: {col[1]}")
            except Error as e:
                st.error("Couldn't get Student table structure. Table might not exist.")
        
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
        st.write(f"\nFound {len(df)} students in database")
        
        # If table exists but no data, show sample query
        if len(df) == 0:
            cursor.execute("SELECT COUNT(*) FROM Student")
            count = cursor.fetchone()[0]
            st.write(f"Total rows in Student table: {count}")
            
            # Show a sample of raw data if any exists
            cursor.execute("SELECT * FROM Student LIMIT 5")
            sample = cursor.fetchall()
            if sample:
                st.write("\nSample data from Student table:")
                for row in sample:
                    st.write(row)
        
        return df
        
    except Error as e:
        st.error(f"Database error: {e}")
        st.write(f"\nFull error: {str(e)}")
        return pd.DataFrame()
    finally:
        if 'conn' in locals() and conn.is_connected():
            conn.close()
            st.write("MySQL connection closed")

# Load student data
df = load_student_data()

# Display the student list
st.subheader(f"Student List ({len(df)})")

# Add a search box
search = st.text_input("Search students by name, location, or company", "")

# Filter the DataFrame based on search input
if search:
    df = df[df.apply(lambda row: search.lower() in str(row).lower(), axis=1)]

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


