import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title('My Profile')

name=st.text_input('Name')
major=st.text_input('Major')
company=st.text_input('Company')
location=st.text_input('Location')
housing_status=st.text_input('Housing Status')
carpool_status=st.text_input('Carpool Status')
#budget= st.text_input('Budget')
lease_duration=st.text_input('Lease Duration')
#cleanliness = st.text_input('Cleanliness')
#lifestyle = st.text_input('Lifestyle')
#commute_time = st.text_input('Commute Time')
#commute_days = st.text_input('Commute Days')
bio = st.text_input('Biography')

url = 'http://api:4000/c/profile'

if st.button('Create Profile'):
    data = {
        "Name": name,
        "Major" : major,
        "Company" : company,
        "Location" : location,
        "HousingStatus" : housing_status,
        "CarpoolStatus" :carpool_status,
        #"Budget" : budget,
        "LeaseDuration" : lease_duration,
        #"Cleanliness" : cleanliness,
        #"Lifestyle" : lifestyle,
        #"CommuteTime": commute_time,
        #"CommuteDays" : commute_days,
        "Bio" : bio
    }
    response = requests.post(url, json=data)

    if response.status_code == 200:
        st.success("Profile created successfully!")
        #st.write(response.json())
        st.switch_page('pages/23_My_Profile.py')
    else:
        st.error(f"Failed to create item: {response.text}")

