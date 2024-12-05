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
    st.sidebar.page_link("pages/00_Tech_Support_Analyst_Home.py", label="Tech Support Analyst Home", icon="👤")
    st.sidebar.page_link("pages/01_Run_System_Logs.py", label="System Logs", icon="⚙️")
    st.sidebar.page_link("pages/02_Ticket_Overview.py", label="Ticket Overview", icon="🎫")
    st.sidebar.page_link("pages/03_Access_System_Health_Dashboard.py", label="System Health Dashboard", icon="📊")


## ------------------------ Role of Co-op Advisor ------------------------
def JessicaPageNav():
    st.sidebar.page_link("pages/11_Student_Tasks.py", label="Student Tasks", icon="📝")
    st.sidebar.page_link("pages/12_Feedback.py", label="Feedback", icon="🧐")
    st.sidebar.page_link("pages/13_Housing.py", label="Housing", icon="🏘️")

#### ------------------------ Student Housing/Carpool Role ------------------------
def KevinPageNav():
    st.sidebar.page_link("pages/20_Student_Kevin_Home.py", label="Student Home", icon="📖")
    st.sidebar.page_link("pages/23_My_Profile.py", label="My Profile", icon="👤")
    st.sidebar.page_link("pages/22_Housing_Carpool.py", label="Housing & Transit", icon="🔍")
    st.sidebar.page_link("pages/21_Advisor_Rec.py", label="Advisor Communications", icon="🏫")
    
def SarahPageNav():
    st.sidebar.page_link("pages/30_Student_Sarah_Home.py", label="Student Home", icon="📖")
    st.sidebar.page_link("pages/31_Professional_Events.py", label="Events", icon="👤")
    st.sidebar.page_link("pages/32_Browse_Profiles.py", label="Browse Profiles", icon="🔍")
    st.sidebar.page_link("pages/33_Advisor_Feedback.py", label="Advisor Feedback", icon="🏫")

# --------------------------------Links Function -----------------------------------------------
def SideBarLinks(show_home=False):
    """
    This function handles adding links to the sidebar of the app based upon the logged-in user's role, which was put in the streamlit session_state object when logging in.
    """

    # add a logo to the sidebar always
    st.sidebar.image("assets/image.png", width=150)
    st.sidebar.title("SyncSpace")

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
            #SystemLogsNav()
            #TicketOverviewNav()

        # If the user role is usaid worker, show the Api Testing page
        if st.session_state["role"] == "Advisor":
            JessicaPageNav()

        # If the user is a student, give them access to the student pages
        if st.session_state["role"] == "Student1":
            KevinPageNav()

        if st.session_state["role"] == "Student2":
            SarahPageNav()

    # Always show the About page at the bottom of the list of links
    AboutPageNav()

    if st.session_state["authenticated"]:
        # Always show a logout button if there is a logged in user
        if st.sidebar.button("Logout"):
            del st.session_state["role"]
            del st.session_state["authenticated"]
            st.switch_page("Home.py")
