import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title('Feedback Form')

feedbackurl = 'http://api:4000/s/feedback'

date = st.date_input("Date")
progress_rating = st.slider("Progress Rating", min_value=1, max_value=5, step=1)
description = st.text_area("Feedback Description", placeholder="Enter your feedback here")
name = st.session_state['first_name']

def get_profile(name):
    url = f'http://api:4000/s/student/{name}'
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()
    else:
        st.error(f"Error fetching data: {response.status_code}")
        return []

student = get_profile(name)
if student and isinstance(student, list):
    record = student[0]
    s_id = record.get("StudentID", "Not available")
    a_id = record.get("AdvisorID", "Not available")

    if st.button("Submit"):
        feedback_data = {
            "Description": description,
            "Date": date.isoformat(),  
            "ProgressRating": progress_rating,
            "StudentID" : s_id,
            "AdvisorID" : a_id,
        }

        try:
            response = requests.post(feedbackurl, json=feedback_data)

            if response.status_code == 200:
                st.success("Feedback submitted successfully!")
                st.switch_page('pages/30_Student_Sarah_Home.py')
            else:
                st.error(f"Failed to submit feedback: {response.text}")

        except Exception as e:
            st.error(f"An error occurred: {str(e)}")




