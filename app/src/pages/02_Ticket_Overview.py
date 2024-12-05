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
        st.dataframe(df)
    else:
        st.error(f"Error: {response.status_code} - {response.reason}")
except Exception as e:
    st.error(f"An error occurred: {str(e)}")

#### CREATING NEW TICKET
st.title("Create a New Tickets")
with st.expander('Create Ticket'):
    issue = st.text_input("Issue Type", placeholder="Describe the activity")
    priority = st.selectbox("Priority", ["High", "Medium", "Low"])  
    status = st.selectbox("Status", ['Open', 'Completed', 'Pending', 'Cancelled'])
    received = st.date_input("Date Created")
    resolved = st.date_input("Date Resolved (optional)", value=None)

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

### UPDATING TICKET

st.title("Update Tickets")

with st.expander("Update Ticket"):
    ticket_id= st.text_input("Ticket ID", placeholder="Enter Ticket ID")
    status = st.selectbox("Status", ["open", "pending", "completed", "cancelled"])  
    priority = st.selectbox("Priority", ["Low", "Medium", "High"])
    resolved_date = st.date_input("Resolved Date", value=None)

    if st.button("Update Ticket"):
        # Check if ticket_id is provided
        if ticket_id:
            # Prepare data payload for the API request
            payload = {
                "IssueType": issue,
                "Status": status,
                "Priority": priority,
                "ResolvedDate": resolved_date.isoformat() if resolved_date else None,
                "TicketID" : ticket_id
            }

            # Sending PUT request to Flask backend
            response = requests.put(f"http://api:4000/t/tickets", json=payload)

            if response.status_code == 200:
                st.success("Ticket updated successfully!")
            elif response.status_code == 404:
                st.error("No ticket found with the given Ticket ID.")
            else:
                st.error(f"Failed to update ticket. Error: {response.text}")
        else:
            st.error("Please enter a Ticket ID.")

### DELETING TICKET
st.title("Archive Tickets")

with st.expander('Archive Ticket'):
    ticket_id = st.text_input('Enter Ticket ID to Archive')

    def delete_ticket(ticket_id):
        url = f'http://api:4000/t/tickets/{ticket_id}'  # Replace with your actual backend URL
        response = requests.delete(url)

        if response.status_code == 200:
            st.success("Ticket archived successfully")
        else:
            st.error(response.json().get("error", "An error occurred"))

    # Delete button
    if st.button("Archive Ticket"):
        if ticket_id:
            delete_ticket(ticket_id)
        else:
            st.error("Please enter a valid Ticket ID")


