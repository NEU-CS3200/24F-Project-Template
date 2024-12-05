import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title("Position Search")

try:
    test_response = requests.get("http://api:4000/pos/positions")

    if not test_response.status_code == 200:
        st.error("Failed to fetch positions")
except requests.exceptions.RequestException as e:
    st.error(f"Error connecting to positions API: {str(e)}")

df_2 = None

with st.form("position_search"):
    positon_value = st.text_input(
        "Search Positions",
        placeholder="Enter company name or position id#",
    )

    submit_button = st.form_submit_button("Search")

    df_1 = None

    if submit_button:
            logger.info(f"Employee form submitted with data: {positon_value}")

            try:
                response1 = requests.get(
                    f"http://api:4000/pos/positions_company/{positon_value}"
                )
                response2 = requests.get(
                    f"http://api:4000/pos/positions/{positon_value}"
                )
                if response1.status_code == 200:
                    if len(response1.json()) != 0:
                        df_1 = pd.json_normalize(response1.json())
                if response2.status_code == 200:
                    if len(response2.json()) != 0:
                        df_1 = pd.json_normalize(response2.json())
            except requests.exceptions.RequestException as e:
                st.error(f"Error connecting to server: {str(e)}")

if df_1 is not None:
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


st.title("Flagged Positions")

if df_2 is not None:
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
else:
    st.title("None")
