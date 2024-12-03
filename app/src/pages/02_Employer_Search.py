import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title(f"Student Search")
with st.form("student_search"):
    
    company_input = st.text_input(
        "Search Companies",
        placeholder="Enter company name",
        key="search")

    employer_input = st.text_input(
        "Search Employers",
        placeholder="Enter employer name",
        key="search")

    if st.session_state["role"] == "coop_advisor":
        st.radio(
            "Employer Type",
            key="employer_type",
            options=["All", "Already Advising",],
        )

    if st.session_state["role"] == "student":
        st.radio(
            "Employer Type",
            key="employer_type",
            options=["All", "Applied", "Flagged",],
        )

    st.form_submit_button('Search')



