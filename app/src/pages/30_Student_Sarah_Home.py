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

if st.button('View Advisor Feedback', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/21_Advisor_Feedback.py')

if st.button('View Professional Events', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/31_Professional_Events.py')

if st.button('View Alumni Board', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/31_Professional_Events.py')