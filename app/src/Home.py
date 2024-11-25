##################################################
# Enhanced Streamlit Homepage for Coop Compass
##################################################

# Set up basic logging infrastructure
import logging
logging.basicConfig(format='%(filename)s:%(lineno)s:%(levelname)s -- %(message)s', level=logging.INFO)
logger = logging.getLogger(__name__)

# Import Streamlit and the SideBarLinks function
import streamlit as st
from modules.nav import SideBarLinks

# Set Streamlit page configuration for a modern look
st.set_page_config(
    page_title="Coop Compass",
    page_icon="🎓",
    layout="wide"
)

# Initialize session state variables
if 'authenticated' not in st.session_state:
    st.session_state['authenticated'] = False

# Use SideBarLinks to configure the navigation sidebar
SideBarLinks()

# ***************************************************
#    The Major Content of the Page
# ***************************************************

# Add a hero section for the homepage
st.markdown(
    """
    <style>
        .hero {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px 20px;
            background-color: #f8f9fa;
            border-radius: 15px;
            box-shadow: 0px 4px 6px rgba(0,0,0,0.1);
        }
        .hero h1 {
            color: #2c3e50;
            font-size: 3rem;
            margin-bottom: 20px;
        }
        .hero p {
            color: #34495e;
            font-size: 1.2rem;
        }
    </style>
    <div class="hero">
        <h1>Welcome to Coop Compass 🎓</h1>
        <p>Your one-stop platform for navigating co-op opportunities!</p>
    </div>
    """,
    unsafe_allow_html=True
)

# Add user persona cards for a better visual layout
st.write('\n\n')
st.markdown("### 👤 Select a User Persona:")
cols = st.columns(2, gap="large")

with cols[0]:
    st.markdown(
        """
        <div style="text-align:center;">
            <h3>Aaryan</h3>
            <p>Student on a co-op search with one previous co-op</p>
        </div>
        """,
        unsafe_allow_html=True
    )
    if st.button("Login as Aaryan", type='primary', use_container_width=True):
        st.session_state['authenticated'] = True
        st.session_state['role'] = 'student'
        st.session_state['first_name'] = 'Aaryan'
        st.experimental_rerun()

with cols[1]:
    st.markdown(
        """
        <div style="text-align:center;">
            <h3>Quandale</h3>
            <p>Recruiter at a company</p>
        </div>
        """,
        unsafe_allow_html=True
    )
    if st.button("Login as Quandale", type='primary', use_container_width=True):
        st.session_state['authenticated'] = True
        st.session_state['role'] = 'recruiter'
        st.session_state['first_name'] = 'Quandale'
        st.experimental_rerun()

cols = st.columns(2, gap="large")

with cols[0]:
    st.markdown(
        """
        <div style="text-align:center;">
            <h3>Rachel</h3>
            <p>Co-op Advisor</p>
        </div>
        """,
        unsafe_allow_html=True
    )
    if st.button("Login as Rachel", type='primary', use_container_width=True):
        st.session_state['authenticated'] = True
        st.session_state['role'] = 'advisor'
        st.session_state['first_name'] = 'Rachel'
        st.experimental_rerun()

with cols[1]:
    st.markdown(
        """
        <div style="text-align:center;">
            <h3>Sam</h3>
            <p>Admin of the app</p>
        </div>
        """,
        unsafe_allow_html=True
    )
    if st.button("Login as Sam", type='primary', use_container_width=True):
        st.session_state['authenticated'] = True
        st.session_state['role'] = 'admin'
        st.session_state['first_name'] = 'Sam'
        st.experimental_rerun()

# Add a footer
st.markdown(
    """
    <style>
        .footer {
            text-align: center;
            font-size: 0.9rem;
            color: #7f8c8d;
            margin-top: 50px;
        }
    </style>
    <div class="footer">
        © 2024 Coop Compass
    </div>
    """,
    unsafe_allow_html=True
)
