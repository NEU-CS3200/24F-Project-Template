import pandas as pd
import altair as alt
import streamlit as st
from modules.nav import SideBarLinks
import requests
import logging

logger = logging.getLogger(__name__)

st.set_page_config(layout='wide')

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

if st.button("Back", key="back_button"):
    st.switch_page('pages/02_recruiter_home.py')

st.title("View Student Feedback by Company.")

# Display all companies
companies = requests.get('http://web-api:4000/co/companies').json()
company_names = [company['name'] for company in companies]
st.markdown("### **Select a company to view feedback.**")
selected_company = st.selectbox("", company_names)

#get student feedback for selected company
if selected_company:
    for company in companies:
        if company['name'] == selected_company:
            company_id = company['id']
            break

    #get student feedback for selected company
    feedback_response = requests.get(f'http://web-api:4000/jp/jobPostings/reviews/{company_id}')

    if feedback_response.status_code == 200:
        feedback = feedback_response.json()
        st.markdown("### Student Feedback:")
        
        if feedback:
            for review in feedback:
                st.markdown(f"**{review['title']}**")
                st.markdown(f"Rating: {review['rating']}")
                st.markdown(f"Date Posted: {review['datePosted']}")
                st.markdown(f"Content: {review['content']}")
                st.markdown("---")
        else:
            st.info("No feedback available for this company.")
    else:
        st.error(f"Failed to load student feedback data. Status code: {feedback_response.status_code}")
