import streamlit as st
from utils.frontend_routes import get_all_companies
from utils.frontend_routes import create_job_listing
import logging
logger = logging.getLogger(__name__)

def create_job_listing_modal(recruiter_id):
    companies = get_all_companies()
    company_names = [company["Name"] for company in companies]

    st.write("### Create a Job Listing")
    job_title = st.text_input("Job Title")
    description = st.text_area("Description")
    wage = st.text_input("Wage")
    company = st.selectbox("Company", options=company_names)
    company = next((item for item in companies if item["Name"] == company), None)
    col1, col2 = st.columns(2)
    with col1:
        submit = st.button("Create Job Listing")
    with col2:
        if st.button("Cancel"):
            st.session_state["create_modal"] = False

    if submit:
        payload = {
            "jobTitle": job_title,
            "description": description,
            "wage": wage,
            "companyId": company['Company ID'],
            "recruiterId": recruiter_id,
        }
        create_job_listing(payload)
        st.success("Job Listing created.")
        st.session_state["create_modal"] = False