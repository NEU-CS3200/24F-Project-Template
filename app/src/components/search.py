import streamlit as st

def search_input(field_name):
    text_input = st.text_input (
        f"Search for {field_name}?", placeholder="Search here...", key="text_input"
    )
    return text_input