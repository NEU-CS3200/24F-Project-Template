import streamlit as st

def student_component(student):
    with st.expander(f"{student['StudentName']}"):
        col1, col2 = st.columns(2)
        with col1:
            st.write("**Student Info**")
            st.write(f"Student ID: {student['StudentID']}")
            st.write(f"Name: {student['StudentName']}")
            st.write(f"Email: {student['StudentEmail']}")
            st.write(f"Phone Number: {student['StudentPhoneNumber']}")

        with col2:
            st.write("**Student's Reviews**")
            if st.button("View Reviews", key=f"reviews_button_{student['StudentID']}"):
                st.session_state['studentId'] = student['StudentID']
                st.switch_page(f'pages/ReviewsForStudent.py')
            
            # st.button(f"{num_job_listings} {'Listing' if num_job_listings == 1 else 'Listings'}",
            #         key=f"listings_button_{student['Company ID']}",
            #         type='secondary'):
            #     st.session_state['studentId'] = student['StudentID']
            #     st.switch_page('pages/.py')