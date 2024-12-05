import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks
import requests


st.set_page_config(layout = 'wide')
SideBarLinks()

# Logger for debugging
logger = logging.getLogger(__name__)

# Page title
st.title("Upcoming Professional Events")

# Fetch events from the API
try:
    response = requests.get("http://api:4000/s/events")
    if response.status_code == 200:
        events = response.json()
        if events:
            for event in events:
                st.subheader(event["Name"])
                st.markdown(f"**Date:** {event['Date']}")
                st.markdown(f"**Community ID:** {event['CommunityID']}")
                st.markdown(f"**Description:** {event['Description']}")
                st.write("---")
        else:
            st.info("No upcoming events at the moment.")
    else:
        st.error(f"Failed to fetch events. Error: {response.status_code} - {response.text}")
except requests.exceptions.RequestException as e:
    logger.error(f"Error fetching events: {e}")
    st.error("An error occurred while fetching events. Please try again later.")