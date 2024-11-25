import logging
logger = logging.getLogger(__name__)
import streamlit as st
import requests
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks
from modules.filter_functions import filter_job_listings
from components.job_listing import job_listing_component
from components.search import search_input

try: 
    job_listings = requests.get('http://api:4000/j/job_listings').json()
    reviews = requests.get('http://api:4000/r/reviews').json()
except:
    st.write("**Important**: Could not connect to API.")


SideBarLinks()

st.write("# Job Postings")

text_input = search_input("Jobs")

# Check if job_listings is valid
if isinstance(job_listings, list):

    filtered_job_listings = filter_job_listings(job_listings, text_input)

    for job in job_listings:
        # number of reviews per job
        num_reviews = len([review for review in reviews if review['Job Listing ID'] == job['Job Listing ID']])

        job_listing_component(job, num_reviews)

else:
    st.write("No job postings available.")
