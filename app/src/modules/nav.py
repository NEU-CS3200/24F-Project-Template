# Idea borrowed from https://github.com/fsmosca/sample-streamlit-authenticator

# This file has function to add certain functionality to the left side bar of the app

import streamlit as st


#### ------------------------ General ------------------------
def HomeNav():
    st.sidebar.page_link("Home.py", label="Home", icon="🏠")


def AboutPageNav():
    st.sidebar.page_link("pages/30_About.py", label="About", icon="🧠")


#### ------------------------ Role of student ------------------------
def StudentHomeNav():
    st.sidebar.page_link(
        "pages/Student_Home.py", label="Student Home", icon="👤"
    )

#### ------------------------ Role of Recruiter ------------------------
def RecruiterHomeNav():
    st.sidebar.page_link(
        "pages/Recruiter_Home.py", label="Recruiter Home", icon="👤"
    )

#### ------------------------ Role of Advisor ------------------------
def AdvisorHomeNav():
    st.sidebar.page_link(
        "pages/Advisor_Home.py", label="Advisor Home", icon="👤"
    )

#### ------------------------ Role of Admin ------------------------
def AdminHomeNav():
    st.sidebar.page_link(
        "pages/Admin_Home.py", label="Admin Home", icon="👤"
    )

# --------------------------------Links Function -----------------------------------------------
def SideBarLinks():
    """
    This function handles adding links to the sidebar of the app based upon the logged-in user's role, which was put in the streamlit session_state object when logging in.
    """

    # add a logo to the sidebar always
    st.sidebar.image("assets/logo.png", width=150)

    # If there is no logged in user, redirect to the Home (Landing) page
    if "authenticated" not in st.session_state:
        st.session_state.authenticated = False
        st.switch_page("Home.py")

    if not st.session_state["authenticated"]:
        HomeNav()

    # Show the other page navigators depending on the users' role.
    if st.session_state["authenticated"]:

        if st.session_state["role"] == "student":
            StudentHomeNav()

        if st.session_state["role"] == "recruiter":
            RecruiterHomeNav()

        # If the user is an advisor, give them access to the advisor pages
        if st.session_state["role"] == "advisor":
            AdvisorHomeNav()

        # If the user is an advisor, give them access to the advisor pages
        if st.session_state["role"] == "admin":
            AdminHomeNav()

    # Always show the About page at the bottom of the list of links
    AboutPageNav()

    if st.session_state["authenticated"]:
        # Always show a logout button if there is a logged in user
        if st.sidebar.button("Logout"):
            del st.session_state["role"]
            del st.session_state["authenticated"]
            st.switch_page("Home.py")
