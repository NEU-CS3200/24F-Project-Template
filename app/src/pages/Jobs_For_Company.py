import logging
logger = logging.getLogger(__name__)
import streamlit as st
import requests
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks

SideBarLinks()

company_id = st.session_state.get('company_id', None)

job_listings = []

# getting the job listing based on the passed in ID
try: 
    company = requests.get(f'http://api:4000/j/company/{company_id}').json()
except:
    st.write("**Important**: Could not connect to API.")

st.write(f"# Job Postings for {company['Name']}")

# Search Bar
text_input = st.text_input (
    "Search for Jobs?", placeholder="Search here...", key="text_input"
)

try: 
    job_listings = requests.get(f'http://api:4000/j/job_listings/company/{company_id}').json()
    reviews = requests.get('http://api:4000/r/reviews').json()
except:
    st.write("**Important**: Could not connect to API.")

# Check if job_listings is valid
if isinstance(job_listings, list):
    # Filtering the job_listings if the user has entered a search value
    if text_input:
        filtered_job_listings = []
        for job in job_listings:
            if text_input.lower() in job['Job Title'].lower() or text_input.lower() in job['Company'].lower():
                filtered_job_listings.append(job)
        job_listings = filtered_job_listings

    for job in job_listings:
        # number of reviews per job
        num_reviews = len([review for review in reviews if review['Job Listing ID'] == job['Job Listing ID']])

        with st.expander(f"{job['Company']}: {job['Job Title']}"):
            col1, col2 = st.columns(2)
            with col1:
                st.write("**Start Date**")
                st.write(job.get('Start Date', 'N/A'))
                st.write("**End Date**")
                st.write(job.get('End Date', 'N/A'))
                st.write("**Skills**")
                st.write(job.get('Skills', 'N/A'))
            with col2:
                st.write("**Hourly Wage**")
                st.write(f"${job.get('Hourly Wage', 'N/A')} per hour")
                st.write("**Location**")
                st.write(job.get('Location', 'N/A'))
                st.write("**All Reviews**")
                if st.button(f"{num_reviews} {'Review' if num_reviews == 1 else 'Reviews'}",
                        key=f"reviews_button_{job['Job Listing ID']}",
                        type='secondary'):
                    st.query_params.job_listing_id = job['Job Listing ID']
                    st.session_state['job_listing_id'] = job['Job Listing ID']
                    st.switch_page('pages/Reviews_For_Job.py')

            st.write("**Description**")
            st.write(job.get('Description', 'N/A'))

else:
    st.write("No job postings available.")
