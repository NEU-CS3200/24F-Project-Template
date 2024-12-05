import logging
logger = logging.getLogger(__name__)

import streamlit as st
import requests
import pandas as pd
import numpy as np
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

SideBarLinks()
st.title(f"Tickets")
try:
    test_response = requests.get("http://api:4000/adm/tickets")

    if not test_response.status_code == 200:
        st.error("Failed to fetch students")
except requests.exceptions.RequestException as e:
    st.error(f"Error connecting to API: {str(e)}")

with st.form("ticket_search"):
    ticket_id = student_input = st.text_input(
        "Search Tickets",
        placeholder="Enter Ticket Id#",
    )
    submit_button = st.form_submit_button("Search")

    if submit_button:
        if not ticket_id:
            try:
                response = requests.get(
                    f"http://api:4000/adm/tickets"
                )
                if response.status_code == 200:
                    if len(response.json()) != 0:
                        df = pd.json_normalize(response.json())
                        st.write(df)
            except requests.exceptions.RequestException as e:
                st.error(f"Error connecting to server: {str(e)}")    
        else:
            logger.info(f"User form submitted with data: {ticket_id}")

            try:
                response = requests.get(
                    f"http://api:4000/adm/tickets/{ticket_id}"
                )
                if response.status_code == 200:
                    if len(response.json()) != 0:
                        df = pd.json_normalize(response.json())
                        st.write(df)
            except requests.exceptions.RequestException as e:
                st.error(f"Error connecting to server: {str(e)}")

try:
    response = requests.get(
        "http://api:4000/adm/tickets"
    )
    if response.status_code == 200:
        if len(response1.json()) != 0:
            df = pd.json_normalize(response1.json())
except requests.exceptions.RequestException as e:
    st.error(f"Error connecting to server: {str(e)}")

if df is not None:
    for index, row in df.iterrows():
        with st.expander(f"{row['user']} {row['lastName']}"):
            col1, col2, col3, col4 = st.columns(4)
            col1.write("##### Name:")
            col1.write(f"{row['name']}")
            col2.write("##### Major:")
            col2.write(f"{row['major']}")
            col3.write("##### Year:")
            col3.write(f"{row['year']}")
            col4.write("##### Contact:")
            col4.write(f"{row['email']} | {row['mobile']}")
    
