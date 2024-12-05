import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title("Posted Positions")
df = None

try:
    test_response = requests.get("http://api:4000/pos/positions")

    if not test_response.status_code == 200:
        st.error("Failed to fetch positions")
except requests.exceptions.RequestException as e:
    st.error(f"Error connecting to positions API: {str(e)}")
try:
    response = requests.get(
        f"http://api:4000/emp/{st.session_state("id")}/positions"
        )
    if response.status_code == 200:
        if len(response.json()) != 0:
            df = pd.json_normalize(response.json())
except requests.exceptions.RequestException as e:
    st.error(f"Error connecting to server: {str(e)}")

if df is not None:
    for index, row in df.iterrows():
        with st.expander(f"{row['firstName']} {row['lastName']}"):
            col1, col2, col3, col4 = st.columns(4)
            col1.write("##### Name:")
            col1.write(f"{row['name']}")
            col2.write("##### Major:")
            col2.write(f"{row['major']}")
            col3.write("##### Year:")
            col3.write(f"{row['year']}")
            col4.write("##### Contact:")
            col4.write(f"{row['email']} | {row['mobile']}")
