import streamlit as st
import logging
logger = logging.getLogger(__name__)
import requests
from modules.nav import SideBarLinks
from components.search import search_input
from components.company import company_component
from modules.filter_functions import filter_companies

try: 
    companies = requests.get('http://api:4000/j/companies').json()
    job_listings = requests.get('http://api:4000/j/job_listings').json()
except:
    st.write("**Important**: Could not connect to API.")

SideBarLinks()

st.write("# Companies")

text_input = search_input("Companies")

# Check if companies is valid
if isinstance(companies, list):
    
    filtered_companies = filter_companies(companies, text_input)

    for company in filtered_companies:
        # number of job listings per company
        num_job_listings = len([job for job in job_listings if job['Company ID'] == company['Company ID']])
        company_component(company, num_job_listings)

else:
    st.write("No companies available.")
