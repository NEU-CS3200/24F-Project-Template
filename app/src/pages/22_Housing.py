import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests
import pandas as pd

st.set_page_config(layout = 'wide')

SideBarLinks()

# Define the API URL
API_URL = "http://api:4000/c/community"

# Fetch data from the API
response = requests.get(API_URL)

# Check if the response is successful
if response.status_code == 200:
    data = response.json()  # Assuming the API returns JSON data
    df = pd.DataFrame(data)  # Convert the JSON data to a DataFrame

    # Display the DataFrame in Streamlit
    st.write("Playlist Data", df)
else:
    st.error(f"Failed to fetch data. Status code: {response.status_code}")

'''
# Set the backend API URL


# Streamlit App Layout
st.title("Community Housing Details")

# User Input: Community ID
communityid = st.text_input("Enter Community ID:", placeholder="e.g., 123")

# Fetch Data on Button Click
if st.button("Get Housing Details"):
    if not communityid:
        st.warning("Please enter a valid Community ID.")
    else:
        try:
            # Make GET request to the backend
            response = requests.get(API_URL.format(communityid=communityid))

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
'''