import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title(f"Welcome Student, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

if st.button('Positon Opening Search', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/31_Position_Opening_Search.py')

if st.button('Employer Search', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/32_Employer_Search.py')

if st.button("Application Editor",
             type='primary',
             use_container_width=True):
  st.switch_page('pages/33_Application_Editor.py')