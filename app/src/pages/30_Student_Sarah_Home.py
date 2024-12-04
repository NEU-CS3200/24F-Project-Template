
import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()

#st.session_state["first_name"] = st.text_input("Enter your first name:", "Default Name")
st.title(f"Welcome Student, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')



# View Student List Button
if st.button('View Student List', type='primary', use_container_width=True):
    st.switch_page('pages/30_2_View_Student_List.py')

# Manage Student Profile Button
if st.button('Manage Student Profile', type='primary', use_container_width=True):
    st.switch_page('pages/30_1_Manage_Student_Profile.py')

# Additional Sections for Sarah's Use Case
if st.button('Connect with Community', type='primary', use_container_width=True):
    st.switch_page('pages/30_3_Connect_Community.py')

if st.button('View Events & Workshops', type='primary', use_container_width=True):
    st.switch_page('pages/30_4_View_Events.py')

if st.button('Submit Feedback', type='primary', use_container_width=True):
    st.switch_page('pages/30_5_Submit_Feedback.py')

if st.button('Advisor Recommendations', type='primary', use_container_width=True):
    st.switch_page('pages/30_6_Advisor_Recommendations.py')

# Example for loading data in a page if required
if 'data' not in st.session_state:
    st.session_state['data'] = {}  # Placeholder for any session-wide data
