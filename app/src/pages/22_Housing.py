import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title('Housing Search')

st.write('\n\n')
st.write('## Model 1 Maintenance')
st.write("Test")

data = {} 
try:
  data = requests.get('http://api:4000/api/community/<community_id>/housing').json()
except:
  st.write("**Important**: Could not connect to sample api, so using dummy data.")
  data = {"a":{"b": "123", "c": "hello"}, "z": {"b": "456", "c": "goodbye"}}

st.dataframe(data)

# Set the backend API URL
API_URL = "http://<your_backend_url>/community/{community_id}/housing"

# Streamlit App Layout
st.title("Community Housing Details")

# User Input: Community ID
community_id = st.text_input("Enter Community ID:", placeholder="e.g., 123")

# Fetch Data on Button Click
if st.button("Get Housing Details"):
    if not community_id:
        st.warning("Please enter a valid Community ID.")
    else:
        try:
            # Make GET request to the backend
            response = requests.get(API_URL.format(community_id=community_id))

            # Check for successful response
            if response.status_code == 200:
                data = response.json()

                # Convert JSON to DataFrame for better display
                df = pd.DataFrame(data, columns=[
                    "Name", "Major", "Company", "Location", "HousingStatus",
                    "Budget", "LeaseDuration", "Cleanliness", "LifeStyle", 
                    "Bio", "CommunityID"
                ])
                # Display the DataFrame in Streamlit
                st.dataframe(df)

            elif response.status_code == 404:
                st.warning("No students found for the given Community ID.")
            else:
                st.error(f"Error: {response.status_code} - {response.text}")

        except requests.exceptions.RequestException as e:
            st.error(f"Failed to connect to the API: {str(e)}")