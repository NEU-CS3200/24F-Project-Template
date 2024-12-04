import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title('My Profile')

company=st.text_input('Company')
location=st.text_input('Location')
housing_status=st.text_input('Housing Status')
carpool_status=st.text_input('Carpool Status')
budget= st.text_input('Budget')
lease_duration=st.text_input('Lease Duration')
cleanliness = st.text_input('Cleanliness')
lifestyle = st.text_input('Lifestyle')
commute_time = st.text_input('Commute Time')
commute_days = st.text_input('Commute Days')
bio = st.text_input('Bio')

url = 'http://api:4000/c/profile'

if st.button('Create Profile'):
    if company and location and housing_status and carpool_status and budget and lease_duration and cleanliness and lifestyle and commute_time and commute_days and bio:
        data = {
            "Company" : company,
            "Location" : location,
            "HousingStatus" : housing_status,
            "CarpoolStatus" :carpool_status,
            "Budget" : budget,
            "LeaseDuration" : lease_duration,
            "Cleanliness" : cleanliness,
            "Lifestyle" : lifestyle,
            "CommuteTime": commute_time,
            "CommuteDays" : commute_days,
            "Bio" : bio
        }
        response = requests.post(url, json=data)

        # Handle response
        if response.status_code == 201:
            st.success("Item created successfully!")
            st.write(response.json())
        else:
            st.error(f"Failed to create item: {response.text}")
    else:
        st.warning("Please fill out all fields.")

