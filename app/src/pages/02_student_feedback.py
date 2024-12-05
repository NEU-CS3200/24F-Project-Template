import pandas as pd
import altair as alt
import streamlit as st
from modules.nav import SideBarLinks
import requests
import logging
from wordcloud 

logger = logging.getLogger(__name__)

st.set_page_config(layout='wide')

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

if st.button("Back", key="back_button"):
    st.switch_page('pages/02_recruiter_home.py')

st.title("View Student Feedback by Company.")

# Display all companies
companies = requests.get('http://web-api:4000/co/companies').json()
company_names = [company['name'] for company in companies]
st.markdown("### **Select a company to view feedback.**")
selected_company = st.selectbox("", company_names)

#get student feedback for selected company
if selected_company:
    for company in companies:
        if company['name'] == selected_company:
            company_id = company['id']
            break
    
    #get student feedback for selected company
    feedback_response = requests.get('http://web-api:4000//jobPostings/reviews/{company_id}')

    # Check if the response status is OK (200)
    if feedback_response.status_code == 200:
        feedback = feedback_response.json()  

        """# Convert feedback into a DataFrame
        feedback_df = pd.DataFrame(feedback)

        if not feedback_df.empty:
            # Display the feedback data
            st.subheader("Feedback Details")
            st.dataframe(feedback_df)

            # Highlight key themes or insights
            st.subheader("Common Feedback Themes")

            # Text Analysis: Extract keywords
            all_content = " ".join(feedback_df['content'].astype(str))
            wordcloud = WordCloud(
                background_color='white',
                colormap='viridis',
                width=800,
                height=400
            ).generate(all_content)

            # Display Word Cloud
            st.markdown("#### Word Cloud")
            fig, ax = plt.subplots(figsize=(10, 5))
            ax.imshow(wordcloud, interpolation='bilinear')
            ax.axis('off')
            st.pyplot(fig)

            # Visualize Most Common Words
            st.markdown("#### Most Common Words")
            from collections import Counter
            import nltk
            from nltk.corpus import stopwords

            nltk.download('stopwords')
            stop_words = set(stopwords.words('english'))
            words = [word.lower() for word in all_content.split() if word.isalpha() and word.lower() not in stop_words]
            word_counts = Counter(words)
            common_words = pd.DataFrame(word_counts.items(), columns=['Word', 'Count']).nlargest(10, 'Count')

            # Bar Chart of Common Words
            bar_chart = alt.Chart(common_words).mark_bar().encode(
                x=alt.X('Count:Q', title='Count'),
                y=alt.Y('Word:N', sort='-x', title='Word')
            )
            st.altair_chart(bar_chart, use_container_width=True)

        else:
            st.warning("No feedback found for the selected company.")"""
    else:
        st.error(f"Failed to load student feedback data. Status code: {feedback_response.status_code}")
        feedback = []