import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests
import pandas as pd

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title('System Health Dasbhoard')

# API endpoint for System Health logs
url = "http://api:4000/t/SystemHealth"

# Fetch system logs with caching to avoid redundant API calls
@st.cache_data(show_spinner=True)
def fetch_system_health_logs():
    """Fetch logs from the /SystemHealth endpoint."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise exception for HTTP errors
        data = response.json()  # Assuming the API returns JSON
        # Convert to DataFrame for better handling
        logs_df = pd.DataFrame(data, columns=["LogID", "Timestamp", "Status", "MetricType"])
        return logs_df
    except requests.exceptions.RequestException as e:
        st.error(f"Error fetching system health logs: {e}")
        return pd.DataFrame()

# Fetch data
logs_df = fetch_system_health_logs()

# Main layout
st.title("User Activity Logs for Troubleshooting")

if not logs_df.empty:
    st.write("### System Health Logs")

    # Convert Timestamp column to datetime
    logs_df["Timestamp"] = pd.to_datetime(logs_df["Timestamp"])

    # Interactive Filters
    with st.sidebar:
        st.header("Filters")
        status_filter = st.multiselect("Filter by Status", logs_df["Status"].unique(), default=logs_df["Status"].unique())
        metric_filter = st.multiselect("Filter by Metric Type", logs_df["MetricType"].unique(), default=logs_df["MetricType"].unique())
        date_range = st.date_input("Filter by Date Range", 
                                   [logs_df["Timestamp"].min().date(), logs_df["Timestamp"].max().date()])

    # Apply Filters
    filtered_logs = logs_df[
        (logs_df["Status"].isin(status_filter)) &
        (logs_df["MetricType"].isin(metric_filter)) &
        (logs_df["Timestamp"].dt.date.between(date_range[0], date_range[1]))
    ]

    # Display Filtered Logs
    st.write("### Filtered Logs")
    st.dataframe(filtered_logs, use_container_width=True)

    # Summary Metrics
    st.write("### Summary Metrics")
    col1, col2, col3 = st.columns(3)
    with col1:
        st.metric("Total Logs", len(filtered_logs))
    with col2:
        st.metric("Unique Status Types", filtered_logs["Status"].nunique())
    with col3:
        st.metric("Unique Metric Types", filtered_logs["MetricType"].nunique())

    # Download Filtered Logs
    st.write("### Export Data")
    csv_data = filtered_logs.to_csv(index=False)
    st.download_button(
        label="Download Logs as CSV",
        data=csv_data,
        file_name="filtered_user_activity_logs.csv",
        mime="text/csv",
    )
else:
    st.warning("No logs available to display.")

# Footer
st.write("---")
st.write("#### Notes")
st.text("Logs are fetched in real-time from the /SystemHealth API.")

  