import logging
import streamlit as st
import requests

# Configure logger
logger = logging.getLogger(__name__)

# Set the layout
st.set_page_config(layout='wide')

# Title of the page
st.title('Manage Student Profile')
st.subheader('Update Your Profile')

# Form layout
name = st.text_input('Name', value='Sarah Lopez', placeholder='Enter your full name')
email = st.text_input('Email', value='sarah.lopez@example.com', placeholder='Enter your email')
professional_interests = st.text_area(
    'Professional Interests', 
    placeholder='E.g., Data Science, AI, etc.'
)
housing_preferences = st.text_area(
    'Housing Preferences', 
    placeholder='E.g., Close to campus, shared apartment, etc.'
)

# Submit button
if st.button('Save Changes'):
    # Mocked API request for demonstration
    profile_data = {
        "name": name,
        "email": email,
        "professional_interests": professional_interests,
        "housing_preferences": housing_preferences,
    }
    try:
        response = requests.put(
            'http://api.example.com/community/{community_id}',
            json=profile_data
        )
        if response.status_code == 200:
            st.success('Profile updated successfully!')
        else:
            st.error(f'Failed to update profile. Server responded with: {response.text}')
    except Exception as e:
        st.error(f'An error occurred: {str(e)}')


'''
import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title('Manage Student Profile')
st.write('\n\n')

# Add a text input field
first_name = st.text_input("First Name:", value="")
last_name = st.text_input("Last Name:", value="")

if user_input:
    st.write(f"Hello, {user_input}!")


if st.button('Create Student', 
             type = 'primary',
             use_container_width=True):
  results = requests.get('http://api:4000/c/prediction/10/25').json()
  st.dataframe(results)
'''