import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title('Housing Search')

st.write('\n\n')
st.write('## Model 1 Maintenance')
st.write("Test")
