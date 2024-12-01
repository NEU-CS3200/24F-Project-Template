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

st.title("Choose an available company below to view job postings and reviews.")

# Display all companies, and whichever one they choose, 
# call the api to display all reviews for that company
companies = requests.get('http://api:4000/co/companies').json()
company_names = [company['name'] for company in companies]

st.markdown("### **Select a company**")
selected_company = st.selectbox("Select a company", company_names, key="selected_company")

if "last_selected_company" not in st.session_state:
    st.session_state["last_selected_company"] = None

if st.session_state["last_selected_company"] != selected_company:
    st.session_state["selected_job_id"] = None
    st.session_state["show_add_review_form"] = False
    st.session_state["last_selected_company"] = selected_company

col1, col2 = st.columns(2)

selected_job_id = st.session_state.get("selected_job_id", None)
show_add_review_form = st.session_state.get("show_add_review_form", False)

with col1:
    if selected_company:
        for company in companies:
            if company['name'] == selected_company:
                company_id = company['id']
                company_name = company['name']
                break

        all_job_postings_reponse = requests.get(f"http://api:4000/jp/jobPostings/{company_id}")

        if all_job_postings_reponse.status_code == 200:
            all_job_postings = all_job_postings_reponse.json()
            all_job_postings.reverse()

            if all_job_postings == []:
                st.info("No jobs posted for this company.")
        else:
            st.error("Failed to load job postings.")
            all_job_postings = []

        st.subheader(f"All Job Postings From {company_name}:")

        # Display the job postings for the company
        for job_posting in all_job_postings:
            st.write(f"Title: {job_posting['name']}")
            st.write(f"Description: {job_posting['description']}")
            st.write(f"Location: {job_posting['location']}")
            st.write(f"Contact Name & Email: {job_posting['firstName']} {job_posting['lastName']} | {job_posting['email']} | {job_posting['phone']}")
            st.write(f"Date Posted: {job_posting['datePosted']}")
            if st.button("View Reviews"):
                st.session_state["selected_job_id"] = job_posting['id']
                st.session_state["selected_job_name"] = job_posting['name']

            if st.button('Add Review'):
                st.session_state["selected_job_id"] = job_posting['id']
                st.session_state["selected_job_name"] = job_posting['name']
                st.session_state["show_add_review_form"] = True

            if st.button("Delete Posting"):
                response = requests.delete(f"http://api:4000/jp/jobPostings/{job_posting['id']}")
                if response.status_code == 200:
                    st.success("Job posting deleted successfully.")
                else:
                    st.error("Failed to delete job posting.")

            st.write('---')

with col2:
    if selected_job_id:
        reviews_response = requests.get(f"http://api:4000/jp/jobPostings/reviews/{selected_job_id}")

        if reviews_response.status_code == 200:
            reviews = reviews_response.json()
            if reviews:
                for review in reviews:
                    st.write(f"Author: {review['firstName']}, {review['lastName']}")
                    st.write(f"Title: {review['title']}")
                    st.write(f"Rating: {review['rating']}/5")
                    st.write(f"Description: {review['content']}")
                    st.write(f"Date: {review['datePosted']}")
                    st.write('---')
                
            else:
                st.info(f"No reviews available for {st.session_state['selected_job_name']}.")
        else:
            st.error("Failed to load reviews.")

    if show_add_review_form:
        st.subheader(f"Add a review for {st.session_state['selected_job_name']}")

        with st.form(key='addReviewForm', clear_on_submit=True):
            first_name = st.text_input("First Name", "")
            last_name = st.text_input("Last Name", "")
            title = st.text_input("Enter Title", "")
            rating = st.slider("Rating", 1, 5, 5)
            description = st.text_area("Enter Review")
            submit_button = st.form_submit_button("Submit")

            if submit_button:
                if not first_name or not last_name or not title or not description:
                    st.error("All fields must be filled out!")
                else:
                    review_payload = {
                        "firstName": first_name,
                        "lastName": last_name,
                        "title": title,
                        "rating": rating,
                        "content": description,
                        "jobPostingId": st.session_state["selected_job_id"],
                    }

                    response = requests.post("http://api:4000/jp/jobPostings/reviews", json=review_payload)
                    if response.status_code == 201:
                        st.success("Review added successfully!")
                        st.session_state["show_add_review_form"] = False
                        st.experimental_rerun()
                    else:
                        st.error("Failed to add review. Please try again.")