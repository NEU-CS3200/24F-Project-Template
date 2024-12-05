import logging
import streamlit as st
import requests

# Configure logger
logger = logging.getLogger(__name__)

# Set the layout for the Streamlit app
st.set_page_config(layout='wide')

# Title and subtitle
st.title('Edit Profile')
st.subheader('Update Your Profile')

# Form layout for updating profile
student_id = st.text_input("Student ID", placeholder="Enter your Student ID")
name = st.text_input("Name", placeholder="Enter your full name")
major = st.text_input("Major", placeholder="Enter your major")
company = st.text_input("Company", placeholder="Enter your company")
location = st.text_input("Location", placeholder="Enter your location")
bio = st.text_area("Biography", placeholder="Write a short biography")
budget = st.number_input("Budget ($)", value=0.0, min_value=0.0, step=100.0, help="Monthly budget")
lease_duration = st.text_input("Lease Duration", placeholder="Enter lease duration")
cleanliness = st.slider("Cleanliness (1-10)", min_value=1, max_value=10, step=1, help="Rate cleanliness preference")
lifestyle = st.text_input("Lifestyle", placeholder="Describe your lifestyle")
commute_time = st.number_input("Commute Time (minutes)", value=0, min_value=0, step=5)
commute_days = st.number_input("Commute Days (per week)", value=0, min_value=0, step=1)

# Submit button to update profile
if st.button("Update Profile"):
    if student_id.strip() == "":
        st.error("Student ID is required to update the profile.")
    else:
        # Construct JSON payload for the PUT request
        profile_data = {
            "StudentID": student_id,
            "Name": name,
            "Major": major,
            "Company": company,
            "Location": location,
            "Bio": bio,
            "Budget": budget,
            "LeaseDuration": lease_duration,
            "Cleanliness": cleanliness,
            "Lifestyle": lifestyle,
            "CommuteTime": commute_time,
            "CommuteDays": commute_days
        }

        try:
            # Make a PUT request to the backend API
            response = requests.put("http://api:4000/s/update_student_profile", json=profile_data)
            if response.status_code == 200:
                st.success("Profile updated successfully!")
            else:
                st.error(f"Failed to update profile: {response.status_code} - {response.text}")
        except requests.exceptions.RequestException as e:
            logger.error(f"Error updating profile: {e}")
            st.error("An error occurred while updating the profile. Please try again later.")