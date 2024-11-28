import streamlit as st
import logging
from modules.nav import SideBarLinks
from utils.frontend_routes import get_students_for_advisor

logging.basicConfig(
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    level=logging.INFO
)
logger = logging.getLogger(__name__)

# Set page layout
st.set_page_config(layout='wide')

# Sidebar navigation
SideBarLinks()

advisor_id = st.session_state["advisor_id"]

if not advisor_id:
    st.error("Advisor ID not found. Please log in again.")
    students = []
else:
    response = get_students_for_advisor(advisor_id)
    if response:
        students = response
        logger.info(f"Students fetched: {students}")
    else:
        logger.error("Error fetching students or no students found.")
        st.error("Could not fetch student data. Please try again later.")
        students = []

# Page Title
st.title(f"Here are your Students' Reviews!")
st.write('')
st.write('### Students assigned to you:')

# Search bar for filtering students
search_input = st.text_input("Search Students", placeholder="Enter student name or email")

def filter_students(students, query):
    query = query.lower()
    return [
        student for student in students
        if query in student["Name"].lower() or query in student["Email"].lower()
    ]

filtered_students = filter_students(students, search_input) if search_input else students

if filtered_students:
    for student in filtered_students:
        with st.expander(f"{student['Name']} ({student['Email']})"):
            st.write(f"**Student ID**: {student['Student ID']}")
            st.write(f"**Phone**: {student['Phone']}")
else:
    st.write("No students found for your advisor profile.")
