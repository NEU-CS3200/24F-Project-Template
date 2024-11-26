import streamlit as st

def job_listing_component(job, num_reviews):
    with st.expander(f"{job['Company']}: {job['Job Title']}"):
        col1, col2 = st.columns(2)
        with col1:
            st.write("**Start Date**")
            st.write(job.get('Start Date', 'N/A'))
            st.write("**End Date**")
            st.write(job.get('End Date', 'N/A'))
            st.write("**Skills**")
            st.write(job.get('Skills', 'N/A'))
        with col2:
            st.write("**Hourly Wage**")
            st.write(f"${job.get('Hourly Wage', 'N/A')} per hour")
            st.write("**Location**")
            st.write(job.get('Location', 'N/A'))
            st.write("**All Reviews**")
            if st.button(f"{num_reviews} {'Review' if num_reviews == 1 else 'Reviews'}",
                    key=f"reviews_button_{job['Job Listing ID']}",
                    type='secondary'):
                st.query_params.job_listing_id = job['Job Listing ID']
                st.session_state['job_listing_id'] = job['Job Listing ID']
                st.switch_page('pages/Reviews.py')

        st.write("**Description**")
        st.write(job.get('Description', 'N/A'))
