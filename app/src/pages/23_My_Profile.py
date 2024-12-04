import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests
import pandas as pd

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title('My Profile')

def get_profile(name):
    url = f'http://api:4000/c/profile/{name}'
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()
    else:
        st.error(f"Error fetching data: {response.status_code}")
        return []

name = 'Kevin Chen'
student = get_profile(name)
df = pd.DataFrame([student])

if student and isinstance(student, list):
    # Access the first record in the list
    record = student[0]
    name = record.get("Name", "Not available")
    major = record.get("Major", "Not available")
    location = record.get("Location", "Not available")
    company = record.get("Company", 'Not available')
    housing = record.get("HousingStatus", "Not available")
    carpool = record.get("CarpoolStatus", "Not available")
    budget= record.get("Budget", "Not available") 
    lease_duration = record.get("LeaseDuration", "Not available")
    cleanliness = record.get("Cleanliness", "Not available")
    lifestyle = record.get("Lifestyle", "Not available")
    time = record.get("CommuteTime", "Not available")
    days = record.get("CommuteDays", "Not available")
    bio = record.get("Bio", "Not available")

    container = st.container(border=True)
    container.write(f"### {name}")
    container.write(f"Major: {major}")
    container.write(f'Location: {location}')
    container.write(f'Company: {company}')
    container.write(f"Housing Status: {housing}")
    container.write(f'Carpool Status: {carpool}')
    container.write(f'Budget: {budget}')
    container.write(f"Lease Duration: {lease_duration}")
    container.write(f'Cleanliness: {cleanliness}')
    container.write(f'Lifestyle: {lifestyle}')
    container.write(f"Number of Commute Days: {days}")
    container.write(f'Travel Time: {time}')
    container.write(f'Biography: {bio}')


else:
    st.info("No data available.")


if st.button('Edit My Profile', 
             type='primary'):
    st.switch_page('pages/24_Edit_Profile.py')
            

