import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

st.title(" Full Name's Profile")
st.image("assets/profile_pic.png", width=150)
st.write("Pronouns: ")
st.write("Preferred Name: ")
st.write("Age:",)
st.write("Email:",)
st.write("Phone Number:",)
st.wrire("Last Active: ")
st.write("Bio:",)

if st.button('Save Changes', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/03_User_Profile.py')
