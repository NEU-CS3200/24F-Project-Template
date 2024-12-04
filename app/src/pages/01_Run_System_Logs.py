import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests
from datetime import datetime

st.set_page_config(layout = 'wide')

SideBarLinks()

# Page Configuration
st.set_page_config(page_title="Run System Logs", layout='wide')

# Page Header
st.title("Access System Logs")
st.write("### Analyze and export system logs for troubleshooting.")

# Log Filters
st.sidebar.header("Filter Logs")
log_level = st.sidebar.selectbox("Log Level", ["INFO", "WARNING", "ERROR", "DEBUG"])
date_filter = st.sidebar.date_input("Date", datetime.now())

# Log Simulation (Replace with actual log fetching)
def fetch_logs(log_level, date_filter):
    logs = [
        f"[INFO] {date_filter} - System started successfully.",
        f"[WARNING] {date_filter} - Disk usage is at 85%.",
        f"[ERROR] {date_filter} - Database connection timeout.",
        f"[DEBUG] {date_filter} - Debugging user authentication module.",
    ]
    return [log for log in logs if log.startswith(f"[{log_level}]")]

logs = fetch_logs(log_level, date_filter)

# Display Logs
if logs:
    st.write(f"### Logs for {log_level} on {date_filter}:")
    for log in logs:
        st.text(log)
else:
    st.write(f"No logs found for {log_level} on {date_filter}.")

# Download Logs
if st.button("Export Logs as File"):
    log_file_content = "\n".join(logs)
    st.download_button(
        label="Download Logs",
        data=log_file_content,
        file_name=f"system_logs_{log_level}_{date_filter}.txt",
        mime="text/plain",
    )

# Placeholder for Future Enhancements
st.write("### Future Enhancements")
st.text("- Add filtering by user or system module.")
st.text("- Connect to a real logging database.")
st.text("- Real-time log monitoring.")