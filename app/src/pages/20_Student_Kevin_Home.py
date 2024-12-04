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

if st.button('View and Edit My Profile', 
             type='primary', 
             use_container_width=True):
    st.switch_page('pages/23_My_Profile.py')

if st.button('Access Housing & Transit Search', 
             type='primary', 
             use_container_width=True):
    st.switch_page('pages/22_Housing_Carpool.py')

if st.button('View Advisor Communications', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/21_Advisor_Rec.py')



