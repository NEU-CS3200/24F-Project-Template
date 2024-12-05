
import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title(f"Welcome Student, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

if st.button('Edit Profile', type='primary', use_container_width=True):
    st.switch_page('pages/31_Edit_Student_Profile.py')

# View Student List Button
if st.button('View Student List', type='primary', use_container_width=True):
    st.switch_page('pages/32_View_Student_List.py')

if st.button('View Professional Events', type='primary', use_container_width=True):
    st.switch_page('pages/34_View_Events.py')

if st.button('Feedback', type='primary', use_container_width=True):
    st.switch_page('pages/37_Delete_Feedback.py')




