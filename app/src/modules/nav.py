# Idea borrowed from https://github.com/fsmosca/sample-streamlit-authenticator

# This file has function to add certain functionality to the left side bar of the app

import streamlit as st


#### ------------------------ General ------------------------
def HomeNav():
    st.sidebar.page_link("Home.py", label="Home", icon="🏠")


def AboutPageNav():
    st.sidebar.page_link("pages/50_About.py", label="About", icon="🧠")


#### ------------------------ Role of Technical Support Analyst ------------------------
def TechSupportAnalystHomeNav():
    st.sidebar.page_link(
        "pages/00_Tech_Support_Analyst_Home.py", label="Tech Support Analyst Home", icon="👤"
    )


def SystemLogsNav():
    st.sidebar.page_link(
        "pages/01_Run_System_Logs.py", label="System Logs", icon="⚙️"
    )


def TicketOverviewNav():
    st.sidebar.page_link("pages/02_Ticket_Overview.py", label="Ticket Overview", icon="🎫")


def SysHealthDashNav():
    st.sidebar.page_link("pages/04_Access_System_Health_Dashboard.py", label="System Health Dashboard", icon="📊")


## ------------------------ Examples for Role of usaid_worker ------------------------
def ApiTestNav():
    st.sidebar.page_link("pages/12_Form.py", label="Test the API", icon="🛜")


def PredictionNav():
    st.sidebar.page_link(
        "pages/11_Notification.py", label="Regression Prediction", icon="📈"
    )


def ClassificationNav():
    st.sidebar.page_link(
        "pages/13_Housing.py", label="Classification Demo", icon="🌺"
    )


#### ------------------------ Student Housing/Carpool Role ------------------------
def KevinPageNav():
    st.sidebar.page_link("pages/20_Student_Kevin_Home.py", label="Student Home", icon="👤")
    st.sidebar.page_link("pages/21_Advisor_Rec.py", label="Advisor Feedback", icon="🏢")
    st.sidebar.page_link("pages/22_Housing.py", label="Housing Search", icon="🏘️")
    st.sidebar.page_link("pages/23_Carpool.py", label="Carpool Search", icon="🚗")


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

        # Show System Logs, Ticket Overview, and System Health Dashboard if the user is in a technical support analyst role.
        if st.session_state["role"] == "TechnicalSupportAnalyst":
            TechSupportAnalystHomeNav()
            SystemLogsNav()
            TicketOverviewNav()

        # If the user role is usaid worker, show the Api Testing page
        if st.session_state["role"] == "Advisor":
            PredictionNav()
            ApiTestNav()
            ClassificationNav()

        # If the user is a student, give them access to the student pages
        if st.session_state["role"] == "Student":
            KevinPageNav()

    # Always show the About page at the bottom of the list of links
    AboutPageNav()

    if st.session_state["authenticated"]:
        # Always show a logout button if there is a logged in user
        if st.sidebar.button("Logout"):
            del st.session_state["role"]
            del st.session_state["authenticated"]
            st.switch_page("Home.py")
