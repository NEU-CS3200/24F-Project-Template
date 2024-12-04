import logging
import streamlit as st
import requests
import pandas as pd
from modules.nav import SideBarLinks

# Configure logging
logger = logging.getLogger(__name__)

# Set Streamlit layout
st.set_page_config(layout='wide')

# Display navigation links
SideBarLinks()

# Title and introduction
st.title(f"Welcome Co-op Advisor, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

# Create top row of metric cards
col1, col2, col3, col4 = st.columns([1, 1, 1, 1])

with col1:
    if st.button("📝 Student_tasks\n Student Tasks", key="notification_btn"):
        st.switch_page("pages/11_Student_Tasks.py")

with col2:
    if st.button("🧐 FEEDBACK\n Student Feedback", key="forms_btn"):
        st.switch_page("pages/12_Feedback.py")

with col3:
    if st.button("🏠 HOUSING\n Students Waiting", key="housing_btn"):
        st.switch_page("pages/13_Housing.py")

with col4:
    if st.button("➕ CREATE NEW\nCase", key="create_btn"):
        st.switch_page("pages/14_Create_Case.py")

# Load and display student data
try:
    response = requests.get('http://api:4000/api/students')
    if response.status_code == 200:
        data = response.json()
        if data:
            df = pd.DataFrame(data)
            st.subheader(f"Student List ({len(df)})")
            
            # Create filter columns
            col1, col2, col3, col4, col5 = st.columns(5)
            
            # Add text input filters for each column
            with col1:
                name_filter = st.text_input("Filter by Name")
            with col3:
                major_filter = st.text_input("Filter by Major")
            with col4:
                company_filter = st.text_input("Filter by Company")
            with col5:
                location_filter = st.text_input("Filter by Location")
            with col2:
                id_filter = st.text_input("Filter by ID")
            
            # Apply filters
            if name_filter:
                df = df[df['student_name'].str.contains(name_filter, case=False, na=False)]
            if id_filter:
                df = df[df['student_id'].astype(str).str.contains(id_filter, na=False)]
            if major_filter:
                df = df[df['major'].str.contains(major_filter, case=False, na=False)]
            if company_filter:
                df = df[df['company_name'].str.contains(company_filter, case=False, na=False)]
            if location_filter:
                df = df[df['co_op_location'].str.contains(location_filter, case=False, na=False)]
            
            
            # Specify the exact column order
            column_order = ["student_name","student_id", "major", "company_name", "co_op_location" ]
            df = df[column_order]
            
            # Display filtered dataframe
            st.dataframe(
                df,
                use_container_width=True,
                column_config={
                    "student_name": "Name",
                    "student_id": "Student ID",
                    "major": "Major",
                    "company_name": "Company",
                    "co_op_location": "Co-op Location"
                },
                hide_index=True
            )
        else:
            st.warning("No student data available")
    else:
        st.error(f"Failed to fetch student data")
except Exception as e:
    st.error(f"Error loading student data")

