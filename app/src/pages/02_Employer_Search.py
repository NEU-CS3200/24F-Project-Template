import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title(f"Student Search")

try:
    student_search = requests.get('http://api:4000/stu/search')
with st.form("student_search"):
    
    company_input = st.text_input(
        "Search Companies",
        placeholder="Enter company name",
        key="search")

    employer_input = st.text_input(
        "Search Employers",
        placeholder="Enter employer name",
        key="search")

    if st.session_state["role"] == "coop_advisor":
        st.radio(
            "Employer Type",
            key="employer_type",
            options=["All", "Already Advising",],
        )

    if st.session_state["role"] == "student":
        st.radio(
            "Employer Type",
            key="employer_type",
            options=["All", "Applied", "Flagged",],
        )

    st.form_submit_button('Search')

    
    if student_search.status_code == 200:
        student_search_data = student_search.json()
        category_options = [""] + [category['value'] for category in categories_data]
    else:
        st.error("Failed to fetch categories")
        category_options = []
except requests.exceptions.RequestException as e:
    st.error(f"Error connecting to students API: {str(e)}")
    category_options = []

with st.form("student_search"):
    
    student_value = student_input = st.text_input(
        "Search Students",
        placeholder="Enter student name or Id#",)

    submit_button = st.form_submit_button('Search')
    
    if submit_button:
        if not student_value:
            st.error("Please enter a student name or id")
        else:
            logger.info(f"Product form submitted with data: {student_search_data}")
            
            try:
                response = requests.post(f'http://api:4000/stu/student_search/{student_search_data}')
                if response.status_code == 200:
                    st.success("Student added successfully!")
                else:
                    st.error(f"Error adding product: {response.text}")
            except requests.exceptions.RequestException as e:
                st.error(f"Error connecting to server: {str(e)}")



