import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks
import requests


st.set_page_config(layout = 'wide')
SideBarLinks()


logger = logging.getLogger(__name__)

st.title("Delete Past Events")

event_id = st.text_input("Enter the Event ID of the event to delete:", placeholder="e.g., 101")


if st.button("Delete Event"):
    if event_id.strip() == "":
        st.error("Event ID cannot be empty. Please enter a valid Event ID.")
    else:
        try:

            response = requests.delete(f"http://api:4000/s/events/{event_id}")
            if response.status_code == 200:
                st.success(response.json().get("message", "Event deleted successfully."))
            else:
                st.error(f"Failed to delete event. Error: {response.status_code} - {response.text}")
        except requests.exceptions.RequestException as e:
            logger.error(f"Error deleting event with ID {event_id}: {e}")
            st.error("An error occurred while deleting the event. Please try again later.")


st.title("Upcoming Professional Events")

try:
    response = requests.get("http://api:4000/s/events")
    if response.status_code == 200:
        events = response.json()
        if events:
            for event in events:
                st.subheader(event["Name"])
                st.markdown(f"**Event ID:** {event['EventID']}")
                st.markdown(f"**Date:** {event['Date']}")
                st.markdown(f"**Location:** {event['Location']}")
                st.markdown(f"**Description:** {event['Description']}")
                st.write("---")
        else:
            st.info("No upcoming events at the moment.")
    else:
        st.error(f"Failed to fetch events. Error: {response.status_code} - {response.text}")
except requests.exceptions.RequestException as e:
    logger.error(f"Error fetching events: {e}")
    st.error("An error occurred while fetching events. Please try again later.")