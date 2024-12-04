<<<<<<< HEAD
import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

import logging
=======
>>>>>>> 2077be10ba693456e2fb92b0c8eae83d8ca62c9d
import streamlit as st
import pandas as pd
import requests

# Configure Streamlit page
st.set_page_config(layout='wide')
st.title("All Tasks")

# API endpoint for tasks
api_url = 'http://localhost:4000/api/advisor/tasks'

# Fetch task data from the API
try:
    response = requests.get(api_url)
    if response.status_code == 200:
        # Parse API response JSON
        data = response.json()
        
        # Check if data is available
        if data:
            # Convert to DataFrame
            df = pd.DataFrame(data)
            
            # Display the table dynamically
            st.dataframe(
                df,
                use_container_width=True,
                hide_index=True
            )
        else:
            st.warning("No tasks available.")
    else:
        st.error(f"Failed to fetch data. API returned status code: {response.status_code}")
except Exception as e:
    st.error(f"Error loading tasks: {str(e)}")

    
    
