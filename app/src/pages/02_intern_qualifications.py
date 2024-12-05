import pandas as pd
import altair as alt
import streamlit as st
from modules.nav import SideBarLinks
import requests
import logging
logger = logging.getLogger(__name__)

st.set_page_config(layout = 'wide')

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

if st.button("Back", key="back_button"):
    st.switch_page('pages/02_recruiter_home.py')

st.title("Compare Intern Qualifications Across Companies.")

# Display all companies
companies = requests.get('http://web-api:4000/co/companies').json()
company_names = [company['name'] for company in companies]
st.markdown("### **Select a company to view intern qualifications**")
selected_company = st.selectbox("", company_names)

if selected_company:
    for company in companies:
        if company['name'] == selected_company:
            company_id = company['id']
            break
    
    #get intern qualifications for selected company
    comparison_response = requests.get('http://web-api:4000/in/qualifications/comparison')

    # Check if the response status is OK (200)
    if comparison_response.status_code == 200:
        qualifications = comparison_response.json()  # Now safe to call .json() because the response is successful

    else:
        st.error(f"Failed to load qualification comparison data. Status code: {comparison_response.status_code}")
        qualifications = []

    company_data = [q for q in qualifications if q['companyName'] == selected_company]

    #display qualifications w/ bar chart
    st.subheader(f"Intern Qualifications at {selected_company}:")
    if company_data:
        st.dataframe(company_data)

        st.markdown("### **Intern Qualification Comparison Across Companies**")
        
        df = pd.DataFrame(qualifications)

        chart = alt.Chart(df).mark_bar().encode(
            x=alt.X('skillName:N', title='Skill'),
            y=alt.Y('numInternsWithSkill:Q', title='Number of Interns'),
            color=alt.Color('companyName:N', title='Company'),
            tooltip=['companyName', 'skillName', 'numInternsWithSkill']
        ).interactive()

        st.altair_chart(chart, use_container_width=True)

    else:
        st.info(f"No intern qualification data for {selected_company}.")


#view individual intern skills
st.subheader("View Qualifications for a Specific Student")

students_response = requests.get("http://web-api:4000/in/students")
if students_response.status_code == 200:
    students = students_response.json()
    student_names = [f"{student['firstName']} {student['lastName']}" for student in students]
    selected_student = st.selectbox("Select a Student", student_names)

    if selected_student:
        student_id = students[student_names.index(selected_student)]['id']
        qualifications_response = requests.get(f"http://web-api:4000/in/students/{student_id}/qualifications")

        if qualifications_response.status_code == 200:
            student_qualifications = qualifications_response.json()
            st.write("Qualifications:")
            st.dataframe(student_qualifications)

        else:
            st.error("Failed to load student qualifications.")

else:
    st.error("Failed to load students.")


#add individual intern skill
st.subheader("Add a New Qualification for a Student")

selected_student_name = st.selectbox("Select a Student", student_names, key="add_skill")
new_qualification = st.text_input("Enter New Qualification", key="new_qualification")

if st.button("Add Qualification"):
    if selected_student_name and new_qualification.strip():
        student_id = students[student_names.index(selected_student_name)]['id']
        data = {"skillName": new_qualification.strip()}
        add_response = requests.post(f"http://web-api:4000/in/students/{student_id}/qualifications", json=data)

        if add_response.status_code == 201:
            st.success(f"Successfully added qualification '{new_qualification}' for {selected_student_name}.")

        else:
            st.error(f"Failed to add qualification: {add_response.text}")

    else:
        st.error("Please select a student and enter a qualification.")

#delete individual intern skill
for qualification in student_qualifications:
    skill_name = qualification['skillName']
    skill_id = qualification['id']

    col1, col2 = st.columns([4, 1])

    with col1:
        st.write(skill_name)
        
    with col2:
        if st.button("Remove", key=f"remove_{skill_id}"):
            delete_response = requests.delete(f"http://web-api:4000/in/students/{student_id}/qualifications/{skill_id}")

            if delete_response.status_code == 204:
                st.success(f"Removed qualification '{skill_name}'.")

            else:
                st.error("Failed to remove qualification.")

"""# Ensure each button has a unique key
for i, skill_id in enumerate(skill_list):
    if st.button(f"Remove {skill_id}", key=f"remove_{skill_id}_{i}"):
        # Handle button click
"""