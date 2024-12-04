import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests
import pandas as pd

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title('Feedback Form')

url = "http://api:4000/c/feedback"

description = st.text_area("Feedback Description", placeholder="Enter your feedback here")
date = st.date_input("Date")
progress_rating = st.slider("Progress Rating", min_value=1, max_value=5, step=1)


if st.button("Submit Feedback"):
    # Prepare data for submission
    feedback_data = {
        "Description": description,
        "Date": date.isoformat(),  # Convert to ISO format
        "ProgressRating": progress_rating,
    }

    try:
        # Make a POST request to the backend API
        response = requests.post(url, json=feedback_data)

        if response.status_code == 200:
            st.success("Feedback submitted successfully!")
        else:
            st.error(f"Failed to submit feedback: {response.text}")

    except Exception as e:
        st.error(f"An error occurred: {str(e)}")