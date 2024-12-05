import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title(f"Create Opening")
try:
    response = requests.get(f"http://api:4000/emp/employees")
    if response.status_code == 200:
        data = response.json()[0]
        with st.form("edit_profile"):
            address = st.text_input("First Name:", value=str(data["firstName"]))
            city = st.text_input("First Name:", value=str(data["firstName"]))
            country = st.text_input("Middle Name:", value=str(data["middleName"]))
            summary = st.text_input("Last Name:", value=str(data["lastName"]))
            applicant_questions = st.text_input("Preferred Name:", value=str(data["preferredName"]))
            expected_salary = st.text_input("Pronouns:", value=str(data["pronouns"]))
            company_id = st.session_state("company_id")
            

            submit_button = st.form_submit_button("Save changes")

            if submit_button:
                req_data = {
                    "address": address,
                    "city": city,
                    "country": country,
                    "summary": summary,
                    "applicant_questions": applicant_questions,
                    "expected_salary": expected_salary,
                    "company_id": company_id,
                }
                with requests.Session() as session:
                    try:
                        session.headers.update({"Content-Type": "application/json"})
                        response = session.put(
                            f"http://api:4000/users/{st.session_state['profile_id']}",
                            json=req_data,
                        )
                        logger.info(response.json())
                    except requests.exceptions.RequestException as e:
                        st.error(f"Error connecting to server: {str(e)}")
                    st.success("Profile updated successfully")

        if st.button("Go back", type="primary", use_container_width=True):
            st.switch_page("pages/03_User_Profile.py")


except requests.exceptions.RequestException as e:
    st.error(f"Error connecting to server: {str(e)}")
