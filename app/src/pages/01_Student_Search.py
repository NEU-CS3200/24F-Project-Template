import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title(f"Student Search")

text_input = st.text_input(
    "Search",
    placeholder="Enter student name or Id#",
    key="search"
)
  