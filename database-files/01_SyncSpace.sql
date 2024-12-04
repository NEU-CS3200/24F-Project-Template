-- Drop and create the database
DROP DATABASE IF EXISTS SyncSpace;
CREATE DATABASE IF NOT EXISTS SyncSpace;

USE SyncSpace;

-- Create table for City Community
DROP TABLE IF EXISTS CityCommunity;
CREATE TABLE IF NOT EXISTS CityCommunity (
    CommunityID INT AUTO_INCREMENT PRIMARY KEY,
    Location VARCHAR(100)
);

-- Create table for Housing
DROP TABLE IF EXISTS Housing;
CREATE TABLE IF NOT EXISTS Housing (
    HousingID INT AUTO_INCREMENT PRIMARY KEY,
    Availability VARCHAR(50),
    Style VARCHAR(50),
    CommunityID INT,
    FOREIGN KEY (CommunityID) REFERENCES CityCommunity(CommunityID)
);

-- Create table for User
DROP TABLE IF EXISTS User;
CREATE TABLE IF NOT EXISTS User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Role VARCHAR(50),
    PermissionsLevel VARCHAR(50)
);

-- Create table for Ticket (needed before SystemHealth and SystemLog)
DROP TABLE IF EXISTS Ticket;
CREATE TABLE IF NOT EXISTS Ticket (
    TicketID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    IssueType VARCHAR(50),
    Status VARCHAR(50),
    Priority VARCHAR(50),
    ReceivedDate DATE,
    ResolvedDate DATE,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create table for Student
DROP TABLE IF EXISTS Student;
CREATE TABLE IF NOT EXISTS Student (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Major VARCHAR(100),
    Company VARCHAR(100),
    Location VARCHAR(100),
    HousingStatus VARCHAR(50),
    CarpoolStatus VARCHAR(50),
    Budget DECIMAL(10, 2),
    LeaseDuration VARCHAR(50),
    Cleanliness INT,
    Lifestyle VARCHAR(50),
    CommuteTime INT,
    CommuteDays INT,
    Bio TEXT,
    CommunityID INT,
    AdvisorID INT,
    Reminder INT,
    FOREIGN KEY (CommunityID) REFERENCES CityCommunity(CommunityID)
);




DROP TABLE IF EXISTS Events;
CREATE TABLE IF NOT EXISTS Events (
    EventID INT AUTO_INCREMENT PRIMARY KEY,
    CommunityID INT,
    Date DATE,
    Name VARCHAR(100),
    Description TEXT,
    FOREIGN KEY (CommunityID) REFERENCES CityCommunity(CommunityID)
);


-- Create table for Advisor
DROP TABLE IF EXISTS Advisor;
CREATE TABLE IF NOT EXISTS Advisor (
    AdvisorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Department VARCHAR(100),
    StudentID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

-- Create table for Feedback
DROP TABLE IF EXISTS Feedback;
CREATE TABLE IF NOT EXISTS Feedback (
    FeedbackID INT AUTO_INCREMENT PRIMARY KEY,
    Description TEXT,
    Date DATE,
    ProgressRating INT,
    StudentID INT,
    AdvisorID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

-- Add foreign key to Feedback for Advisor after Advisor is created
ALTER TABLE Feedback
ADD FOREIGN KEY (AdvisorID) REFERENCES Advisor(AdvisorID);
-- Add foreign key to Student for Advisor after Advisor is created

ALTER TABLE Student
ADD FOREIGN KEY (AdvisorID) REFERENCES Advisor(AdvisorID);

-- Create table for Task
DROP TABLE IF EXISTS Task;
CREATE TABLE IF NOT EXISTS Task (
    TaskID INT AUTO_INCREMENT PRIMARY KEY,
    Description TEXT,
    Reminder DATE,
    AssignedTo INT,
    DueDate DATE,
    Status VARCHAR(50),
    AdvisorID INT,
    FOREIGN KEY (AssignedTo) REFERENCES Student(StudentID),
    FOREIGN KEY (AdvisorID) REFERENCES Advisor(AdvisorID) ON DELETE CASCADE

);

CREATE TABLE AdvisorStudent (
    AdvisorID INT,
    StudentID INT,
    PRIMARY KEY (AdvisorID, StudentID),
    FOREIGN KEY (AdvisorID) REFERENCES Advisor(AdvisorID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);


-- Create table for System Log
DROP TABLE IF EXISTS SystemLog;
CREATE TABLE IF NOT EXISTS SystemLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    TicketID INT,
    Timestamp DATETIME,
    Activity TEXT,
    MetricType VARCHAR(50),
    Privacy VARCHAR(50),
    Security VARCHAR(50),
    FOREIGN KEY (TicketID) REFERENCES Ticket(TicketID)
);

-- Create table for System Health
DROP TABLE IF EXISTS SystemHealth;
CREATE TABLE IF NOT EXISTS SystemHealth (
    SystemHealthID INT AUTO_INCREMENT PRIMARY KEY,
    LogID INT,
    Timestamp DATETIME,
    Status VARCHAR(50),
    MetricType VARCHAR(50),
    FOREIGN KEY (LogID) REFERENCES SystemLog(LogID)
);

-- NOTE - need to add in data for our personas
-- 1.4 
UPDATE Ticket
SET Priority = 'Critical'
WHERE TicketID = 1;

-- 2.5 
UPDATE Task
SET Status = 'Completed'
WHERE TaskID = 5;

-- 3.2 


-- 4.3 
<<<<<<< HEAD:database-files/SyncSpace.sql
INSERT INTO Housing (Style, Availability, Location)
VALUES ('Apartment', 'Available', 'New York City');
=======
INSERT INTO Housing (Style, Availability)
VALUES ('Apartment', 'Available');


<<<<<<< HEAD
=======


>>>>>>> b7b4fa75cccf25a91b785f0a2f7cfce53b1a8555:database-files/01_SyncSpace.sql

>>>>>>> 1eed14d6d3f5a36b845857ec00d885b4e4efb85a
