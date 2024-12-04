import streamlit as st
import pandas as pd
import requests
from datetime import datetime
from modules.nav import SideBarLinks

# Configure Streamlit page
st.set_page_config(layout='wide')
st.title("Housing Management")
SideBarLinks()

# API endpoints
preferences_url = 'http://api:4000/api/students/housing-preferences'
housing_url = 'http://api:4000/api/housing/available'
match_url = 'http://api:4000/api/housing/match'

try:
    # Fetch data
    preferences_response = requests.get(preferences_url)
    housing_response = requests.get(housing_url)
    
    if preferences_response.status_code == 200 and housing_response.status_code == 200:
        preferences_data = preferences_response.json()
        housing_data = housing_response.json()
        
        # Convert to DataFrames
        preferences_df = pd.DataFrame(preferences_data)
        housing_df = pd.DataFrame(housing_data)
        
        # Create two columns for the layout
        col1, col2 = st.columns(2)
        
        with col1:
            st.subheader("Student Housing Preferences")
            if len(preferences_df) > 0:
                # Filters for students
                student_name_filter = st.text_input("Search by Student Name")
                housing_status_filter = st.multiselect(
                    "Filter by Housing Status",
                    options=['Searching for Housing', 'Searching for Roommates', 'Complete']
                )
                
                # Apply filters
                filtered_preferences = preferences_df.copy()
                if student_name_filter:
                    filtered_preferences = filtered_preferences[
                        filtered_preferences['student_name'].str.contains(student_name_filter, case=False, na=False)
                    ]
                if housing_status_filter:
                    filtered_preferences = filtered_preferences[
                        filtered_preferences['HousingStatus'].isin(housing_status_filter)
                    ]
                
                # Display filtered students
                st.dataframe(filtered_preferences, use_container_width=True)
            else:
                st.warning("No student preferences data available")
        
        with col2:
            st.subheader("Available Housing")
            if len(housing_df) > 0:
                # Filters for housing
                availability_filter = st.multiselect(
                    "Filter by Availability",
                    options=['Available', 'Vacant', 'Pending Approval', 'Occupied'],
                    default=['Available', 'Vacant']
                )
                
                # Apply filters
                filtered_housing = housing_df.copy()
                if availability_filter:
                    filtered_housing = filtered_housing[
                        filtered_housing['Availability'].isin(availability_filter)
                    ]
                
                # Add color styling for availability status
                def style_availability(val):
                    if val == 'Available':
                        return 'background-color: #90EE90'  # Light green
                    elif val == 'Vacant':
                        return 'background-color: #98FB98'  # Lighter green
                    elif val == 'Pending Approval':
                        return 'background-color: #FFE5B4'  # Light yellow
                    elif val == 'Occupied':
                        return 'background-color: #FFB6B6'  # Light red
                    else:
                        return ''

                # Style the filtered DataFrame
                styled_filtered_housing = filtered_housing.style.applymap(
                    style_availability, 
                    subset=['Availability']
                )
                
                # Display filtered housing with styling
                st.dataframe(styled_filtered_housing, use_container_width=True)
            else:
                st.warning("No housing data available")
        
        if len(preferences_df) > 0 and len(housing_df) > 0:
            # Housing Assignment Section
            st.subheader("Make Housing Assignment")
            col3, col4 = st.columns(2)
            
            with col3:
                searching_students = filtered_preferences[filtered_preferences['HousingStatus'] == 'Searching for Housing']
                if not searching_students.empty:
                    selected_student = st.selectbox(
                        "Select Student",
                        options=searching_students['StudentID'].unique(),
                        format_func=lambda x: searching_students[searching_students['StudentID'] == x]['student_name'].iloc[0]
                    )
                    
                    # Display student's preferences
                    student_pref = searching_students[searching_students['StudentID'] == selected_student].iloc[0]
                    st.markdown(f"**Budget:** ${student_pref['Budget']}")
                    st.markdown(f"**Lease Duration:** {student_pref['LeaseDuration']}")
                    st.markdown(f"**Cleanliness Level:** {student_pref['Cleanliness']}/5")
                    st.markdown(f"**Lifestyle:** {student_pref['Lifestyle']}")
                    st.markdown(f"**Commute Time:** {student_pref['CommuteTime']} minutes")
                else:
                    st.warning("No students currently searching for housing")
            
            with col4:
                if not filtered_housing.empty:
                    selected_housing = st.selectbox(
                        "Select Housing",
                        options=filtered_housing['HousingID'].unique(),
                        format_func=lambda x: f"ID: {x} - {filtered_housing[filtered_housing['HousingID'] == x]['Style'].iloc[0]}"
                    )
                    
                    # Display housing details
                    housing_details = filtered_housing[filtered_housing['HousingID'] == selected_housing].iloc[0]
                    st.markdown(f"**Style:** {housing_details['Style']}")
                    st.markdown(f"**Availability:** {housing_details['Availability']}")
                else:
                    st.warning("No available housing units")
            
            if st.button("Assign Housing"):
                if 'selected_student' in locals() and 'selected_housing' in locals():
                    match_response = requests.put(
                        match_url,
                        json={
                            'student_id': int(selected_student),
                            'housing_id': int(selected_housing)
                        }
                    )

                    
                    if match_response.status_code == 200:
                        st.success("Housing assignment successful!")
                        st.rerun()
                    else:
                        st.error(f"Failed to assign housing: {match_response.text}")
                else:
                    st.warning("Please select both a student and a housing unit")
    else:
        st.error("Failed to fetch data from APIs")

except Exception as e:
    st.error(f"Error loading data: {str(e)}")