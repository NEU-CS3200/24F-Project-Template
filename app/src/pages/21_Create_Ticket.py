import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title(f"Create Ticket")
with st.form("ticket_data"):

    summary_input = st.text_input(
        "Summary",
        placeholder="State the issue and it's details",
        key="ticket_summary")

    st.form_submit_button('Search')