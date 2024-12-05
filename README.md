# Fall 2024 CS 3200 SyncSpace Repository

# Welcome to our guidebook for everything and anything SyncSpace! 
This guidebook is inclusive of the details of our project and all the information you need to build/start the containers. We hope you enjoy exploring!

By Team Fontenators: Christine Ahn, Praytusha Chamarthi, Mika Nguyen, Yugeun Park, Xavier Yu

## About SyncSpace (UPDATE TO FIT OUR MOST UDPATED MODEL)
Our app SyncSpace is a data-driven virtual community that aims to connect students going on co-ops and internships, helping them make the most of their experience. Students often feel isolated or overwhelmed when relocating for work, facing the challenges of finding housing, arranging transportation, and locating familiar faces nearby. SyncSpace solves this by using curated feedback, data, and shared interests/community forums to match students with ‘co-op buddies’ in their area, helping them form connections, navigate new cities, and share resources for housing and commuting. 

Designed for students and co-op advisors, SyncSpace offers real-time data insights that help students connect with each other and thrive professionally. With curated interest-based groups, housing and transportation forums, and a hub for professional events, students can access networking, guidance, and new friendships anytime they need it. Co-op advisors and system admin staff can effortlessly organize and track engagement, while gaining valuable data on student satisfaction, activity trends, and engagement levels. By building a vibrant, supportive community, we hope to empower students to make meaningful connections and maximize their co-op and internship experiences. 

## Prerequisites

- A GitHub Account
- A terminal-based or GUI git client
- VSCode with the Python Plugin
- A distrobution of Python running on your laptop (Choco (for Windows), brew (for Macs), miniconda, Anaconda, etc). 

## Current Project Components

Currently, there are three major components which will each run in their own Docker Containers:

- Streamlit App in the `./app` directory
- Flask REST api in the `./api` directory
- SQL files for your data model and data base in the `./database-files` directory


### Setting Up Your Personal Repo

1. In GitHub, click the **fork** button in the upper right corner of the repo screen. 
1. When prompted, give the new repo a unique name, perhaps including your last name and the word 'personal'. 
1. Once the fork has been created, clone YOUR forked version of the repo to your computer. 
1. Set up the `.env` file in the `api` folder based on the `.env.template` file.
1. Start the docker containers. 

## Controlling the Containers

- `docker compose up -d` to start all the containers in the background
- `docker compose down` to shutdown and delete the containers
- `docker compose up db -d` only start the database container (replace db with the other services as needed)
- `docker compose stop` to "turn off" the containers but not delete them. 









 
