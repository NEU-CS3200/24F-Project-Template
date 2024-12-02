import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks
import mysql.connector
import pandas as pd
from mysql.connector import Error
import requests

# Set Streamlit page configuration
st.set_page_config(layout="wide")

# Add navigation sidebar
SideBarLinks()

# Page title and welcome message
st.title('Co-op Advisor Home Page')
st.write(f"Welcome, {st.session_state.get('first_name', 'Advisor')}!")

st.write('')
st.write('### What would you like to do today?')

# Create top row of metric cards
col1, col2, col3, col4 = st.columns([1, 1, 1, 1])

with col1:
    if st.button("🔔 NOTIFICATION\n Unread Notifications", key="notification_btn"):
        st.switch_page("pages/11_Notification.py")

with col2:
    if st.button("📝 FORMS\n Student Forms Update", key="forms_btn"):
        st.switch_page("pages/12_Form.py")

with col3:
    if st.button("🏠 HOUSING\n Students Waiting", key="housing_btn"):
        st.switch_page("pages/13_Housing.py")

with col4:
    if st.button("➕ CREATE NEW\nCase", key="create_btn"):
        # Assuming you'll create this page later
        st.switch_page("pages/14_Create_Case.py")

# Add this near the top after imports
import requests

# Add this debug section
st.write("### API Debug Info")
try:
    st.write("Checking API status...")
    
    # Test root endpoint
    root_url = 'http://api:4000/'
    st.write(f"\nTrying root URL: {root_url}")
    response = requests.get(root_url)
    st.write(f"Root Status Code: {response.status_code}")
    st.write(f"Root Response: {response.text}")
    
    # Test debug/routes endpoint
    routes_url = 'http://api:4000/debug/routes'
    st.write(f"\nTrying routes URL: {routes_url}")
    response = requests.get(routes_url)
    st.write(f"Routes Status Code: {response.status_code}")
    st.write(f"Available Routes: {response.text}")
    
    # Original API test code...
    st.write("\nTesting student endpoints...")
    api_urls = [
        'http://api:4000/api/students',
        'http://api:4000/students',
        'http://web-api:4000/api/students',
        'http://web-api:4000/students'
    ]
    
    for url in api_urls:
        st.write(f"\nTrying URL: {url}")
        try:
            response = requests.get(url)
            st.write(f"Status Code: {response.status_code}")
            st.write(f"Response Headers: {dict(response.headers)}")
            st.write(f"Response: {response.text[:200]}")
            if response.status_code == 200:
                break
        except requests.exceptions.ConnectionError:
            st.write(f"Connection failed for {url}")
            continue

except Exception as e:
    st.error(f"Other Error: {str(e)}")

# Update the API URL to use the new blueprint route
api_url = 'http://api:4000/api/students'

# Update the load_student_data function
@st.cache_data
def load_student_data():
    try:
        response = requests.get(api_url)
        if response.status_code == 200:
            return pd.DataFrame(response.json())
        else:
            st.error(f"Failed to fetch student data. Status: {response.status_code}")
            st.error(f"Error message: {response.text}")
            return pd.DataFrame()
    except Exception as e:
        st.error(f"Error fetching data: {str(e)}")
        return pd.DataFrame()

# Load student data
df = load_student_data()

# Display the student list
st.subheader(f"Student List ({len(df)})")

# Display the DataFrame with Streamlit's built-in table display
st.dataframe(
    df,
    use_container_width=True,
    column_config={
        "student_id": "Student ID",
        "student_name": "Name",
        "co_op_location": "Co-op Location",
        "company_name": "Company",
        "major": "Major"
    }
)

