import streamlit as st
import requests
import logging
from modules.nav import SideBarLinks

logging.basicConfig(
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    level=logging.INFO
)
logger = logging.getLogger(__name__)


# Set page layout
st.set_page_config(layout='wide')

# Sidebar navigation
SideBarLinks()

# Get the current advisor ID from session state
advisor_id = 1

# Check if advisor_id exists
if advisor_id:
    try:
        # Fetch students associated with this advisor using your API
        response = requests.get(f'http://api:4000/advisors/{advisor_id}/students')
        response.raise_for_status()  # Ensure we catch HTTP errors
        students = response.json()  # Parse JSON response
        logger.info(f"Students fetched: {students}")
    except Exception as e:
        logger.error(f"Error fetching students: {e}")
        st.write("**Important**: Could not connect to API or fetch student data.")
        students = []
else:
    st.error("Advisor ID not found. Please log in again.")
    students = []

# Title
st.title(f"Your Students")
st.write('')
st.write('### Students assigned to you:')

# Search bar for filtering students
search_input = st.text_input("Search Students", placeholder="Enter student name or email")

# Filter students based on search input
def filter_students(students, query):
    query = query.lower()
    return [
        student for student in students
        if query in student["Name"].lower() or query in student["Email"].lower()
    ]

filtered_students = filter_students(students, search_input) if search_input else students

# Display students
if filtered_students:
    for student in filtered_students:
        with st.expander(f"{student['Name']} ({student['Email']})"):
            st.write(f"**Student ID**: {student['Student ID']}")
            st.write(f"**Phone**: {student['Phone']}")
else:
    st.write("No students found.")


