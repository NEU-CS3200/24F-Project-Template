import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests
import pandas as pd

st.set_page_config(layout = 'wide')

SideBarLinks()

# Page Header
st.title("Real-Time App Diagnostics")
st.write("### Monitor system activity and analyze logs in real-time.")

# Backend API URL
API_URL = "http://api:4000/c/SystemLog"  # Replace with your backend API URL

# Fetch Logs from API
@st.cache_data(show_spinner=True)
def fetch_system_logs():
    """Fetch system logs from the Flask API."""
    try:
        response = requests.get(API_URL)
        response.raise_for_status()
        logs = response.json()  # Assuming the API returns a JSON list
        # Convert to a DataFrame for easier handling
        logs_df = pd.DataFrame(logs, columns=["TicketID", "Timestamp", "Activity", "MetricType", "Privacy", "Security"])
        return logs_df
    except requests.exceptions.RequestException as e:
        st.error(f"Failed to fetch system logs: {e}")
        return pd.DataFrame()

# Fetch the logs
logs_df = fetch_system_logs()

# Display Logs
if not logs_df.empty:
    st.write("### System Logs")
    
    # Add Filters
    col1, col2 = st.columns(2)
    with col1:
        activity_filter = st.multiselect("Filter by Activity", options=logs_df["Activity"].unique(), default=logs_df["Activity"].unique())
    with col2:
        metric_filter = st.multiselect("Filter by Metric Type", options=logs_df["MetricType"].unique(), default=logs_df["MetricType"].unique())

    # Apply Filters
    filtered_logs = logs_df[
        (logs_df["Activity"].isin(activity_filter)) & 
        (logs_df["MetricType"].isin(metric_filter))
    ]

    # Display Filtered Data
    st.dataframe(filtered_logs, use_container_width=True)

    # Metrics Summary
    st.write("### Diagnostics Summary")
    col1, col2, col3 = st.columns(3)
    with col1:
        st.metric("Total Logs", len(filtered_logs))
    with col2:
        st.metric("High Priority Logs", len(filtered_logs[filtered_logs["MetricType"] == "High"]))
    with col3:
        st.metric("Unique Activities", filtered_logs["Activity"].nunique())

    # Download Filtered Logs
    st.write("### Export Data")
    csv = filtered_logs.to_csv(index=False)
    st.download_button(
        label="Download Logs as CSV",
        data=csv,
        file_name="filtered_system_logs.csv",
        mime="text/csv",
    )
else:
    st.warning("No logs available to display.")

# Footer
st.write("---")
st.write("#### Notes")
st.text("This page refreshes automatically with the latest system logs.")
