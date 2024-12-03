import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()

def fetch_student_profiles(communityid):
    url = f'http://api:4000/c/community/{communityid}/carpool'  # Replace with your actual URL
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()
    else:
        st.error(f"Error fetching data: {response.status_code}")
        return []

# Streamlit app UI
st.title("Carpool Profiles")

# Input field for community ID
communityid = st.text_input("Enter Co-op Location:", placeholder="e.g., San Francisco")

if communityid:
    # Fetch data for the community
    student_profiles = fetch_student_profiles(communityid)
    
    # Display student profiles
    if student_profiles:
        for student in student_profiles:
            st.subheader(student['Name'])
            st.write(f"**Major:** {student['Major']}")
            st.write(f"**Company:** {student['Company']}")
            st.write(f"**Location:** {student['Location']}")
            st.write(f"**Carpool Status:** {student['CarpoolStatus']}")
            st.write(f"**Travel time:** {student['CommuteTime']}")
            st.write(f"**Number of Days Commuting:** {student['CommuteDays']}")
            st.write(f"**Bio:** {student['Bio']}")
            st.write("---")
    else:
        st.write("No profiles found.")