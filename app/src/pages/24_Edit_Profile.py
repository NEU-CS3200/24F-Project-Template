import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title('Edit My Profile')

housing_status = st.selectbox("Housing Status", ["Searching for Housing", "Searching for Roommates", "Complete"])
carpool_status = st.selectbox("Carpool Status", ["Searching for Carpool", "Has Car", "Complete"])
budget= st.number_input('Budget', min_value=1000, max_value=3000, step=50)
#lease_duration=st.text_input('Lease Duration', placeholder='e.g. 1 year, 6 months')
cleanliness = st.number_input('Cleanliness', min_value=1, max_value=5, step=1)
lifestyle = st.text_input('Lifestyle', placeholder='e.g. Active, Quiet')
commute_time = st.number_input('Commute Time (minutes)', min_value=10, max_value=70, step=5)
commute_days = st.number_input('Number of Commute Days', min_value=1, max_value=5, step=1)
#bio = st.text_input('Biography')
name = st.session_state['first_name']

url = 'http://api:4000/c/profile'

if st.button('Update Profile'):
    data = {
        "HousingStatus" : housing_status,
        "CarpoolStatus" :carpool_status,
        "Budget" : budget,
        "Cleanliness" : cleanliness,
        "Lifestyle" : lifestyle,
        "CommuteTime": commute_time,
        "CommuteDays" : commute_days,
        "Name": name
    }
    response = requests.put(url, json=data)

    if response.status_code == 200:
        st.success("Profile created successfully!")
        st.switch_page('pages/23_My_Profile.py')
    else:
        st.error(f"Failed to create item: {response.text}")

