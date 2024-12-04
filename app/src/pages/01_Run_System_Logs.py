import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests
import pandas as pd

st.set_page_config(layout = 'wide')

SideBarLinks()

# Page Header
st.title("Access System Logs")
st.write("### Monitor system activity and analyze logs in real-time.")

# Backend API URL
API_URL = "http://api:4000/t/SystemLog" 

# Fetch System Logs
def fetch_system_logs():
    """Fetch logs from the Flask API."""
    try:
        response = requests.get(API_URL)
        response.raise_for_status()  # Raise exception for HTTP errors
        
        st.write("Raw API Response:", response.text)  # Print raw response for debugging
        
        data = response.json()  # Assuming API returns JSON (list of dictionaries)
        
        if not data:
            st.warning("No data returned from the API.")
            return pd.DataFrame()  # Return an empty DataFrame if no data is returned
        
        # Convert the list of dictionaries directly into a DataFrame
        logs_df = pd.DataFrame(data)  # Pandas will automatically handle the keys as column headers
        
        st.write("Logs DataFrame:", logs_df)  # Debug DataFrame
        return logs_df
    except requests.exceptions.RequestException as e:
        st.error(f"Error fetching system logs: {e}")
        return pd.DataFrame()  # Return empty DataFrame on error

# Fetch data
logs_df = fetch_system_logs()

# Display Logs
if not logs_df.empty:
    st.write("### System Logs")
    # Interactive Filters
    col1, col2 = st.columns(2)
    with col1:
        activity_filter = st.multiselect("Filter by Activity", logs_df["Activity"].unique(), default=logs_df["Activity"].unique())
    with col2:
        metric_filter = st.multiselect("Filter by Metric Type", logs_df["MetricType"].unique(), default=logs_df["MetricType"].unique())

    # Apply Filters
    filtered_logs = logs_df[
        (logs_df["Activity"].isin(activity_filter)) &
        (logs_df["MetricType"].isin(metric_filter))
    ]

    # Display Filtered Logs
    st.dataframe(filtered_logs, use_container_width=True)

    # Summary Metrics
    st.write("### Summary Metrics")
    col1, col2, col3 = st.columns(3)
    with col1:
        st.metric("Total Logs", len(filtered_logs))
    with col2:
        st.metric("High Priority Logs", len(filtered_logs[filtered_logs["MetricType"] == "High"]))
    with col3:
        st.metric("Unique Activities", filtered_logs["Activity"].nunique())

    # Download Filtered Logs
    st.write("### Export Data")
    csv_data = filtered_logs.to_csv(index=False)
    st.download_button(
        label="Download Logs as CSV",
        data=csv_data,
        file_name="filtered_system_logs.csv",
        mime="text/csv",
    )
else:
    st.warning("No logs available to display.")

# Footer
st.write("---")
st.write("#### Notes")
st.text("Data fetched directly from the system logs API in real time.")
