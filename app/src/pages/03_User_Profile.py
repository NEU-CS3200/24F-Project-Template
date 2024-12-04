import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

try:
    response1 = requests.get(
        f"http://api:4000/stu/simple_routes/users/{st.session_state['profile_id']}"
    )
    if response.status_code == 200:
        if len(response.json()) != 0:
            df = pd.json_normalize(response.json())
            st.write(df)
except requests.exceptions.RequestException as e:
    st.error(f"Error connecting to server: {str(e)}")


st.title(" Full Name's Profile")
st.image("assets/profile_pic.png", width=150)
st.write("Pronouns: ")
st.write("Preferred Name: ")
st.write("Age:",)
st.write("Email:",)
st.write("Phone Number:",)
st.wrire("Last Active: ")
st.write("Bio:",)

if st.session_state["user_id"] == st.session_state["profile_id"]:
    if st.button('Edit Profile', 
             type='primary',
             use_container_width=True):
      st.switch_page('pages/04_User_Profile_Editor.py')