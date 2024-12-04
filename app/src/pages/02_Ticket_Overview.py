import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests
import pandas as pd

st.set_page_config(layout = 'wide')

SideBarLinks()

# Page Header
st.title("Ticket Overview")
st.write("### Monitor system activity and analyze logs in real-time.")

API_URL = "http://api:4000/t/tickets" 


