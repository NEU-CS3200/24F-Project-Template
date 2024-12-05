import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests
import pandas as pd
import time

st.set_page_config(layout = 'wide')

SideBarLinks()

# Set the URL of your API endpoint for system logs
url = "http://api:4000/t/SystemLog"

# Title of the Streamlit application
st.title("System Logs Viewer")

# Function to fetch system logs
@st.cache_data(ttl=60, show_spinner=True)
def fetch_system_logs():
    """Fetch logs from the Flask API."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for HTTP errors
        data = response.json()
        
        # Convert to DataFrame
        logs_df = pd.DataFrame(
            data, 
            columns=["LogID", "TicketID", "Timestamp", "Activity", "MetricType", "Privacy", "Security"]
        )
        return logs_df
    except requests.exceptions.RequestException as e:
        st.error(f"Error fetching system logs: {e}")
        return pd.DataFrame()

# Streamlit App Layout
st.title("Real-Time App Performance Diagnostics")
st.markdown("This page provides real-time diagnostics on application performance using logs from the SystemLog API.")

# Set up auto-refresh
refresh_interval = st.slider("Set refresh interval (seconds):", min_value=10, max_value=60, value=30, step=5)
st.info(f"The page will refresh every {refresh_interval} seconds.")

# Real-time Logs Display
placeholder = st.empty()  # Placeholder for the data

while True:
    # Fetch system logs
    logs_df = fetch_system_logs()

    with placeholder.container():
        if not logs_df.empty:
            st.dataframe(logs_df, use_container_width=True)

            # Show summary metrics
            st.write("### Summary Metrics")
            col1, col2, col3 = st.columns(3)
            with col1:
                st.metric("Total Logs", len(logs_df))
            with col2:
                st.metric("Critical Logs", len(logs_df[logs_df["MetricType"] == "Critical"]))
            with col3:
                st.metric("Unique Activities", logs_df["Activity"].nunique())
        else:
            st.warning("No logs available at the moment.")

    # Refresh page at the specified interval
    time.sleep(refresh_interval)

