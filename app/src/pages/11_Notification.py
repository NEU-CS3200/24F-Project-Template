import streamlit as st
import pandas as pd
import requests

st.set_page_config(page_title="Unread Notifications", layout="wide")

# Add sidebar navigation
from modules.nav import SideBarLinks
SideBarLinks()

# Page Title
st.title("🔔 Unread Notifications")
st.write("Below is a list of notifications regarding your students.")

# Fetch notifications from the API
try:
    response = requests.get('http://web-api:4000/api/notifications')  # Replace with your actual API endpoint
    if response.status_code == 200:
        notifications = response.json()

        if notifications:
            # Convert notifications to DataFrame
            df_notifications = pd.DataFrame(notifications)
            
            # Display unread notifications
            st.subheader(f"Unread Notifications ({len(df_notifications)})")
            st.dataframe(
                df_notifications,
                use_container_width=True,
                column_config={
                    "student_name": "Student Name",
                    "notification_type": "Notification Type",
                    "date": "Date",
                    "message": "Message"
                }
            )
            
            # Mark notifications as read button
            if st.button("Mark All as Read"):
                try:
                    mark_as_read_response = requests.post(
                        'http://web-api:4000/api/notifications/mark-as-read'
                    )  # Replace with your actual endpoint
                    if mark_as_read_response.status_code == 200:
                        st.success("All notifications have been marked as read.")
                        st.experimental_rerun()  # Refresh the page
                    else:
                        st.error("Failed to mark notifications as read.")
                except Exception as e:
                    st.error(f"Error while marking notifications as read: {e}")
        else:
            st.info("You have no unread notifications.")
    else:
        st.error(f"Failed to fetch notifications (Status code: {response.status_code})")
except Exception as e:
    st.error(f"Error loading notifications: {e}")

# Notification Management Section
st.write("---")
st.subheader("Manage Notifications")
st.write("You can search and filter through your notifications below.")

# Advanced filtering/search options
filter_col1, filter_col2 = st.columns([1, 1])

with filter_col1:
    search_term = st.text_input("Search by Student Name or Message")

with filter_col2:
    notification_type_filter = st.selectbox(
        "Filter by Notification Type",
        options=["All", "Form Update", "Housing Request", "Case Update", "Other"]
    )

# Apply filters
if notifications:
    filtered_notifications = df_notifications.copy()

    # Apply search term filter
    if search_term:
        filtered_notifications = filtered_notifications[
            filtered_notifications.apply(lambda row: search_term.lower() in str(row).lower(), axis=1)
        ]

    # Apply notification type filter
    if notification_type_filter != "All":
        filtered_notifications = filtered_notifications[
            filtered_notifications["notification_type"] == notification_type_filter
        ]

    st.write(f"Filtered Notifications ({len(filtered_notifications)})")
    st.dataframe(filtered_notifications, use_container_width=True)
else:
    st.info("No notifications to filter.")


    
