import streamlit as st

def review_component(review):
    with st.expander(f"{'Anonymous' if review['Anonymous'] else review['Student Name']}"):
        st.write("**Job Satisfaction**")
        st.write(review['Job Satisfaction'])
        st.write("**Hourly Wage**")
        st.write(review['Hourly Wage'])
        st.write("**Description**")
        st.write(review['Description'])
