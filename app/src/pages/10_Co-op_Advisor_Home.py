import logging
logger = logging.getLogger(__name__)

import streamlit as st
import pandas as pd
from st_aggrid import AgGrid, GridOptionsBuilder
import sqlite3
from modules.nav import SideBarLinks

# Check if user is logged in
if 'logged_in' not in st.session_state or not st.session_state['logged_in']:
    st.error("Please login to access this page")
    st.stop()

# Page config
st.set_page_config(layout="wide")

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

# Title and welcome message
st.title(f"Welcome Co-op Advisor, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

# Create top row of metric cards with some padding
st.write('')
col1, col2, col3, col4 = st.columns([1, 1, 1, 1])


with col1:
    st.button("🔔 NOTIFICATION\n9 Unread Notifications", 
              key="notification_btn",
              on_click=lambda: st.switch_page("pages/11_Notification.py"))

with col2:
    st.button("📝 FORMS\n4 Student Forms Update",
              key="forms_btn",
              on_click=lambda: st.switch_page("pages/12_Form.py"))

with col3:
    st.button("🏠 HOUSING\n6 Students Waiting",
              key="housing_btn",
              on_click=lambda: st.switch_page("pages/13_Housing.py"))

with col4:
    st.button("➕ CREATE NEW\nCase",
              key="create_btn")

# Database connection and student data retrieval
@st.cache_data
def load_student_data():
    conn = sqlite3.connect('ScyncSpace-data.sql')
    query = """
    SELECT 
        student_id,
        first_name || ' ' || last_name as student_name,
        location as co_op_location,
        company_name,
        start_date
    FROM students
    ORDER BY start_date DESC
    """
    df = pd.read_sql_query(query, conn)
    conn.close()
    return df

# Load student data
df = load_student_data()

# Replace the grid configuration and display code with this:
st.subheader(f"Student List ({len(df)})")

# Add a search box
search = st.text_input("Search students", "")

# Filter dataframe based on search term
if search:
    df = df[
        df.apply(lambda row: search.lower() in str(row).lower(), axis=1)
    ]

# Display the dataframe with built-in Streamlit functionality
st.dataframe(
    df,
    hide_index=True,
    column_config={
        "student_id": None,  # Hide the student_id column
        "student_name": "Name",
        "co_op_location": "Co-op Location",
        "company_name": "Company",
        "start_date": "Start Date"
    },
    use_container_width=True
)