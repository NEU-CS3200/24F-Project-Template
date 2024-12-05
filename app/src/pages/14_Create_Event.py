import streamlit as st
import requests
from datetime import datetime

# Configure Streamlit page
st.set_page_config(layout='wide')
st.title("Event Management")

# API endpoints
create_url = 'http://api:4000/api/advisor/events'
update_url = 'http://api:4000/api/advisor/events/'
delete_url = 'http://api:4000/api/advisor/events/'

def create_new_event():
    st.subheader("Create New Event")
    
    # Event form
    with st.form("event_form"):
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
                        'name': name,
                        'description': description,
                        'date': date.strftime('%Y-%m-%d'),
                        'community_id': community_id
                    }
                )
                
                if response.status_code == 201:
                    # Success message and toast notification
                    st.success("Event created successfully!")
                    st.toast("New event created: " + name, icon="✅")
                    # Wait a moment to show the notification
                    st.balloons()
                    # Redirect after a brief pause
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
        
        # Event update form
        with st.form("update_event_form"):
            name = st.text_input("Event Name", value=event_data['Name'])
            description = st.text_area("Description", value=event_data['Description'])
            date = st.date_input("Date", value=datetime.strptime(event_data['Date'], '%Y-%m-%d'))
            community_id = st.number_input("Community ID", 
                                         value=event_data['CommunityID'],
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
event_id = st.query_params.get("event_id")

if event_id:
    # Show update/delete interface
    col1, col2 = st.columns(2)
    with col1:
        update_event(event_id)
    with col2:
        delete_event(event_id)
else:
    # Show create interface
    create_new_event() 