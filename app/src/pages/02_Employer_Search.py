import logging

import requests
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title(f"Employer Search")

try:
    test_response = requests.get("http://api:4000/emp/employees")

    if not test_response.status_code == 200:
        st.error("Failed to fetch categories")
except requests.exceptions.RequestException as e:
    st.error(f"Error connecting to students API: {str(e)}")

with st.form("employer_search"):
    employer_value = st.text_input(
        "Search Employers",
        placeholder="Enter employer or company name",
        key="search")

    # if st.session_state["role"] == "student":
    #     st.radio(
    #        "Employer Type",
    #        key="employer_type",
    #        options=["All", "Applied", "Flagged",],
    #    )

    submit_button = st.form_submit_button("Search")

    if submit_button:
        if not employer_value:
            st.error("Please enter an employer name or company")
        else:
            logger.info(f"Employer form submitted with data: {employer_value}")

            try:
                response1 = requests.get(
                    f"http://api:4000/emp/emp_company/{employer_value}"
                )
                response2 = requests.get(
                    f"http://api:4000/emp/emp_name/{employer_value}"
                )
                if response1.status_code == 200:
                    if len(response1.json()) != 0:
                        df = pd.json_normalize(response1.json())
                        st.write(df)
                if response2.status_code == 200:
                    if len(response2.json()) != 0:
                        df = pd.json_normalize(response2.json())
                        st.write(df)
            except requests.exceptions.RequestException as e:
                st.error(f"Error connecting to server: {str(e)}")