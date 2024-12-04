import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests
import pandas as pd

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title('Advisor Communications')

if st.button('View Housing Recommendations'):
    st.switch_page('pages/26_Advisor_Housing.py')
if st.button('Feedback Form'):
    st.switch_page('pages/25_Advisor_Feedback.py')

