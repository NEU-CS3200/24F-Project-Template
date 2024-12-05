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

def del_feedback(feedback_id, student_id):
    url = f'http://api:4000/c/students/{student_id}/feedback/{feedback_id}'
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
record = student[0]
reminders = record.get('Reminder')
s_id = record.get('StudentID')
feedback = get_feedback(s_id)
df = pd.DataFrame(feedback)


st.write(f'🔔 You have {reminders} reminders from your advisor')
st.write('')

with st.expander('Past Reports'):
    if df.empty:
        st.write("No forms found.")
    else:
        st.write(df[['FeedbackID', 'Date', 'Description', 'ProgressRating']])
    feedback_id = st.number_input("Enter Feedback ID", min_value=1, step=1)
    if st.button("Delete Feedback"):
        del_feedback(feedback_id, s_id)

st.write('')
    
if st.button('View Housing Recommendations', use_container_width=True, type='primary'):
    st.switch_page('pages/26_Advisor_Housing.py')
if st.button('Feedback Form', use_container_width=True, type='primary'):
    st.switch_page('pages/25_Advisor_Feedback.py')


