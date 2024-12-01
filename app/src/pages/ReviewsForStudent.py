import streamlit as st
import logging
logger = logging.getLogger(__name__)
from modules.nav import SideBarLinks
from components.review import review_component
from utils.review_modals import create_review_modal
from utils.frontend_routes import get_job_listing_by_id
from utils.frontend_routes import get_reviews_for_job_listing
from utils.frontend_routes import get_reviews_by_student

# Set page layout
st.set_page_config(layout='wide')

student_id = st.session_state.get('student_id', None)

try:
    reviews = get_reviews_by_student(student_id)
except:
    st.write("**Important**: Could not connect to API.")

SideBarLinks()

# Page Title
st.title(f"{reviews['Student Name']}'s Reviews:")
st.write('')

if reviews:
    for review in reviews:
        review_component(review, my_reviews=False)
else:
    st.write("No reviews available.")

