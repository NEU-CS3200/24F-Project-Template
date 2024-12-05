import streamlit as st
import requests
from datetime import datetime
from modules.nav import SideBarLinks

# Configure Streamlit page
st.set_page_config(layout='wide')
st.title("Event Management")
SideBarLinks()


# API endpoints
create_url = 'http://api:4000/api/advisor/events'
update_url = 'http://api:4000/api/advisor/events/'
delete_url = 'http://api:4000/api/advisor/events/'

def create_new_event():
    st.subheader("Create New Event")
    
    # Event form
    with st.form("event_form"):
        event_id = st.number_input("Event ID", min_value=1, step=1)
        name = st.text_input("Event Name")
        description = st.text_area("Description")
        date = st.date_input("Date")
        community_id = st.number_input("Community ID", min_value=1, step=1)
        
        # Submit button
        submitted = st.form_submit_button("Create Event")
        
        if submitted:
            try:
                response = requests.post(
                    create_url,
                    json={
                        'event_id': event_id,
                        'name': name,
                        'description': description,
                        'date': date.strftime('%Y-%m-%d'),
                        'community_id': community_id
                    }
                )
                
                if response.status_code == 201:
                    st.success("Event created successfully!")
                    st.toast("New event created: " + name, icon="✅")
                    st.balloons()
                    st.query_params["page"] = "10_Events"
                    st.rerun()
                else:
                    st.error("Failed to create event")
                    st.toast("Failed to create event", icon="❌")
                    
            except Exception as e:
                st.error(f"Error: {str(e)}")
                st.toast("Error creating event", icon="⚠️")



def update_event(event_id):
    st.subheader("Update Event")
    
    # Fetch current event details
    response = requests.get(f'http://api:4000/api/advisor/events/{event_id}')
    if response.status_code == 200:
        event_data = response.json()
        
        # Display current event details
        st.write("Current Event Details:")
        st.write(f"Name: {event_data.get('Name')}")
        st.write(f"Description: {event_data.get('Description')}")
        st.write(f"Date: {event_data.get('Date')}")
        st.write(f"Community ID: {event_data.get('CommunityID')}")
        
        st.divider()
        st.write("Update Event Details:")
        

        # Event update form
        with st.form("update_event_form"):
            name = st.text_input("Event Name", value=event_data.get('Name', ''))
            description = st.text_area("Description", value=event_data.get('Description', ''))
            try:
                current_date = datetime.strptime(event_data.get('Date'), '%Y-%m-%d')
            except (ValueError, TypeError):
                current_date = datetime.now()
            date = st.date_input("Date", value=current_date)
            community_id = st.number_input("Community ID", 
                                         value=int(event_data.get('CommunityID', 1)),
                                         min_value=1, 
                                         step=1)
            
            # Submit button
            submitted = st.form_submit_button("Update Event")
            
            if submitted:
                try:
                    response = requests.put(
                        update_url + str(event_id),
                        json={
                            'name': name,
                            'description': description,
                            'date': date.strftime('%Y-%m-%d'),
                            'community_id': community_id
                        }
                    )
                    
                    if response.status_code == 200:
                        st.success("Event updated successfully!")
                        st.toast("Event updated: " + name, icon="✅")
                        st.query_params["page"] = "10_Events"
                        st.rerun()
                    else:
                        st.error("Failed to update event")
                        st.toast("Failed to update event", icon="❌")
                        
                except Exception as e:
                    st.error(f"Error: {str(e)}")
                    st.toast("Error updating event", icon="⚠️")
    else:
        st.error(f"Could not find event with ID: {event_id}")

def delete_event(event_id):
    with st.form("delete_event_form"):
        st.write("Are you sure you want to delete this event?")
        submitted = st.form_submit_button("Delete Event")
        
        if submitted:
            try:
                response = requests.delete(delete_url + str(event_id))
                
                if response.status_code == 200:
                    st.success("Event deleted successfully!")
                    st.toast("Event deleted successfully", icon="✅")
                    st.query_params["page"] = "10_Events"
                    st.rerun()
                else:
                    st.error("Failed to delete event")
                    st.toast("Failed to delete event", icon="❌")
                    
            except Exception as e:
                st.error(f"Error: {str(e)}")
                st.toast("Error deleting event", icon="⚠️")

# Main page logic
st.title("Event Management")

# Dropdown for operation selection
operation = st.selectbox(
    "What would you like to do?",
    ["Create New Event", "Edit Event", "Delete Event"]
)

# Display different interfaces based on selection
if operation == "Create New Event":
    create_new_event()
    
    
elif operation == "Edit Event":
    event_id = st.number_input("Enter Event ID to Edit", min_value=1, step=1)
    if event_id:
        update_event(event_id)
        
else:  # Delete Event
    event_id = st.number_input("Enter Event ID to Delete", min_value=1, step=1)
    if event_id:
        delete_event(event_id) 