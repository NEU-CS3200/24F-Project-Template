import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests
import pandas as pd

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title('Housing in Your Location')

def get_profile(name):
    url = f'http://api:4000/c/profile/{name}'
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()
    else:
        st.error(f"Error fetching data: {response.status_code}")
        return []

name = st.session_state['first_name']
student = get_profile(name)

def get_id(communityid):
    url = f"http://api:4000/c/community/{communityid}/housing-resources"
    
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()
    else:
        st.error(f"Error fetching data: {response.status_code}")
        return []


if student and isinstance(student, list):
    record = student[0]
    community_id = record.get('CommunityID')
    location = record.get('Location')
    resources = get_id(community_id)

    if resources:
        st.write(f'Housing Resources in {location}')
        df = pd.DataFrame(resources)
        st.dataframe(df[['Availability', 'Location', 'Style']])
    else:
        st.write('No resources found')

    



