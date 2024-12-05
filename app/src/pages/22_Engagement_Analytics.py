import logging
import requests
import pandas as pd
import matplotlib.pyplot as plt
import streamlit as st
from modules.nav import SideBarLinks

logger = logging.getLogger(__name__)

st.set_page_config(layout='wide')

SideBarLinks()

st.title('Engagement Analytics')

# Initialize session state for selected_feature if not already set
if 'selected_feature' not in st.session_state:
    st.session_state['selected_feature'] = None

# Load Engagement Analytics Data from API
def load_engagement_data():
    try:
        response = requests.get('http://api:4000/ea/engagementAnalytics')
        response.raise_for_status()  # Raise an exception for HTTP errors
        data = response.json()
        return pd.DataFrame(data)  # Convert JSON data to pandas DataFrame
    except requests.exceptions.RequestException as e:
        logger.error(f"Failed to fetch engagement analytics data: {e}")
        st.error("Failed to load data from the server. Please try again later.")
        return pd.DataFrame()  # Return an empty DataFrame as fallback

# Load data
data = load_engagement_data()

# Debug: Show raw data
#if st.checkbox("Show Raw Data"):
#    st.dataframe(data)

# Ensure the DataFrame is not empty
if data.empty:
    st.error("No data available. Please check your backend or database.")
    st.stop()

# Extract unique features for filtering
features = data['feature'].unique()

# Sidebar Filters
st.sidebar.subheader("Filters")
selected_feature = st.sidebar.selectbox(
    "Select Feature", 
    features, 
    index=0 if st.session_state['selected_feature'] is None else features.tolist().index(st.session_state['selected_feature']),
    key='filter_feature'
)
selected_date_range = st.sidebar.date_input(
    "Select Date Range",
    value=[
        pd.to_datetime(data['date']).min(),
        pd.to_datetime(data['date']).max()
    ]
)

# Update selected feature in session state
st.session_state['selected_feature'] = selected_feature

# Filter data based on user selections
filtered_data = data[
    (data['feature'] == selected_feature) &
    (pd.to_datetime(data['date']) >= pd.to_datetime(selected_date_range[0])) &
    (pd.to_datetime(data['date']) <= pd.to_datetime(selected_date_range[1]))
]

# Display filtered data
st.subheader(f"Filtered Engagement Data for '{selected_feature}'")
if not filtered_data.empty:
    st.dataframe(filtered_data)
else:
    st.warning("No data found for the selected filters.")

# Visualize engagement trends
st.subheader("Engagement Trends")
if not filtered_data.empty:
    plt.figure(figsize=(10, 5))
    plt.plot(
        pd.to_datetime(filtered_data['date']),
        filtered_data['usageCount'],
        marker='o',
        linestyle='-',
        label=selected_feature
    )
    plt.title(f"Engagement Trends for '{selected_feature}'")
    plt.xlabel("Date")
    plt.ylabel("Usage Count")
    plt.legend()
    st.pyplot(plt)
else:
    st.warning("No data to visualize for the selected filters.")

# Search for Features
st.subheader("Search Feature Engagement")
search_query = st.text_input("Search Features: ")

# Filter features based on the search query
filtered_features = [f for f in features if search_query.lower() in f.lower()]

# Display matching features as buttons
for f in filtered_features:
    if st.button(f"View Analytics for {f}"):
        st.session_state['selected_feature'] = f

# Check if a feature is selected
if "selected_feature" in st.session_state and st.session_state['selected_feature']:
    st.write(f"Showing analytics for: {st.session_state['selected_feature']}")
    # Dynamically update the page based on the selected feature
    selected_data = data[data['feature'] == st.session_state['selected_feature']]
    if not selected_data.empty:
        st.dataframe(selected_data)
    else:
        st.warning("No data found for this feature.")

