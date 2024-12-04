import logging
import streamlit as st
import requests
import pandas as pd
from datetime import datetime
from modules.nav import SideBarLinks

# Configure Streamlit page
st.set_page_config(layout='wide')
st.title("All Tasks")
SideBarLinks()

# API endpoint for tasks
api_url = 'http://api:4000/api/advisor/tasks'

# Fetch task data from the API
try:
    response = requests.get(api_url)
    if response.status_code == 200:
        data = response.json()
        
        if data:
            df = pd.DataFrame(data)
            
            # Sidebar Filters
            st.sidebar.header("Filter Tasks")
            student_name_filter = st.sidebar.text_input("Search by Student Name")
            student_id_filter = st.sidebar.text_input("Search by Student ID")

            # Apply filters
            filtered_df = df.copy()
            if student_name_filter:
                filtered_df = filtered_df[filtered_df['student_name'].str.contains(student_name_filter, case=False, na=False)]
            if student_id_filter:
                filtered_df = filtered_df[filtered_df['StudentID'].astype(str).str.contains(student_id_filter, na=False)]

            # Display filtered data
            st.subheader(f"Showing {len(filtered_df)} Tasks")
            st.dataframe(
                filtered_df,
                use_container_width=True,
                hide_index=True
            )

            # Task Editor
            st.subheader("Edit Task")
            col1, col2 = st.columns(2)
            
            with col1:
                task_id = st.selectbox("Select Task ID", options=filtered_df['TaskID'].unique())
                if task_id:
                    task_row = filtered_df[filtered_df['TaskID'] == task_id].iloc[0]
                    st.write(f"Current Status: {task_row['task_status']}")
                    st.write(f"Current Reminder: {task_row['Reminder']}")
                    
                    # Status Update
                    new_status = st.selectbox(
                        "Update Status",
                        options=['Pending', 'In Progress', 'Completed', 'Received'],
                        index=['Pending', 'In Progress', 'Completed', 'Received'].index(task_row['task_status'])
                    )
                    
                    if st.button("Update Status"):
                        status_response = requests.put(
                            f'http://api:4000/api/advisor/tasks/{task_id}',
                            json={'status': new_status}
                        )
                        if status_response.status_code == 200:
                            st.success("Status updated successfully!")
                            st.rerun()
                        else:
                            st.error("Failed to update status")

            with col2:
                if task_id:
                    # Reminder Date Update
                    new_reminder = st.date_input(
                        "Update Reminder Date",
                        datetime.strptime(task_row['Reminder'], '%Y-%m-%d').date() 
                        if task_row['Reminder'] else datetime.now().date()
                    )
                    
                    if st.button("Update Reminder"):
                        reminder_response = requests.put(
                            f'http://api:4000/api/advisor/tasks/{task_id}/reminder',
                            json={'reminder': new_reminder.strftime('%Y-%m-%d')}
                        )
                        if reminder_response.status_code == 200:
                            st.success("Reminder updated successfully!")
                            st.rerun()
                        else:
                            st.error("Failed to update reminder")

        else:
            st.warning("No tasks available.")
    else:
        st.error(f"Failed to fetch data. API returned status code: {response.status_code}")
except Exception as e:
    st.error(f"Error loading tasks: {str(e)}")

    
    
