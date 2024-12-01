import streamlit as st
from modules.nav import SideBarLinks
import requests
import logging
logger = logging.getLogger(__name__)

st.set_page_config(layout = 'wide')

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

if st.button("Back", key="back_button"):
    st.switch_page('pages/00_student_home.py')

st.title("Choose an available company below to view job postings and reviews.")

# Display all companies, and whichever one they choose, 
# call the api to display all reviews for that company
companies = requests.get('http://api:4000/co/companies').json()
company_names = [company['name'] for company in companies]
st.markdown("### **Select a company**")
selected_company = st.selectbox("", company_names)

col1, col2 = st.columns(2)

selected_job_id = st.session_state.get("selected_job_id", None)

with col1:
    if selected_company:
        for company in companies:
            if company['name'] == selected_company:
                company_id = company['id']
                company_name = company['name']
                break

        all_job_postings_reponse = requests.get(f"http://api:4000/jp/jobPostings/{company_id}")

        if all_job_postings_reponse.status_code == 200:
            all_job_postings = all_job_postings_reponse.json()
            all_job_postings.reverse()

            if all_job_postings == []:
                st.info("No jobs posted for this company.")
        else:
            st.error("Failed to load job postings.")
            all_job_postings = []

        st.subheader(f"All Job Postings From {company_name}:")

        # Display the job postings for the company
        for job_posting in all_job_postings:
            st.write(f"Title: {job_posting['name']}")
            st.write(f"Description: {job_posting['description']}")
            st.write(f"Location: {job_posting['location']}")
            st.write(f"Contact Name & Email: {job_posting['firstName']} {job_posting['lastName']} | {job_posting['email']} | {job_posting['phone']}")
            st.write(f"Date Posted: {job_posting['datePosted']}")
            if st.button("View Reviews"):
                st.session_state["selected_job_id"] = job_posting['id']
                st.session_state["selected_job_name"] = job_posting['name']

            st.write('---')

# with col2:
#     if selected_job_id:
#         reviews_response = requests.get(f"http://api:4000/jp/jobPostings/{selected_job_id}")

#         if reviews_response.status_code == 200:
#             reviews = reviews_response.json()
#             st.subheader(f"Reviews for {st.session_state['selected_job_name']}:")

#             if reviews:
#                 # Display the reviews
#                 for review in reviews:
#                     st.write(f"Reviewer: {review['reviewer_name']}")
#                     st.write(f"Rating: {review['rating']}/5")
#                     st.write(f"Review: {review['content']}")
#                     st.write(f"Date: {review['date']}")
#                     st.write('---')
#             else:
#                 st.info("No reviews available for this job posting.")
#         else:
#             st.error("Failed to load reviews.")