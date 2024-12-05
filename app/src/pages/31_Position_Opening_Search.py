import logging

logger = logging.getLogger(__name__)

import streamlit as st
import requests
import pandas as pd
import numpy as np
from modules.nav import SideBarLinks

st.set_page_config(layout="wide")

SideBarLinks()

st.title("Position Search")

with st.form("position_value"):
    position_value = st.text_input(
        "Search Positions",
        placeholder="Enter company name or position id#",
    )

    submit_button = st.form_submit_button("Search")

    if submit_button:
        with requests.Session() as s:
            if not position_value:
                response = s.get("http://api:4000/pos/positions")
                if response.status_code == 200:
                    st.session_state["df_1"] = pd.json_normalize(response.json())
            else:
                if type(position_value) is int:
                    response = s.get(f"http://api:4000/pos/positions/{position_value}")
                    if response.status_code == 200 and len(response.json()) != 0:
                        st.session_state["df_1"] = pd.json_normalize(response.json())
                else:
                    response = s.get(
                        f"http://api:4000/pos/positions_company/{str(position_value)}"
                    )
                    if response.status_code == 200 and len(response.json()) != 0:
                        st.session_state["df_1"] = pd.json_normalize(response.json())
                        logger.info(st.session_state["df_1"])

if st.session_state.get("df_1") is not None:
    for index, row in st.session_state["df_1"].iterrows():
        with st.expander(f"{row['summary']}"):
            col1, col2, col3, col4 = st.columns(4)
