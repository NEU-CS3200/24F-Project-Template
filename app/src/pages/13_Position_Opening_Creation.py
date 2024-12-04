import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title(f"Create Opening")
with st.form("opening data"):

    summary_input = st.text_input(
        
    )