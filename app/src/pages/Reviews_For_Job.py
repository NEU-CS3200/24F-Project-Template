import logging
logger = logging.getLogger(__name__)
import streamlit as st
import requests
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks

SideBarLinks()
job_listing_id = st.session_state.get('job_listing_id', None)

# getting the job listing based on the passed in ID
try: 
    job_listing = requests.get(f'http://api:4000/j/job_listing/{job_listing_id}').json()
except:
    st.write("**Important**: Could not connect to API.")

# displaying the reviews for the job listing
if job_listing:
    st.write(f"## Reviews for {job_listing['Job Title']} at {job_listing['Company']}")
    reviews = []
    try:
        reviews = requests.get(f'http://api:4000/r/reviews/{job_listing_id}').json()
    except:
        st.write("**Important**: Could not connect to API.")
    
    if isinstance(reviews, list):
        for review in reviews:
            # is the student is anonymys say anonymous otherwise show the student's name
            with st.expander(f"{'Anonymous' if review['Anonymous'] else review['Student Name']}"):
                st.write("**Job Satisfaction**")
                st.write(review['Job Satisfaction'])
                st.write("**Hourly Wage**")
                st.write(review['Hourly Wage'])
                st.write("**Description**")
                st.write(review['Description'])
    else:
        st.write("No reviews available.")
else:
    st.write("Could not find job listing")


