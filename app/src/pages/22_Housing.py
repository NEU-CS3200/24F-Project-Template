import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests
import pandas as pd

st.set_page_config(layout = 'wide')

SideBarLinks()

def fetch_student_profiles(communityid, cleanliness_filter=None, lease_duration_filter=None, budget_filter=None):
    url = f'http://api:4000/c/community/{communityid}/housing' 
    
    # apend filters
    if cleanliness_filter:
        url += f"?cleanliness={cleanliness_filter}"
    if lease_duration_filter:
        if "?" in url:
            url += f"&lease_duration={lease_duration_filter}"
        else:
            url += f"?lease_duration={lease_duration_filter}"
    if budget_filter:
        if "?" in url:
            url += f"&budget={budget_filter}"
        else:
            url += f"?budget={budget_filter}"

    response = requests.get(url)
    if response.status_code == 200:
        return response.json()
    else:
        st.error(f"Error fetching data: {response.status_code}")
        return []

# Streamlit app UI
st.title("Community Housing Profiles")

# textf field for coop location
communityid = st.text_input("Enter Co-op Location:", placeholder="e.g., San Francisco")

## sidebar filters
st.sidebar.header('Preference Filters')
cleanliness_filter = st.sidebar.slider("Filter by Cleanliness", min_value=1, max_value=5, step=1, value=1)
budget_filter = st.sidebar.slider("Filter by Budget", min_value=1000, max_value=3000, step=100)
lease_duration_filter = st.sidebar.selectbox(
    "Filter by Lease Duration", 
    ["Any", "1 Year", "6 Months", "4 Months"], 
    index=0)

if communityid:
    # Fetch data for the community, passing cleanliness filter
    student_profiles = fetch_student_profiles(communityid, cleanliness_filter, lease_duration_filter, budget_filter)

    # Display student profiles
    if student_profiles:
        for student in student_profiles:
            with st.expander(f"{student['Name']}"):
                st.markdown(f"### {student['Name']}")
                st.write(f"**Major:** {student['Major']}")
                st.write(f"**Company:** {student['Company']}")
                st.write(f"**Location:** {student['Location']}")
                st.write(f"**Housing Status:** {student['HousingStatus']}")
                st.write(f"**Budget:** {student['Budget']}")
                st.write(f"**Lease Duration:** {student['LeaseDuration']}")
                st.write(f"**Cleanliness:** {student['Cleanliness']}")
                st.write(f"**Lifestyle:** {student['Lifestyle']}")
                st.write(f"**Bio:** {student['Bio']}")
    else:
        st.write("No profiles found.")