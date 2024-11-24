import logging
logger = logging.getLogger(__name__)
import streamlit as st
import requests
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks

SideBarLinks()

st.write("# Companies")

# Search Bar
text_input = st.text_input (
    "Search for Companies?", placeholder="Search here...", key="text_input"
)

companies = []

try: 
    companies = requests.get('http://api:4000/j/companies').json()
    job_listings = requests.get('http://api:4000/j/job_listings').json()
except:
    st.write("**Important**: Could not connect to API.")

# Check if companies is valid
if isinstance(companies, list):
    
    # Filtering the companies if the user has entered a search value
    if text_input:
        filtered_companies = []
        for company in companies:
            if text_input.lower() in company['Name'].lower():
                filtered_companies.append(company)
        companies = filtered_companies

    for company in companies:
        # number of job listings per company
        num_job_listings = len([job for job in job_listings if job['Company ID'] == company['Company ID']])

        with st.expander(f"{company['Name']}"):
            col1, col2 = st.columns(2)
            with col1:
                st.write("**Headline**")
                st.write(company['Headline'])
                st.write("**Description**")
                st.write(company['Description'])
            with col2:
                st.write("**Website Link**")
                st.write(company['Website Link'])
                st.write("**Job Listings**")
                if st.button(f"{num_job_listings} {'Listing' if num_job_listings == 1 else 'Listings'}",
                        key=f"listings_button_{company['Company ID']}",
                        type='secondary'):
                    st.switch_page('pages/Jobs_For_Company.py')
else:
    st.write("No companies available.")
