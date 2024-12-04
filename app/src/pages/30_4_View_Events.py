import logging
import streamlit as st
import requests

logger = logging.getLogger(__name__)

st.title("Upcoming Events and Workshops")

try:
    response = requests.get("http://your-api-url.com/community/{community_id}/events")
    if response.status_code == 200:
        events = response.json()
        for event in events:
            st.subheader(event["title"])
            st.text(f"Date: {event['date']}")
            st.text(f"Location: {event['location']}")
            st.text(f"Description: {event['description']}")
            st.write("---")
    else:
        st.error(f"Failed to fetch events. Error: {response.status_code}")
except requests.exceptions.RequestException as e:
    logger.error(f"Error fetching events: {e}")
    st.error("An error occurred while fetching events. Please try again later.")
