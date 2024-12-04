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

def get_feedback(student_id):
    url = f'http://api:4000/api/students/{student_id}/feedback'
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()
    else:
        st.error(f"Error fetching data: {response.status_code}")
        return []

name = st.session_state['first_name']
student = get_profile(name)


if student and isinstance(student, list):
    record = student[0]
    reminders = record.get('Reminder')
    st.write(f'🔔 You have {reminders} reminders from your advisor')
    st.write('')
    s_id = record.get('StudentID')
    feedback = get_feedback(s_id)
    df = pd.DataFrame(feedback)
    st.write('Past Reports')
    st.write(df[['Date', 'Description', 'ProgressRating']])

    
st.write('')
st.write('')
    
if st.button('View Housing Recommendations', use_container_width=True):
    st.switch_page('pages/26_Advisor_Housing.py')
if st.button('Feedback Form', use_container_width=True):
    st.switch_page('pages/25_Advisor_Feedback.py')

