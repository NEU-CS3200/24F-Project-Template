import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests
import pandas as pd

st.set_page_config(layout = 'wide')

SideBarLinks()

def get_profile(name):
    url = f'http://api:4000/s/student/{name}'
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

def del_feedback(feedback_id, student_id):
    url = f'http://api:4000/s/students/{student_id}/feedback/{feedback_id}'
    try:
        response = requests.delete(url)
        
        if response.status_code == 200:
            st.success("Feedback deleted successfully!")
        else:
            st.error(f"Feedback entry does not exist: {response.json().get('message')}")
    
    except Exception as e:
        st.error(f"An error occurred: {str(e)}")

name = st.session_state['first_name']
student = get_profile(name)

if student and isinstance(student, list):
    record = student[0]
    reminders = record.get('Reminder')
    s_id = record.get('StudentID')

    feedback = get_feedback(s_id)
    df = pd.DataFrame(feedback)

    with st.expander('Past Reports'):
        if df.empty:
            st.write("No forms found.")
        else:
            st.write(df[['FeedbackID', 'Date', 'Description', 'ProgressRating']])
            


    