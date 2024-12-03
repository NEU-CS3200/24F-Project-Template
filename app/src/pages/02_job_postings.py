import streamlit as st
from modules.nav import SideBarLinks
import requests
import logging
logger = logging.getLogger(__name__)

st.set_page_config(layout = 'wide')

SideBarLinks()

if st.button("Back", key="back_button"):
    st.switch_page('pages/02_recruiter_home.py')

st.title("View or edit job postings from your company.")

# Display all companies, and whichever one they choose, 
# call the job posting api get using the company id
companies = requests.get('http://api:4000/co/companies').json()
company_names = [company['name'] for company in companies]
st.markdown("### **Select a company to view job postings**")
selected_company = st.selectbox("", company_names)

if selected_company:
        for company in companies:
            if company['name'] == selected_company:
                company_id = company['id']
                company_name = company['name']
                break

        job_postings_response = requests.get(f"http://api:4000/jp/jobPostings/{company_id}")
        if job_postings_response.status_code == 200:
            job_postings = job_postings_response.json()
            job_postings.reverse()
        else:
            st.error("Failed to load job postings.")
            job_postings = []

        st.subheader(f"Job Postings for {company_name}:")

        # Display the job postings
        for job_posting in job_postings:
            posting_id = job_posting['id']
            posting_title = job_posting['name']
            posting_desc = job_posting['description']
            posting_location = job_posting['location']
            posting_date = job_posting['datePosted']

            # show number of views and applications
            posting_stats_response = requests.get(f"http://api:4000/jp/jobPostings/statistics/{posting_id}")
            
            if posting_stats_response.status_code == 200:
                posting_stats = posting_stats_response.json()
            else:
                st.error("Failed to job posting statistics.")
                posting_stats = []

            posting_views = posting_stats['num_views']
            posting_apps = posting_stats['num_apps']
            
            col_delete = st.columns([4, 1])  # Column for delete button

            with col_delete:
                if st.button("Delete", key=f"delete_{posting_id}"):
                    delete_response = requests.delete(f"http://api:4000/jp/jobPostings/{posting_id}")
                    if delete_response.status_code == 200:
                        st.success("Posting deleted successfully!")
                    else:
                        st.error(f"Failed to delete job posting: {delete_response.text}")
