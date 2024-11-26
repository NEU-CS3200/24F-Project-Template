import streamlit as st
import requests
import logging
logger = logging.getLogger(__name__)


BASE_API_URL = "http://api:4000"

# Function to fetch data from API
def fetch_data(endpoint):
    """Fetch data from API and handle errors."""
    try:
        response = requests.get(f"{BASE_API_URL}{endpoint}")
        logging.info(f"Fetching data from {BASE_API_URL}/{endpoint}")
        response.raise_for_status()
        return response.json()
    except requests.RequestException as e:
        st.error(f"Error fetching data from {endpoint}: {e}")
        return []

#----------------- Companies -----------------#

def get_all_companies():
    return fetch_data('/j/companies')

#----------------- Job Listings -----------------#

def get_all_job_listings():
    return fetch_data('/j/job_listings')

def get_job_listing_by_id(job_listing_id):
    return fetch_data(f'/j/job_listing/{job_listing_id}')

def get_job_listings_by_company(company_id):
    return fetch_data(f'/j/job_listings/company/{company_id}')


#----------------- Reviews -----------------#

def get_all_reviews():
    return fetch_data('/r/reviews')
    
def get_reviews_for_job_listing(job_listing_id):
    return fetch_data(f'/r/reviews/{job_listing_id}')

def get_reviews_by_student(student_id):
    return fetch_data(f'/r/reviews/student/{student_id}')