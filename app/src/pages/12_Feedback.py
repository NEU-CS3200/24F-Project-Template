import streamlit as st
import pandas as pd
import requests
from modules.nav import SideBarLinks

# Configure Streamlit page
st.set_page_config(layout='wide')
st.title("Feedback Dashboard")
SideBarLinks()

# API endpoint for feedback
api_url = 'http://api:4000/api/students/feedback'

# Fetch feedback data from the API
try:
    response = requests.get(api_url)
    if response.status_code == 200:
        # Parse API response JSON
        data = response.json()

        if data:
            # Convert to DataFrame
            # Convert to DataFrame
            df = pd.DataFrame(data)

            # Ensure the DataFrame is sorted in the same order as the SQL query
            df = df.sort_values(by='Date', ascending=False)

            # Top Filters
            col1, col2, col3 = st.columns([2, 2, 1])
            with col1:
                student_filter = st.text_input("Search by Student Name")
            with col2:
                advisor_filter = st.text_input("Search by Student ID")
            with col3:
                min_rating = st.slider("Minimum Progress Rating", 1, 5, 1)

            # Apply filters
            if student_filter:
                df = df[df['student_name'].str.contains(student_filter, case=False, na=False)]
            if advisor_filter:
                df = df[df['student_id'].astype(str).str.contains(advisor_filter, case=False, na=False)]
            df = df[df['ProgressRating'] >= min_rating]

            # Display filtered DataFrame
            st.dataframe(df)

            # Detailed View
            if st.checkbox("Show Detailed Feedback View"):
                for index, row in df.iterrows():
                    with st.expander(f"Feedback ID: {row['FeedbackID']}"):
                        st.markdown(f"**Student Name:** {row['student_name']}")
                        st.markdown(f"**Student ID:** {row['student_id']}")
                        st.markdown(f"**Date:** {row['Date']}")
                        st.markdown(f"**Progress Rating:** {row['ProgressRating']}")
                        st.markdown(f"**Description:** {row['Description']}")
                        st.markdown("---")
        else:
            st.warning("No feedback entries found.")
    else:
        st.error(f"Failed to fetch feedback. API returned status code: {response.status_code}")
except Exception as e:
    st.error(f"Error loading feedback: {str(e)}")



