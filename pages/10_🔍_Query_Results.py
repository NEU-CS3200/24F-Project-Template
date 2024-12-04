import streamlit as st
import mysql.connector
from mysql.connector import Error

def create_connection():
    try:
        connection = mysql.connector.connect(
            host="db",
            user="root",
            password="password123",
            database="SyncSpace"
        )
        return connection
    except Error as e:
        st.error(f"Error connecting to MySQL: {e}")
        return None

def main():
    st.title("Student Data")
    
    # Create connection
    connection = create_connection()
    if connection is not None:
        try:
            cursor = connection.cursor()
            
            # Execute query to get student data
            query = """
            SELECT Name, Major, Location, HousingStatus, Budget, Lifestyle 
            FROM Student
            """
            cursor.execute(query)
            results = cursor.fetchall()
            
            # Display results in a table
            if results:
                st.dataframe(
                    data=results,
                    columns=["Name", "Major", "Location", "Housing Status", "Budget", "Lifestyle"]
                )
            else:
                st.info("No student records found.")
                
        except Error as e:
            st.error(f"Error executing query: {e}")
        finally:
            cursor.close()
            connection.close()

if __name__ == "__main__":
    main()