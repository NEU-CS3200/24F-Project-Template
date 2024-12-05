import streamlit as st
from modules.nav import SideBarLinks
import requests
import logging
logger = logging.getLogger(__name__)

st.set_page_config(layout = 'wide')
SideBarLinks()

if st.button("Back", key="back_button"):
    st.switch_page('pages/00_student_home.py')

st.title("Choose an available company below to view job postings and reviews.")

companies = requests.get('http://api:4000/co/companies').json()
company_names = [company['id'] for company in companies]

col1, col2 = st.columns(2)

with col1: 
    for company in companies:
        avg_rating = requests.get(f"http://api:4000/co/companies/avg_rating/{company['id']}").json().get('AvgRating', 'N/A')
        st.write(
        f"""
        <div style="margin: 10px; padding: 15px; border: 1px solid #ddd; border-radius: 5px; 
                box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); min-width: 200px;">
            <p><strong>Name:</strong> {company['name']}</p>
            <p><strong>Average Rating:</strong> {avg_rating}</p>
        </div>
        """,
        unsafe_allow_html=True
        )
        if st.button(f"Show Job Postings for {company['name']}", key=f"job_postings_{company['name']}"):
            st.session_state["company_id"] = company['id']
            st.session_state["company_name"] = company['name']

with col2:
    if "company_id" in st.session_state:
        company_id = st.session_state["company_id"]
        company_name = st.session_state["company_name"]
        job_postings_response = requests.get(f"http://api:4000/jp/jobPostings/{company_id}")
        if job_postings_response.status_code == 200:
            job_postings = job_postings_response.json()
            for job_posting in job_postings:
                with st.container():
                    st.subheader(f"{job_posting['name']} @ {company_name}")
                    st.write(f"{job_posting['description']}")
                    st.write(f"Location: {job_posting['location']}")
                    st.write(f"Date Posted: {job_posting['datePosted']}")
                    if st.button("Easy Apply", key=f"easy_apply_{job_posting['id']}"):
                        application_request = requests.post(f"http://api:4000/jp/jobPostings/submit_app/{job_posting['id']}")
                        if application_request.status_code == 200:
                            application = application_request.json()
                            st.success("Application submitted successfully. Good luck!")
                            st.write("---")
                        else: 
                            st.error("Application already submitted.")
            
        else:
            st.error("Failed to load job postings.")

        

        