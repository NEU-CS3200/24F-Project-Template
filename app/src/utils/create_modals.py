import streamlit as st
import requests
import logging
logger = logging.getLogger(__name__)
from utils.frontend_routes import create_review

if "show_modal" not in st.session_state:
    st.session_state["show_modal"] = False

def toggle_modal():
    st.session_state["show_modal"] = not st.session_state["show_modal"]

def create_review_modal(job_listing_id, student_id):
    with st.container():
        st.write("### Write a Review")
        review = None
        description = st.text_area("Description")
        jobSatisfaction = st.slider("Job Satisfaction", 0, 5)
        hourlyWage = st.text_input("Hourly Wage")
        anonymous = st.checkbox("Anonymous")
        col1, col2 = st.columns(2)
        with col1:
            submit = st.button("Submit Review")
        with col2:
            st.button("Cancel", on_click=toggle_modal)
        if submit:
            try:
                payload = {
                    "description": description,
                    "jobSatisfaction": jobSatisfaction,
                    "hourlyWage": hourlyWage,
                    "anonymous": anonymous,
                    "jobListingId": job_listing_id,
                    "studentId": student_id,
                }
                response = create_review(payload)
                response_data = response.json()
                
                if response.status_code == 200:
                    toggle_modal()
                    st.success("Review submitted.")
                else:
                    st.error("Failed to submit review.")
                logger.info(f"Response: {response_data}")
            except Exception as e:
                st.error(f"An unexpected error occurred: {e}")
                logger.error(f"Exception: {e}")

    return None


