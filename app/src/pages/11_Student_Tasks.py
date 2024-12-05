import logging
import streamlit as st
import requests
import pandas as pd
from datetime import datetime
from modules.nav import SideBarLinks
import numpy as np

# Configure Streamlit page
st.set_page_config(layout='wide')
st.title("All Student Tasks")
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
            
            # Define status colors
            def style_status(val):
                if val == 'Completed':
                    return 'background-color: #32CD32'  # Darker green (Lime Green)
                elif val == 'In Progress':
                    return 'background-color: #98FB98'  # Light green
                elif val == 'Received':
                    return 'background-color: #FFB6B6'  # Light red
                elif val == 'Pending':
                    return 'background-color: #FFE5B4'  # Light yellow/peach
                else:
                    return ''

            # Apply styling to the DataFrame
            styled_df = df.style.apply(lambda x: np.where(x == x, '', None))  # Reset styling
            styled_df = styled_df.applymap(style_status, subset=['task_status'])
            
            # Reorder and rename columns to match SQL query
            columns_to_display = [
                'TaskID',
                'StudentID',
                'student_name',
                'task_status',
                'Description',
                'Reminder',
                'DueDate'
            ]
            
            # Ensure all columns exist and are in the right order
            df = df[columns_to_display]
            
            # Filters above table
            st.subheader("Filter Tasks")
            col1, col2 = st.columns(2)
            with col1:
                student_name_filter = st.text_input("Search by Student Name")
            with col2:
                student_id_filter = st.text_input("Search by Student ID")

            # Apply filters
            filtered_df = df.copy()
            if student_name_filter:
                filtered_df = filtered_df[filtered_df['student_name'].str.contains(student_name_filter, case=False, na=False)]
            if student_id_filter:
                filtered_df = filtered_df[filtered_df['StudentID'].astype(str).str.contains(student_id_filter, na=False)]

            # Style the filtered DataFrame
            styled_filtered_df = filtered_df.style.apply(lambda x: np.where(x == x, '', None))
            styled_filtered_df = styled_filtered_df.applymap(style_status, subset=['task_status'])

            # Display filtered data
            st.subheader(f"Showing {len(filtered_df)} Tasks")
            st.dataframe(
                styled_filtered_df,
                use_container_width=True,
                hide_index=True
            )

            # Task Editor
            st.subheader("Edit Task")
            if task_id := st.selectbox("Select Task ID", options=filtered_df['TaskID'].unique()):
                task_row = filtered_df[filtered_df['TaskID'] == task_id].iloc[0]
                st.write(f"Current Status: {task_row['task_status']}")
                st.write(f"Current Reminder: {task_row['Reminder']}")
                
                col1, col2 = st.columns(2)
                
                with col1:
                    # Status Update
                    new_status = st.selectbox(
                        "Update Status",
                        options=['Pending', 'In Progress', 'Completed', 'Received'],
                        index=['Pending', 'In Progress', 'Completed', 'Received'].index(task_row['task_status'])
                    )
                    
                    if st.button("Update Status"):
                        status_response = requests.put(
                            f'http://api:4000/api/advisor/tasks/{task_id}',
                            json={'status': new_status},
                            headers={'Content-Type': 'application/json'}
                        )
                        if status_response.status_code == 200:
                            st.success("Status updated successfully!")
                            st.rerun()
                        else:
                            st.error(f"Failed to update status: {status_response.text}")

                with col2:
                    # Parse the reminder date correctly
                    try:
                        # First try to parse the date if it's in GMT format
                        current_reminder = datetime.strptime(task_row['Reminder'], '%a, %d %b %Y %H:%M:%S GMT')
                    except ValueError:
                        try:
                            # Fallback to simple YYYY-MM-DD format
                            current_reminder = datetime.strptime(task_row['Reminder'], '%Y-%m-%d')
                        except ValueError:
                            # If all parsing fails, use current date
                            current_reminder = datetime.now()

                    # Reminder Date Update
                    new_reminder = st.date_input(
                        "Update Reminder Date",
                        current_reminder.date()
                    )
                    
                
                    
                    if st.button("Update Reminder"):
                        reminder_response = requests.put(
                            f'http://api:4000/api/advisor/tasks/{task_id}/reminder',
                            json={'reminder': new_reminder.strftime('%Y-%m-%d')},
                            headers={'Content-Type': 'application/json'}
                        )
                        if reminder_response.status_code == 200:
                            st.success("Reminder updated successfully!")
                            st.rerun()
                        else:
                            st.error(f"Failed to update reminder: {reminder_response.text}")

        else:
            st.warning("No tasks available.")
    else:
        st.error(f"Failed to fetch data. API returned status code: {response.status_code}")
except Exception as e:
    st.error(f"Error loading tasks: {str(e)}")

    
