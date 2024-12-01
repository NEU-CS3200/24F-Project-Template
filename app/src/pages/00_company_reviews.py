import streamlit as st
from modules.nav import SideBarLinks
import requests
import logging
logger = logging.getLogger(__name__)

st.set_page_config(layout = 'wide')

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

if st.button("Back", key="back_button"):
    st.switch_page('pages/00_student_home.py')

st.title("Choose an available company below to view reviews.")

# Display all companies, and whichever one they choose, 
# call the api to display all reviews for that company
companies = requests.get('http://api:4000/co/companies').json()
company_names = [company['name'] for company in companies]
st.markdown("### **Select a company to view common questions**")
selected_company = st.selectbox("", company_names)

col1, col2 = st.columns(2)

with col1:
    if selected_company:
        for company in companies:
            if company['name'] == selected_company:
                company_id = company['id']
                company_name = company['name']
                break

        all_reviews_response = requests.get(f"http://api:4000/re/reviews/{company_id}")
        if all_reviews_response.status_code == 200:
            all_reviews = all_reviews_response.json()
            all_reviews.reverse()

            if all_reviews == []:
                st.info("No reviews available for this company.")
        else:
            st.error("Failed to load reviews.")
            all_reviews = []

        st.subheader(f"Reviews for {company_name}:")

        # Display the reviews
        for review in all_reviews:
            student_id = review['studentId']
            st.write(f"Title: {review['title']}")
            st.write(f"Rating: {review['rating']}")
            st.write(f"Review: {review['content']}")
            st.write(f"Date Posted: {review['datePosted']}")

            student_name = requests.get(f"http://api:4000/st/students/{student_id}").json()['name']
            st.write(f"Author: {student_name}")
            st.write('---')