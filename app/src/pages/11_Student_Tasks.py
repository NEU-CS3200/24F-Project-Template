import logging
import streamlit as st
from modules.nav import SideBarLinks
import requests
import pandas as pd

# Configure logging
logger = logging.getLogger(__name__)

st.set_page_config(layout='wide')
SideBarLinks()

st.title("Student Tasks")

# Load and display task data
try:
    response = requests.get('http://api:4000/api/advisor')
    if response.status_code == 200:
        data = response.json()
        if data:
            # Convert data to DataFrame and ensure all columns are strings
            df = pd.DataFrame(data).astype(str)
            
            # Display filtered dataframe with explicit column types
            st.dataframe(
                df.astype(str),
                use_container_width=True,
                column_config={
                    "student_name": "Student Name",
                    "task_status": "Task Status",
                    "due_date": "Due Date",
                    "date_assigned": "Date Assigned",
                    "description": "Description"
                },
                hide_index=True
            )
        else:
            logger.warning("No student tasks data received from API")
            st.warning("No student tasks available")
    else:
        logger.error(f"API request failed with status code: {response.status_code}")
        st.error(f"Failed to fetch student tasks. Status code: {response.status_code}")
except Exception as e:
    logger.error(f"Error loading student tasks: {str(e)}")
    st.error("Error loading student tasks. Please try again later.")
    
