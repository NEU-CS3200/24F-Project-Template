import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title(f"Student Search")
with st.form("student_search"):
    
    company_input = st.text_input(
        "Search",
        placeholder="Enter company name",
        key="search")

    employer_input = st.text_input(
        "Search",
        placeholder="Enter employer name",
        key="search")

    if st.session_state["role"] == "coop_advisor":
        st.radio(
            "Employer Type",
            key="employer_type",
            options=["All", "Already Advising",],
        )

    if st.session_state["role"] == "student":
        st.radio(
            "Employer Type",
            key="employer_type",
            options=["All", "Applied", "Flagged",],
        )

    st.form_submit_button('Search')

if "df" not in st.session_state:
    st.session_state.df = pd.DataFrame(
        np.random.randn(12, 5), columns=["a", "b", "c", "d", "e"]
    )

event = st.dataframe(
    st.session_state.df,
    key="data",
    on_select="rerun",
    selection_mode=["multi-row", "multi-column"],
)

