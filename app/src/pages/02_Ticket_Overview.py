import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests
import pandas as pd

st.set_page_config(layout = 'wide')

SideBarLinks()

# Page Header
st.title("Run System Logs")
st.write("### Analyze and export system logs for troubleshooting.")

# Backend API Configuration
API_URL = "http://your_backend_url/SystemLog"  # Replace with actual backend URL

# Fetch Logs from Backend
@st.cache_data(show_spinner=True)
def fetch_logs():
    try:
        response = requests.get(API_URL)
        response.raise_for_status()
        data = response.json()
        # Convert to DataFrame for easier manipulation
        df = pd.DataFrame(data, columns=["TicketID", "Timestamp", "Activity", "MetricType", "Privacy", "Security"])
        return df
    except requests.exceptions.RequestException as e:
        st.error(f"Error fetching logs: {e}")
        return pd.DataFrame()  # Return empty DataFrame on error

logs_df = fetch_logs()

# Display Logs
if not logs_df.empty:
    st.write("### System Logs")
    
    # Add filters
    activity_filter = st.multiselect("Filter by Activity", options=logs_df["Activity"].unique(), default=logs_df["Activity"].unique())
    metric_filter = st.multiselect("Filter by Metric Type", options=logs_df["MetricType"].unique(), default=logs_df["MetricType"].unique())

    filtered_logs = logs_df[
        (logs_df["Activity"].isin(activity_filter)) & 
        (logs_df["MetricType"].isin(metric_filter))
    ]

    st.dataframe(filtered_logs, use_container_width=True)

    # Download Logs
    if st.button("Export Logs as CSV"):
        csv = filtered_logs.to_csv(index=False)
        st.download_button(
            label="Download Logs",
            data=csv,
            file_name="filtered_system_logs.csv",
            mime="text/csv",
        )
else:
    st.write("No logs available at the moment.")

# Placeholder for Future Enhancements
st.write("### Future Enhancements")
st.text("- Real-time log updates.")
st.text("- Advanced filtering options.")
st.text("- Integration with alert systems.")
