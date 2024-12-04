import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests
import pandas as pd

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title('Advisor Communications')

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
    record = student[0]
    name = record.get("c.Location", "Not available")



url = "http://api:4000/c//community/{SanJose}/housing-resources"

data = {} 
try:
  data = requests.get(url).json()
except:
  st.write("**Important**: Could not connect to sample api, so using dummy data.")
  data = {"a":{"b": "123", "c": "hello"}, "z": {"b": "456", "c": "goodbye"}}

st.dataframe(data)




