import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title(f"Welcome Student, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

# Create top row of metric cards
col1, col2, col3, col4 = st.columns([1, 1, 1, 1])

with col1:
    if st.button("🔔 NOTIFICATION\n Unread Notifications", key="notification_btn"):
        st.switch_page("pages/11_Notification.py")

with col2:
    if st.button("📝 FORMS\n Student Forms Update", key="forms_btn"):
        st.switch_page("pages/12_Form.py")

with col3:
    if st.button("🏠 HOUSING\n Students Waiting", key="housing_btn"):
        st.switch_page("pages/13_Housing.py")

with col4:
    if st.button("➕ CREATE NEW\nCase", key="create_btn"):
        st.switch_page("pages/14_Create_Case.py")

# Load and display student data
try:
    response = requests.get('http://web-api:4000/api/students')
    if response.status_code == 200:
        data = response.json()
        if data:
            df = pd.DataFrame(data)
            st.subheader(f"Student List ({len(df)})")
            st.dataframe(
                df,
                use_container_width=True,
                column_config={
                    "student_id": "Student ID",
                    "student_name": "Name",
                    "co_op_location": "Co-op Location",
                    "company_name": "Company",
                    "major": "Major"
                }
            )
        else:
            st.warning("No student data available")
    else:
        st.error(f"Failed to fetch student data")
except Exception as e:
    st.error(f"Error loading student data")

