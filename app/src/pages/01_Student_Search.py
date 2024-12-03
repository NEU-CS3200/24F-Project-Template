import logging
logger = logging.getLogger(__name__)

import streamlit as st
import pandas as pd
import numpy as np
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title(f"Student Search")
with st.form("student_search"):
    
    student_input = st.text_input(
        "Search Students",
        placeholder="Enter student name or Id#",
        key="search")

    if st.session_state["role"] == "coop_advisor":
        st.radio(
            "Student Type",
            key="student_type",
            options=["All", "Already Advising",],
        )

    if st.session_state["role"] == "employer":
        st.radio(
            "Student Type",
            key="student_type",
            options=["All", "Applied", "Flagged",],
        )

    st.form_submit_button('Search')



