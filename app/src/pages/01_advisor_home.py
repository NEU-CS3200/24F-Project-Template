import streamlit as st
from modules.nav import SideBarLinks

import logging
import requests
logger = logging.getLogger(__name__)

st.set_page_config(layout = 'wide')


SideBarLinks()

if 'page_state' not in st.session_state:
    st.session_state.page_state = 'advisor_home'
if 'company_id' not in st.session_state:
    st.session_state.company_id = None
if 'company_name' not in st.session_state:
    st.session_state.company_name = None
if 'company_rating' not in st.session_state:
    st.session_state.company_rating = None

col3, col4 = st.columns([.5, 1])
with col3:

  st.title(f"Welcome, {st.session_state['first_name']}!")
  st.write('')
  st.write('')







with col4:
  results = requests.get('http://api:4000/co/companiesSpecific').json()

  if (st.session_state.page_state == 'advisor_home'):
    st.write('### Employers (Companies):')
    for result in results:
     st.subheader(f"{result['CompanyName']}")
     st.write(f"Average Rating: {result['AverageRating']}")
     if (st.button(f'View {result["CompanyName"]}', key=f'view_{result["id"]}')):
      st.session_state.page_state = 'company'
      st.session_state.company_id = result['id']
      st.session_state.company_name = result['CompanyName']
      st.session_state.company_rating = result['AverageRating']
      st.rerun()


  elif st.session_state.page_state == 'company':
    st.title(f"{st.session_state.company_name}")
    company_id = st.session_state.company_id
    col1, col2 = st.columns([.5, 1])
  
  
  
    reviews = requests.get(f'http://api:4000/co/companies/{company_id}').json()
    with col1:
    
     st.write('### Reviews:')
     for review in reviews:
        
        if st.button(f"Author: {review['FirstName']} {review['LastName']}", key=f'view_{review["StudentId"]}'):
          st.session_state.page_state = 'student'
          st.session_state.student_id = review['StudentId']
          st.rerun()
        st.write(f"Title: {review['ReviewTitle']}")
        st.write(f"Rating: {review['rating']}")
        st.write(f"Content: {review['ReviewContent']}")
        st.write('')
      
    with col2:
      st.write(' ')
      st.write(' ')
      st.write(' ')
      st.write(' ')
      st.write(' ')
      st.write(' ')
      st.write(' ')
      st.write(' ')
      st.write(' ')
      st.write(' ')
      st.write(' ')
      st.write(' ')
      st.write(' ')
      st.write(' ')
      st.write(' ')
      st.write(' ')
      st.write(' ')
      st.write(' ')
  
  
    if st.button("Back to Advisor Home"):
      st.session_state.page_state = 'advisor_home'
      st.rerun()




    

   

   
    
        
        
                 

    
