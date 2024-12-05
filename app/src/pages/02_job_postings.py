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

st.title("View or delete job postings from your company.")

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

        col_info, col_delete = st.columns([5, 1])  # Two columns: displaying posting and delete button
        
        with col_info:
        # Display the job postings
            for idx, job_posting in enumerate(job_postings):
                posting_id = job_posting['id']
                posting_title = job_posting['name']
                posting_desc = job_posting['description']
                posting_location = job_posting['location']
                posting_date = job_posting['datePosted']

                # get number of applications
                posting_apps_response = requests.get(f"http://api:4000/jp/jobPostings/applications/{posting_id}")
                
                if posting_apps_response.status_code == 200:
                    posting_apps = posting_apps_response.json()
                else:
                    st.error("Failed to get job posting application count.")
                    posting_apps = []

                app_count = posting_apps[0]['num_apps']

                # get number average rating
                posting_rating_response = requests.get(f"http://api:4000/jp/jobPostings/rating/{posting_id}")
                
                if posting_rating_response.status_code == 200:
                    posting_rating = posting_rating_response.json()
                else:
                    st.error("Failed to get average rating for job posting.")
                    posting_rating = []

                avg_rating = posting_rating[0]['avg_rating']


                st.markdown("""
                    <style>
                        .stTable tr {
                            height: 57px; # use this to adjust the height
                        }
                    </style>
                """, unsafe_allow_html=True)

                if idx == 0:
                    postings_table = st.table({"name":{posting_id: posting_title},
                                            "description":{posting_id: posting_desc},
                                            "location":{posting_id: posting_location},
                                            "datePosted":{posting_id: posting_date},
                                            "num_apps":{posting_id: app_count},
                                            "avg_rating":{posting_id: avg_rating}})
                else:
                    postings_table.add_rows({"name":{posting_id: posting_title},
                                            "description":{posting_id: posting_desc},
                                            "location":{posting_id: posting_location},
                                            "datePosted":{posting_id: posting_date},
                                            "num_apps":{posting_id: app_count},
                                            "avg_rating":{posting_id: avg_rating}})

        with col_delete:
            st.write('')
            st.write('')
            st.write('')
            st.write('')
            st.write('')
            for job_posting in job_postings:
                posting_id = job_posting['id']

                if st.button("Delete", key=f"delete_{posting_id}"):
                    delete_response = requests.delete(f"http://api:4000/jp/jobPostings/{posting_id}")
                    if delete_response.status_code == 200:
                        st.success("Posting deleted successfully!")
                    else:
                        st.error(f"Failed to delete job posting: {delete_response.text}")
