import streamlit as st
import logging
logger = logging.getLogger(__name__)
from modules.nav import SideBarLinks


st.set_page_config(layout = 'wide')

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

st.title(f"Welcome advisor, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

if st.button('View my Students Reviews', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/02_Map_Demo.py')

if st.button('View my Students Analytics', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/01_World_Bank_Viz.py')

if st.button('View my Sent Job Listings', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/02_Map_Demo.py')