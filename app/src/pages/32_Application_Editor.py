import logging

logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

import requests

st.set_page_config(layout="wide")

SideBarLinks()

if not st.session_state["app_id"]:
    logger.error("No application ID found in session state")

try:
    response = requests.get(
        f"http://api:4000/app/applications/{st.session_state['app_id']}"
    )
    if response.status_code == 200:
        data = response.json()[0]
        st.title(f"{data.get('summary')}")
        with st.form("app_editor"):
            try:
                questions = requests.get(
                    f"http://api:4000/app/applications/{st.session_state['app_id']}/questions"
                ).json()[0]
                st.write(
                    f"Please answer the following questions: {questions['applicantQuestions']}"
                )
                question_response = st.text_area(
                    "Question Response", value=data.get("questionResponse")
                )
            except requests.exceptions.RequestException as e:
                st.error(f"Error connecting to server: {str(e)}")

            gpa = st.number_input("GPA", value=float(data.get("GPA")))

            submit_button = st.form_submit_button("Save changes")

            if submit_button:
                data = {
                    "questionResponse": question_response,
                    "GPA": gpa,
                }
                with requests.Session() as session:
                    try:
                        session.headers.update({"Content-Type": "application/json"})
                        response = session.put(
                            f"http://api:4000/app/applications/{st.session_state['app_id']}",
                            json=data,
                        )
                        if response.status_code == 200:
                            st.success("Changes saved successfully")
                    except requests.exceptions.RequestException as e:
                        st.error(f"Error connecting to server: {str(e)}")
except requests.exceptions.RequestException as e:
    st.error(f"Error connecting to server: {str(e)}")
