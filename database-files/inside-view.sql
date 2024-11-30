CREATE DATABASE insideView;

USE insideView;

CREATE TABLE IF NOT EXISTS colleges (
    id int AUTO_INCREMENT,
    name varchar(75),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS advisors (
    id int AUTO_INCREMENT,
    collegeId int NOT NULL,
    firstName varchar(50),
    middleName varchar(50),
    lastName varchar(50),
    phone varchar(15) UNIQUE,
    email varchar(75) UNIQUE,
    PRIMARY KEY (id),
    CONSTRAINT FOREIGN KEY (collegeId) REFERENCES colleges (id)
            ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS students (
    id int AUTO_INCREMENT,
    firstName varchar(50),
    middleName varchar(50),
    lastName varchar(50),
    phone varchar(15) UNIQUE,
    email varchar(75) UNIQUE,
    dateOfBirth date,
    gpa float,
    gradYear int,
    years_exp int,
    advisorId int NOT NULL,
    collegeId int NOT NULL,
    resume text,
    PRIMARY KEY (id),
    CONSTRAINT FOREIGN KEY (advisorId) REFERENCES advisors (id)
            ON UPDATE cascade ON DELETE restrict,
    CONSTRAINT FOREIGN KEY (collegeId) REFERENCES colleges (id)
            ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS skills (
    id int AUTO_INCREMENT,
    skillName varchar(50),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS student_skills (
    studentId int NOT NULL,
    skillId int NOT NULL,
    CONSTRAINT FOREIGN KEY (studentId) REFERENCES students (id)
            ON UPDATE cascade ON DELETE restrict,
    CONSTRAINT FOREIGN KEY (skillId) REFERENCES skills (id)
            ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS courses (
    id int AUTO_INCREMENT,
    title varchar(75),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS student_courses (
    studentId int NOT NULL,
    courseId int NOT NULL,
    CONSTRAINT FOREIGN KEY (studentId) REFERENCES students (id)
            ON UPDATE cascade ON DELETE restrict,
    CONSTRAINT FOREIGN KEY (courseId) REFERENCES courses (id)
            ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS degrees (
    id int AUTO_INCREMENT,
    name varchar(50),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS student_degrees (
    studentId int NOT NULL,
    degreeId int NOT NULL,
    CONSTRAINT FOREIGN KEY (studentId) REFERENCES students (id)
            ON UPDATE cascade ON DELETE restrict,
    CONSTRAINT FOREIGN KEY (degreeId) REFERENCES degrees (id)
            ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS companies (
    id int AUTO_INCREMENT,
    name varchar(75),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS common_questions (
    id INT AUTO_INCREMENT,
    commonQuestion TEXT,
    company_id INT,
    PRIMARY KEY (id, company_id),
    CONSTRAINT FOREIGN KEY (company_id) REFERENCES companies (id)
            ON UPDATE cascade ON DELETE cascade
);

CREATE TABLE IF NOT EXISTS company_contact (
    id int AUTO_INCREMENT,
    companyId int NOT NULL,
    firstName varchar(50),
    middleName varchar(50),
    lastName varchar(50),
    phone varchar(15) UNIQUE,
    email varchar(75) UNIQUE,
    dateOfBirth date,
    PRIMARY KEY (id),
    CONSTRAINT FOREIGN KEY (companyId) REFERENCES companies (id)
            ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS job_posting (
    id int AUTO_INCREMENT,
    companyId int NOT NULL,
    contactId int NOT NULL,
    name varchar(75),
    description text,
    location varchar(75),
    datePosted datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FOREIGN KEY (companyId) REFERENCES companies (id)
                  ON UPDATE cascade ON DELETE cascade,
    CONSTRAINT FOREIGN KEY (contactId) REFERENCES company_contact (id)
                 ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS job_degrees (
    jobId int NOT NULL,
    degreeId int NOT NULL,
    CONSTRAINT FOREIGN KEY (jobId) REFERENCES job_posting (id)
            ON UPDATE cascade ON DELETE cascade,
    CONSTRAINT FOREIGN KEY (degreeId) REFERENCES degrees (id)
            ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS reviews (
    id int AUTO_INCREMENT,
    content text,
    title varchar(75),
    rating int,
    datePosted datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
    studentId int NOT NULL,
    jobId int NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FOREIGN KEY (studentId) REFERENCES students (id)
            ON UPDATE cascade ON DELETE restrict,
    CONSTRAINT FOREIGN KEY (jobId) REFERENCES job_posting (id)
            ON UPDATE cascade ON DELETE cascade
);

CREATE TABLE IF NOT EXISTS review_courses (
    reviewId int NOT NULL,
    courseId int NOT NULL,
    CONSTRAINT FOREIGN KEY (reviewId) REFERENCES reviews (id)
            ON UPDATE cascade ON DELETE cascade,
    CONSTRAINT FOREIGN KEY (courseId) REFERENCES courses (id)
            ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS job_application (
    jobId int NOT NULL,
    studentId int NOT NULL,
    CONSTRAINT FOREIGN KEY (jobId) REFERENCES job_posting (id)
            ON UPDATE cascade ON DELETE cascade,
    CONSTRAINT FOREIGN KEY (studentId) REFERENCES students (id)
            ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS announcements (
    id int AUTO_INCREMENT,
    authorId int NOT NULL,
    title varchar(75),
    content text,
    PRIMARY KEY (id),
    CONSTRAINT FOREIGN KEY (authorId) REFERENCES advisors (id)
           ON UPDATE cascade ON DELETE cascade
);

CREATE TABLE IF NOT EXISTS announcement_degrees (
    announcementId int NOT NULL,
    degreeId int NOT NULL,
    CONSTRAINT FOREIGN KEY (announcementId) REFERENCES announcements (id)
            ON UPDATE cascade ON DELETE cascade,
    CONSTRAINT FOREIGN KEY (degreeId) REFERENCES degrees (id)
            ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS system_admins (
    id int AUTO_INCREMENT,
    firstName varchar(50),
    middleName varchar(50),
    lastName varchar(50),
    phone varchar(15) UNIQUE,
    email varchar(75) UNIQUE,
    PRIMARY KEY (id)
);

INSERT INTO colleges (name)
    VALUES ('Northeastern University'), ('Stanford University'), ('Boston College');

INSERT INTO advisors (collegeId, firstName, middleName, lastName, phone, email)
    VALUES (1, 'Jim', 'Michael', 'Smith', '(255) 982-6391',
            'jsmith@gmail.com'),
           (2, 'Edwin', 'Jason', 'Dickerson', '(378) 308-8040',
            'edickerson64@gmail.com'),
           (3, 'Gabriel', 'Kingston','Payne', '(590) 786-8219',
            'gpayne02@gmail.com');

INSERT INTO students (firstName, middleName, lastName, phone, email, dateOfBirth, gpa, gradYear, years_exp, advisorId,
                      collegeId, resume)
    VALUES ('Floyd', 'Jonathan', 'Wilkinson','(255) 982-6391',
            'fwilkinson14@gmail.com', '2002-12-19', 3.8, 2025, 2, 1,
            1, 'sample resume 1'),
           ('Helen', 'Lily','Sims', '(882) 666-1060','hsims94@gmail.com',
            '2004-01-23', 3.9, 2026, 1, 2, 2,
            'sample resume 2'),
           ('John', 'Jonah', 'Jones', '(123) 546-7890', 'jojojo@gmail.com',
            '2005-02-02', 3.6, 2027, 0, 3, 3,
            'sample resume 3');

INSERT INTO skills (skillName)
    VALUES ('JavaScript'), ('React'), ('SQL');

INSERT INTO student_skills (studentId, skillId)
    VALUES (1, 1), (2, 2), (3, 3);

INSERT INTO courses (title)
    VALUES ('Introduction to Databases'), ('Object-Oriented Design'), ('Foundations of Data Science');

INSERT INTO student_courses (studentId, courseId)
    VALUES (1, 1), (2, 2), (3, 3);

INSERT INTO degrees (name)
    VALUES ('Computer Science'), ('Data Science'), ('Cybersecurity');

INSERT INTO student_degrees (studentId, degreeId)
    VALUES (1, 1), (2, 2), (3, 3);

INSERT INTO companies (name)
    VALUES ('Google'), ('Apple'), ('Facebook');

INSERT INTO common_questions (commonQuestion, company_id)
    VALUES ('Tell us about your experiences', 1),
           ('How would you design this basic application?', 2),
           ('A problem arises in the workplace, how do you fix it?', 3);

INSERT INTO company_contact (companyId, firstName, middleName, lastName, phone, email, dateOfBirth)
    VALUES (1, 'Jack', 'William', 'Daniels', '(321) 654-0987',
            'jackdaniels@gmail.com', '1987-12-24'),
           (2, 'Sam', 'Nat', 'Adams', '(231) 645-8690',
            'samadams@gmail.com', '1989-01-01'),
           (3, 'Daniel', 'Ferdinand', 'Lane', '(235) 234-9874',
            'daniellane@gmail.com', '1995-05-17');

INSERT INTO job_posting (companyId, contactId, name, description, location)
    VALUES (1, 1, 'Software Engineer', 'description 1',
            'Mountain View, CA'),
           (2, 2, 'Data Scientist', 'description 2', 'Cupertino, CA'),
           (3, 3, 'IT Support Specialist', 'description 3',
            'Menlo Park, CA');

INSERT INTO job_degrees (jobId, degreeId)
    VALUES (1, 1), (2, 2), (3, 3);

INSERT INTO reviews (content, title, rating, studentId, jobId)
    VALUES ('review content 1', 'Google review', 4, 1, 1),
           ('review content 2', 'Apple review', 5, 2, 2),
           ('review content 3', 'Facebook review', 3, 3, 3);

INSERT INTO review_courses (reviewId, courseId)
    VALUES (1, 1), (2, 2), (3, 3);

INSERT INTO job_application (jobId, studentId)
    VALUES (2, 1), (3, 2), (1, 3);

INSERT INTO announcements (authorId, title, content)
    VALUES (1, 'announcement 1', 'the first announcement'),
           (2, 'announcement 2', 'the second announcement'),
           (3, 'announcement 3', 'the third announcement');

INSERT INTO announcement_degrees (announcementId, degreeId)
    VALUES (1, 1), (2, 2), (3, 3);

INSERT INTO system_admins (firstName, middleName, lastName, phone, email)
    VALUES ('Bob', 'Bill', 'Dee', '(432) 235-4368', 'bobdee@gmail.com'),
           ('Fred', 'Chip', 'Thatcher', '(368) 983-2386',
            'fredthatcher@gmail.com'),
           ('Jack', 'Brady', 'White', '(869) 347-2397',
            'jackwhite@gmail.com');