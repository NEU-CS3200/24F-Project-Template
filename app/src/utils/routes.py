import requests

#----------------- Companies -----------------#

def get_all_companies():
    try:
        companies = requests.get('http://api:4000/j/companies').json()
        return companies
    except:
        return None


#----------------- Job Listings -----------------#

def get_all_job_listings():
    try:
        job_listings = requests.get('http://api:4000/j/job_listings').json()
        return job_listings
    except:
        return None

def get_job_listing_by_id(job_listing_id):
    try:
        job_listing = requests.get(f'http://api:4000/j/job_listing/{job_listing_id}').json()
        return job_listing
    except:
        return None

def get_job_listings_by_company(company_id):
    try:
        job_listings = requests.get(f'http://api:4000/j/job_listings/company/{company_id}').json()
        return job_listings
    except:
        return None


#----------------- Reviews -----------------#

def get_all_reviews():
    try:
        reviews = requests.get('http://api:4000/r/reviews').json()
        return reviews
    except:
        return None
    
def get_reviews_for_job_listing(job_listing_id):
    try:
        reviews = requests.get(f'http://api:4000/r/reviews/{job_listing_id}').json()
        return reviews
    except:
        return None

def get_reviews_by_student(student_id):
    try:
        reviews = requests.get(f'http://api:4000/r/reviews/student/{student_id}').json()
        return reviews
    except:
        return None