# Idea borrowed from https://github.com/fsmosca/sample-streamlit-authenticator

# This file has function to add certain functionality to the left side bar of the app

import streamlit as st


#### ------------------------ General ------------------------
def HomeNav():
    st.sidebar.page_link("Home.py", label="Home", icon="🏠")


def AboutPageNav():
    st.sidebar.page_link("pages/40_About.py", label="About", icon="🧠")


#### ------------------------ Co-op Advisor Role ------------------------
def CoopAdvisorAdvHomeNav():
    st.sidebar.page_link(
        "pages/00_Coop_Advisor_Home.py", label="Co-op Advisor Home", icon="👤"
    )


def StudentSearchNav():
    st.sidebar.page_link(
        "pages/01_Student_Search.py", label="Student Search", icon="🧑‍🎓"
    )


def MapDemoNav():
    st.sidebar.page_link("pages/02_Map_Demo.py", label="Map Demonstration", icon="🗺️")


#### ------------------------ Emplyer Role ------------------------
def ApiTestNav():
    st.sidebar.page_link("pages/12_API_Test.py", label="Test the API", icon="🛜")


def PredictionNav():
    st.sidebar.page_link(
        "pages/11_Prediction.py", label="Regression Prediction", icon="📈"
    )


def ClassificationNav():
    st.sidebar.page_link(
        "pages/13_Classification.py", label="Classification Demo", icon="🌺"
    )

#### ------------------------ Student Role ------------------------
def StudentAdvHomeNav():
    st.sidebar.page_link(
        "pages/30_Student_Home.py", label="Student Home", icon="🧑‍🎓"
    )

def PositionOpeningSearchNav():
    st.sidebar.page_link(
        "pages/31_Position_Opening_Search.py", label="Position Openings", icon="🔎"
    )

def EmployerSearchNav():
    st.sidebar.page_link(
        "pages/32_Employer_Search.py", label="Employers", icon="🕴️"
    )

def ApplicationEditorNav():
    st.sidebar.page_link( 
        "pages/33_Application_Editor.py", label="Applications", icon="📝"
    )

#### ------------------------ System Admin Role ------------------------
def AdminPageNav():
    st.sidebar.page_link("pages/20_Admin_Home.py", label="System Admin", icon="🖥️")
    st.sidebar.page_link(
        "pages/21_ML_Model_Mgmt.py", label="ML Model Management", icon="🏢"
    )


# --------------------------------Links Function -----------------------------------------------
def SideBarLinks(show_home=False):
    """
    This function handles adding links to the sidebar of the app based upon the logged-in user's role, which was put in the streamlit session_state object when logging in.
    """

    # add a logo to the sidebar always
    st.sidebar.image("assets/logo.png", width=150)

    # If there is no logged in user, redirect to the Home (Landing) page
    if "authenticated" not in st.session_state:
        st.session_state.authenticated = False
        st.switch_page("Home.py")

    if show_home:
        # Show the Home page link (the landing page)
        HomeNav()

    # Show the other page navigators depending on the users' role.
    if st.session_state["authenticated"]:

        # Show World Bank Link and Map Demo Link if the user is a political strategy advisor role.
        if st.session_state["role"] == "coop_advisor":
            CoopAdvisorAdvHomeNav()
            WorldBankVizNav()
            MapDemoNav()

        # If the user role is employer, show the Api Testing page
        if st.session_state["role"] == "employer":
            PredictionNav()
            ApiTestNav()
            ClassificationNav()

        # If the user role is student, show student home
        if st.session_state["role"] == "student":
            StudentAdvHomeNav()

        # If the user is an administrator, give them access to the administrator pages
        if st.session_state["role"] == "administrator":
            AdminPageNav()

    # Always show the About page at the bottom of the list of links
    AboutPageNav()

    if st.session_state["authenticated"]:
        # Always show a logout button if there is a logged in user
        if st.sidebar.button("Logout"):
            del st.session_state["role"]
            del st.session_state["authenticated"]
            st.switch_page("Home.py")
