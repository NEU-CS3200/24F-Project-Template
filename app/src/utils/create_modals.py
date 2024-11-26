import streamlit as st
import requests
import logging
logger = logging.getLogger(__name__)

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
            cancel = st.button("Cancel", on_click=toggle_modal)
        if submit:
            try:
                logger.info(f"Student ID: {student_id}")
                response = requests.post('http://api:4000/r/review', json={
                    "description": description,
                    "jobSatisfaction": jobSatisfaction,
                    "hourlyWage": hourlyWage,
                    "anonymous": anonymous,
                    "jobListingId": job_listing_id,
                    "studentId": student_id,
                    # TODO: Update reviewId to be dynamic
                    "reviewId": '11100'
                })
                review = response.json()
                st.write("Review submitted.")
                toggle_modal()
            except Exception as e:
                st.write(f"An unexpected error occurred: {e}")
                logger.error(f"Exception: {e}")
        elif cancel:
            toggle_modal()
    
    return review


