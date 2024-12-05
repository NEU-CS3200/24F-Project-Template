import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests
import pandas as pd

st.set_page_config(layout = 'wide')

SideBarLinks()

url = "http://api:4000/t/tickets" 

st.title("Ticket Management System")

### DISPLAYING TICKET DATA IN DF
try:
    response = requests.get(url)
    if response.status_code == 200:
        tickets_data = response.json()
        df = pd.DataFrame(tickets_data, columns=[
            "TicketID", "IssueType", 
            "Status", "Priority", "ReceivedDate", 
            "ResolvedDate"
        ])
        with st.expander("Ticket Data"):
            st.dataframe(df)
    else:
        st.error(f"Error: {response.status_code} - {response.reason}")
except Exception as e:
    st.error(f"An error occurred: {str(e)}")

#### CREATING NEW TICKET
st.title("Create a New Ticket")
issue = st.text_input("Issue Type", placeholder="Describe the activity")
priority = st.selectbox("Priority", ["High", "Medium", "Low"])  
status = st.selectbox("Status", ['Open', 'Completed', 'Pending', 'Cancelled'])
received = st.date_input("Date Created")
resolved = st.date_input("Date Resolved (optional)")

if st.button("Submit Ticket"):
    # Prepare data payload for the API request
    payload = {
        "IssueType": issue,
        "Status": status,
        "Priority": priority,
        "ReceivedDate": received.isoformat(),  # Format the date as string
        "ResolvedDate": resolved.isoformat() if resolved else None,  # Format if provided, else None
    }

    # Sending POST request to Flask backend
    response = requests.post(url, json=payload)

    if response.status_code == 200:
        st.success("Ticket successfully created!")
    else:
        st.error(f"Failed to create ticket. Error: {response.text}")


