import streamlit as st
import pandas as pd
import requests
from modules.nav import SideBarLinks

# Configure Streamlit page
st.set_page_config(layout='wide')
st.title("Tasks Dashboard")
SideBarLinks()


# API endpoint for tasks
api_url = 'http://localhost:4000/api/students/feedback'  # Adjust the URL to match your actual Flask route

# Fetch task data from the API
try:
    response = requests.get(api_url)
    if response.status_code == 200:
        # Parse API response JSON
        data = response.json()

        if data:
            # Convert to DataFrame
            df = pd.DataFrame(data)

            # Sidebar Filters
            st.sidebar.header("Filter Tasks")
            student_filter = st.sidebar.text_input("Search by Student Name")
            student_id_filter = st.sidebar.text_input("Search by Student ID")
            task_status_filter = st.sidebar.text_input("Search by Task Status")

            # Apply filters
            if student_filter:
                df = df[df['student_name'].str.contains(student_filter, case=False, na=False)]
            if student_id_filter:
                df = df[df['StudentID'].astype(str).str.contains(student_id_filter, case=False, na=False)]
            if task_status_filter:
                df = df[df['task_status'].str.contains(task_status_filter, case=False, na=False)]

            # Reorder columns to match SQL query
            column_order = [
                "TaskID", "Description", "Reminder", "DueDate", "Status", 
                "AdvisorID", "StudentID", "student_name"
            ]
            df = df[column_order]

            # Display Data
            st.subheader(f"Showing {len(df)} Task Entries")
            st.dataframe(
                df,
                use_container_width=True,
                hide_index=True
            )

            # Detailed View
            if st.checkbox("Show Detailed Task View"):
                for index, row in df.iterrows():
                    with st.expander(f"Task ID: {row['TaskID']}"):
                        st.markdown(f"**Student Name:** {row['student_name']}")
                        st.markdown(f"**Student ID:** {row['StudentID']}")
                        st.markdown(f"**Task Description:** {row['Description']}")
                        st.markdown(f"**Reminder Date:** {row['Reminder']}")
                        st.markdown(f"**Due Date:** {row['DueDate']}")
                        st.markdown(f"**Task Status:** {row['Status']}")
                        st.markdown(f"**Advisor ID:** {row['AdvisorID']}")
                        st.markdown("---")
        else:
            st.warning("No task entries found.")
    else:
        st.error(f"Failed to fetch tasks. API returned status code: {response.status_code}")
except Exception as e:
    st.error(f"Error loading tasks: {str(e)}")


