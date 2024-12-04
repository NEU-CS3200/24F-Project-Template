import streamlit as st
from modules.nav import SideBarLinks
import requests
import logging
import json
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

            posting_views = posting_stats[0]['num_views']
            posting_apps = posting_stats[0]['num_apps']
            
            col_info, col_stats = st.columns([3, 1])  # Two columns for edit and delete buttons

            dict1 = json.loads(job_posting)
            dict2 = json.loads(posting_stats)
            combined_dict = {**dict1, **dict2}
            combined_json = json.dumps(combined_dict)

            st.dataframe(combined_json)

            with col_info:
                st.dataframe(job_posting)

            with col_stats:
                st.dataframe(posting_stats)

            if st.button("Delete", key=f"delete_{posting_id}"):
                delete_response = requests.delete(f"http://api:4000/jp/jobPostings/{posting_id}")
                if delete_response.status_code == 200:
                    st.success("Posting deleted successfully!")
                else:
                    st.error(f"Failed to delete job posting: {delete_response.text}")
