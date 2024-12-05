import logging
import streamlit as st
import requests
from modules.nav import SideBarLinks

logger = logging.getLogger(__name__)

# Configure Streamlit page
st.set_page_config(layout='wide')

# Sidebar Navigation

SideBarLinks()


# Page Title
st.title('Student List')
st.subheader('View Students in Your Community')

# Fetch Data from API
try:
    # Make the API request
    results = requests.get('http://api:4000/s/student2').json()
    st.dataframe(results)
except requests.exceptions.RequestException as e:
    # Handle any request exceptions (e.g., connection errors)
    st.error("An error occurred while fetching student profiles. Please try again later.")
    logger.error(f"RequestException: {e}")


