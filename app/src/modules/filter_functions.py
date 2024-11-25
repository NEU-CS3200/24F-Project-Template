
def filter_job_listings(job_listings, text_input):
    if text_input:
        filtered_job_listings = []
        for job in job_listings:
            if text_input.lower() in job['Job Title'].lower() or text_input.lower() in job['Company'].lower():
                filtered_job_listings.append(job)
        return filtered_job_listings
    return job_listings


def filter_companies(companies, text_input):
    if text_input:
        filtered_companies = []
        for company in companies:
            if text_input.lower() in company['Name'].lower():
                filtered_companies.append(company)
        return filtered_companies
    return companies