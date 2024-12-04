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
