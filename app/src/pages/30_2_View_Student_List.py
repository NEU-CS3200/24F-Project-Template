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
    results = requests.get('http://api:4000/students').json()
    st.dataframe(results)
except requests.exceptions.RequestException as e:
    # Handle any request exceptions (e.g., connection errors)
    st.error("An error occurred while fetching student profiles. Please try again later.")
    logger.error(f"RequestException: {e}")

# Debugging Information
st.write("If the above table is empty, please verify the API connection and response format.")



'''
import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title('Student List')
st.write('\n\n')

results = requests.get('http://api:4000/c/students').json()
st.dataframe(results)
'''