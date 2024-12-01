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

st.title("Choose an available company below to view their common interview questions.")

# Display all companies, and whichever one they choose, 
# call the common question api get using the company id
companies = requests.get('http://api:4000/co/companies').json()
company_names = [company['name'] for company in companies]
st.markdown("### **Select a company to view common questions**")
selected_company = st.selectbox("", company_names)

col1, col2 = st.columns(2)

# Display the common questions, they are now editable
with col1:
    if selected_company:
        for company in companies:
            if company['name'] == selected_company:
                company_id = company['id']
                company_name = company['name']
                break

        all_questions_response = requests.get(f"http://api:4000/cq/commonQuestions/{company_id}")
        if all_questions_response.status_code == 200:
            all_questions = all_questions_response.json()
            all_questions.reverse()
        else:
            st.error("Failed to load questions.")
            all_questions = []

        st.subheader(f"Common Questions for {company_name}:")
        keyphrase = st.text_input("Filter questions by keyphrase:")

        if keyphrase.strip():
            filtered_response = requests.get(f"http://api:4000/cq/getQuestionsByKeyphrase/{keyphrase.strip()}")
            if filtered_response.status_code == 200:
                questions = filtered_response.json()
                if not questions:
                    st.info("No questions match the given keyphrase.")
            else:
                st.error(f"Failed to filter questions: {filtered_response.text}")
                questions = []
        else:
            questions = all_questions

        # Display the questions
        for question in questions:
            question_id = question['id']
            question_text = question['commonQuestion']

            col_edit, col_delete = st.columns([4, 1])  # Two columns for edit and delete buttons

            with col_edit:
                editable_question = st.text_input("See something wrong? Edit here", question_text, key=f"edit_{question_id}")
                if st.button("Save Edits", key=f"save_{question_id}"):
                    if editable_question.strip() == "":
                        st.error("Please enter some text")
                    else:
                        payload = {'edited_question': editable_question}
                        update_response = requests.put(
                            f"http://api:4000/cq/updateQuestion/{question_id}",
                            json=payload
                        )
                        if update_response.status_code == 200:
                            st.success("Question updated successfully!")
                        else:
                            st.error(f"Failed to update question: {update_response.text}")

            with col_delete:
                if st.button("Delete", key=f"delete_{question_id}"):
                    delete_response = requests.delete(f"http://api:4000/cq/deleteQuestion/{question_id}")
                    if delete_response.status_code == 200:
                        st.success("Question deleted successfully!")
                    else:
                        st.error(f"Failed to delete question: {delete_response.text}")

# Add a question to the company
with col2:
    st.subheader("Add a question you experienced in an interview for your company!")
    company_of_question = st.text_input("Enter Company Name")
    common_question_input = st.text_area("Enter Question")

    for company in companies:
        if company['name'] == company_of_question:
            company_to_add_id = company['id']
            break

    if st.button("Add Common Question"):
        if not company_to_add_id or not common_question_input:
            st.error("Both fields are required.")
        else:
            payload = {
                'company_id': company_to_add_id,
                'question': common_question_input
            }

            add_question_response = requests.post("http://api:4000/cq/addQuestion", json=payload)
            if add_question_response.status_code == 200:
                st.success("Common question added successfully.")
            elif add_question_response.status_code == 404:
                st.error("Company doesn't exist.")
            else:
                st.error(f"An error occurred while adding the question: {add_question_response.text}")


