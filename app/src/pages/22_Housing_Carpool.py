import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests
import pandas as pd

st.set_page_config(layout = 'wide')

SideBarLinks()

def fetch_housing_profiles(communityid, cleanliness_filter=None, lease_duration_filter=None, budget_filter=None):
    url = f'http://api:4000/c/community/{communityid}/housing'
    
    # Append filters
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

# Function to fetch student profiles for carpool
def fetch_carpool_profiles(communityid, days_filter=None, time_filter=None):
    url = f'http://api:4000/c/community/{communityid}/carpool'
    
    # Append filters
    if days_filter:
        url += f"?commute_days={days_filter}"
    if time_filter:
        if "?" in url:
            url += f"&commute_time={time_filter}"
        else:
            url += f"?commute_time={time_filter}"

    response = requests.get(url)
    if response.status_code == 200:
        return response.json()
    else:
        st.error(f"Error fetching data: {response.status_code}")
        return []

# Streamlit app UI
st.title("Community Profiles")
st.write('Filter based on preferences')
# Text field for co-op location
communityid = st.text_input("Enter Co-op Location:", placeholder="e.g., San Francisco")

# Sidebar for filtering options
st.sidebar.header('Preference Filters')

# Select the type of search (Housing or Carpool)
search_type = st.sidebar.radio("Choose Search Type", ["Housing", "Carpool"])

# Housing filters
if search_type == "Housing":
    cleanliness_filter = st.sidebar.slider("Filter by Cleanliness", min_value=1, max_value=5, step=1, value=3)
    budget_filter = st.sidebar.slider("Filter by Budget", min_value=1000, max_value=3000, step=100, value=1200)
    lease_duration_filter = st.sidebar.selectbox(
            "Filter by Lease Duration", 
            ["Any", "1 Year", "6 Months", "4 Months"], 
            index=0
    )

# Carpool filters
elif search_type == "Carpool":
    days_filter = st.sidebar.slider("Number of Commute Days", min_value=1, max_value=6, step=1, value=5)
    time_filter = st.sidebar.slider("Travel Time (minutes)", min_value=10, max_value=70, step=5, value=20)

# Fetch data based on the selected search type
if communityid:
    if search_type == "Housing":
        student_profiles = fetch_housing_profiles(communityid, cleanliness_filter, lease_duration_filter, budget_filter)
        if student_profiles:
            col1, col2 = st.columns(2)
            for i, student in enumerate(student_profiles):
                # Alternate between the columns
                if i % 2 == 0:
                    with col1:
                        container=st.container(border=True, height=520)
                        container.markdown(f"### {student['Name']}")
                        container.write(f"**Major:** {student['Major']}")
                        container.write(f"**Company:** {student['Company']}")
                        container.write(f"**Location:** {student['Location']}")
                        container.write(f"**Housing Status:** {student['HousingStatus']}")
                        container.write(f"**Budget:** {student['Budget']}")
                        container.write(f"**Lease Duration:** {student['LeaseDuration']}")
                        container.write(f"**Cleanliness:** {student['Cleanliness']}")
                        container.write(f"**Lifestyle:** {student['Lifestyle']}")
                        container.write(f"**Bio:** {student['Bio']}")
                else:
                    with col2:
                        container=st.container(border=True, height=520)
                        container.markdown(f"### {student['Name']}")
                        container.write(f"**Major:** {student['Major']}")
                        container.write(f"**Company:** {student['Company']}")
                        container.write(f"**Location:** {student['Location']}")
                        container.write(f"**Housing Status:** {student['HousingStatus']}")
                        container.write(f"**Budget:** {student['Budget']}")
                        container.write(f"**Lease Duration:** {student['LeaseDuration']}")
                        container.write(f"**Cleanliness:** {student['Cleanliness']}")
                        container.write(f"**Lifestyle:** {student['Lifestyle']}")
                        container.write(f"**Bio:** {student['Bio']}")
        else:  
            st.write("No profiles found.")

    elif search_type == "Carpool":
        student_profiles = fetch_carpool_profiles(communityid, days_filter, time_filter)
        if student_profiles:
            # Split the profiles into two columns
            col1, col2 = st.columns(2)
            for i, student in enumerate(student_profiles):
                # Alternate between the columns
                if i % 2 == 0:
                    with col1:
                        #with st.expander(f"{student['Name']}"):
                        container = st.container(border=True, height=520)
                        container.markdown(f"### {student['Name']}")
                        container.write(f"**Major:** {student['Major']}")
                        container.write(f"**Company:** {student['Company']}")
                        container.write(f"**Location:** {student['Location']}")
                        container.write(f"**Carpool Status:** {student['CarpoolStatus']}")
                        container.write(f"**Travel time:** {student['CommuteTime']}")
                        container.write(f"**Number of Days Commuting:** {student['CommuteDays']}")
                        container.write(f"**Bio:** {student['Bio']}")
                else:
                    with col2:
                        #with st.expander(f"{student['Name']}"):
                        container = st.container(border=True, height=520)
                        container.markdown(f"### {student['Name']}")
                        container.write(f"**Major:** {student['Major']}")
                        container.write(f"**Company:** {student['Company']}")
                        container.write(f"**Location:** {student['Location']}")
                        container.write(f"**Carpool Status:** {student['CarpoolStatus']}")
                        container.write(f"**Travel time:** {student['CommuteTime']}")
                        container.write(f"**Number of Days Commuting:** {student['CommuteDays']}")
                        container.write(f"**Bio:** {student['Bio']}")
        else:
            st.write("No profiles found.")
