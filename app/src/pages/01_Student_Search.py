import logging
logger = logging.getLogger(__name__)

import streamlit as st
import requests
import pandas as pd
import numpy as np
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title(f"Student Search")
with st.form("student_search"):
    
    student_input = st.text_input(
        "Search Students",
        placeholder="Enter student name or Id#",
        key="search")

    if st.session_state["role"] == "coop_advisor":
        st.radio(
            "Student Type",
            key="student_type",
            options=["All", "Already Advising",],
        )

    if st.session_state["role"] == "employer":
        st.radio(
            "Student Type",
            key="student_type",
            options=["All", "Applied", "Flagged",],
        )

    st.form_submit_button('Search')

try:
    categories_response = requests.get('http://api:4000/p/categories')
    
    if categories_response.status_code == 200:
        categories_data = categories_response.json()
        category_options = [""] + [category['value'] for category in categories_data]
    else:
        st.error("Failed to fetch categories")
        category_options = []
except requests.exceptions.RequestException as e:
    st.error(f"Error connecting to categories API: {str(e)}")
    category_options = []

with st.form("add_product_form"):
    
    product_name = st.text_input("Product Name")
    product_description = st.text_area("Product Description")
    product_price = st.number_input("Product Price", min_value=0.0, step=0.01)
    product_category = st.selectbox("Product Category", options=category_options, index=0)
    
    submit_button = st.form_submit_button("Add Product")
    
    if submit_button:
        if not product_name:
            st.error("Please enter a product name")
        elif not product_description:
            st.error("Please enter a product description")
        elif product_price <= 0:
            st.error("Please enter a valid product price")
        elif not product_category:
            st.error("Please select a product category")
        else:
            product_data = {
                "product_name": product_name,
                "product_description": product_description,
                "product_price": product_price,
                "product_category": product_category
            }
            logger.info(f"Product form submitted with data: {product_data}")
            
            try:
                response = requests.post('http://api:4000/p/product', json=product_data)
                if response.status_code == 200:
                    st.success("Product added successfully!")
                else:
                    st.error(f"Error adding product: {response.text}")
            except requests.exceptions.RequestException as e:
                st.error(f"Error connecting to server: {str(e)}")

