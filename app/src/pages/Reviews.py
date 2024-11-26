import streamlit as st
import logging
logger = logging.getLogger(__name__)
from modules.nav import SideBarLinks
from components.review import review_component
from utils.create_modals import toggle_modal
from utils.create_modals import create_review_modal
from utils.frontend_routes import get_job_listing_by_id
from utils.frontend_routes import get_reviews_for_job_listing
from utils.frontend_routes import get_reviews_by_student

if "show_modal" not in st.session_state:
    st.session_state["show_modal"] = False

job_listing_id = st.session_state.get('job_listing_id', None)
student_id = st.session_state.get('student_id', None)
logger.info(f"Student ID: {student_id}")

reviews = []
if job_listing_id:
    try: 
        job_listing = get_job_listing_by_id(job_listing_id)
        reviews = get_reviews_for_job_listing(job_listing_id)
    except:
        st.write("**Important**: Could not connect to API.")
else:
    try:
        reviews = get_reviews_by_student(student_id)
    except:
        st.write("**Important**: Could not connect to API.")

SideBarLinks()

col1, col2 = st.columns(2)

with col1:
    if job_listing_id:
        st.write(f"## Reviews for {job_listing['Job Title']} at {job_listing['Company']}")
    else:
        st.write("## My Reviews")

with col2:
    if job_listing_id:
        if st.button("Write a review"):
            toggle_modal()

# Modal for writing a review
if st.session_state["show_modal"]:
    create_review_modal(job_listing_id, student_id)

if reviews:
    for review in reviews:
        review_component(review)
else:
    st.write("No reviews available.")
