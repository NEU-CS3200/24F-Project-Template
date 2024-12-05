import logging
import streamlit as st
import requests
import pandas as pd  # Ensure you have this library if you're using DataFrame

# Configure logger
logger = logging.getLogger(__name__)

# Set the layout
st.set_page_config(layout='wide')

# Title of the page
st.title('Manage Student Profile')
st.subheader('Update Your Profile')

# Form layout
name = st.text_input('Name', value='Sarah Lopez', placeholder='Enter your full name')

# Submit button
if st.button('Search'):
    # Mocked API request for demonstration
    profile_data = {
        "name": name
    }
    try:
        response = requests.get(
            'http://api:4000/s/retrieve_student_info',
            json=profile_data
        )
        if response.status_code == 200:
            student = response.json()
            df = pd.DataFrame([student])
            name = student.get("Name", "")
            major = student.get("Major", "")
            location = student.get("Location", "")
            company = student.get("Company", "")
            housing = student.get("HousingStatus", "")
            carpool = student.get("CarpoolStatus", "")
            bio = student.get("Bio", "")

            # Add a container for displaying profile data
            with st.container():
                st.header("Profile Information")
                
                # Add editable text boxes for some fields
                updated_major = st.text_input("Major", value=major, placeholder="Enter your major")
                updated_location = st.text_input("Location", value=location, placeholder="Enter your location")
                updated_company = st.text_input("Company", value=company, placeholder="Enter your company")
                updated_bio = st.text_area("Biography", value=bio, placeholder="Write a short biography")

                # Display static fields
                st.write(f"Housing Status: {housing}")
                st.write(f"Carpool Status: {carpool}")


                # Add a Save button to save updates
                if st.button("Save Changes"):
                    updated_profile_data = {
                        "name": name,
                        "major": updated_major,
                        "location": updated_location,
                        "company": updated_company,
                        "bio": updated_bio
                    }
                    # Mock save logic or send updated data to the backend
                    st.success("Profile updated successfully!")
                    logger.info(f"Updated profile data: {updated_profile_data}")

        else:
            st.error(f'Failed to retrieve student info: {response.text}')
    except Exception as e:
        st.error(f'An error occurred: {str(e)}')
