import streamlit as st
from streamlit_extras.app_logo import add_logo
import logging
logger = logging.getLogger(__name__)
import requests
from modules.nav import SideBarLinks
from components.review import review_component

job_listing_id = st.session_state.get('job_listing_id', None)

try: 
    job_listing = requests.get(f'http://api:4000/j/job_listing/{job_listing_id}').json()
    reviews = requests.get(f'http://api:4000/r/reviews/{job_listing_id}').json()
except:
    st.write("**Important**: Could not connect to API.")


SideBarLinks()

# displaying the reviews for the job listing
st.write(f"## Reviews for {job_listing['Job Title']} at {job_listing['Company']}")

if isinstance(reviews, list):
    for review in reviews:
        review_component(review)

else:
    st.write("No reviews available.")



