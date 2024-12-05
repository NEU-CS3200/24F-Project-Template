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
            ON UPDATE cascade ON DELETE CASCADE
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
            ON UPDATE cascade ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (collegeId) REFERENCES colleges (id)
            ON UPDATE cascade ON DELETE CASCADE
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
            ON UPDATE cascade ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (skillId) REFERENCES skills (id)
            ON UPDATE cascade ON DELETE CASCADE
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
            ON UPDATE cascade ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (courseId) REFERENCES courses (id)
            ON UPDATE cascade ON DELETE CASCADE
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
            ON UPDATE cascade ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (degreeId) REFERENCES degrees (id)
            ON UPDATE cascade ON DELETE CASCADE
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
            ON UPDATE cascade ON DELETE CASCADE
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
                 ON UPDATE cascade ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS job_degrees (
    jobId int NOT NULL,
    degreeId int NOT NULL,
    CONSTRAINT FOREIGN KEY (jobId) REFERENCES job_posting (id)
            ON UPDATE cascade ON DELETE cascade,
    CONSTRAINT FOREIGN KEY (degreeId) REFERENCES degrees (id)
            ON UPDATE cascade ON DELETE CASCADE
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
            ON UPDATE cascade ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (jobId) REFERENCES job_posting (id)
            ON UPDATE cascade ON DELETE cascade
);

CREATE TABLE IF NOT EXISTS review_courses (
    reviewId int NOT NULL,
    courseId int NOT NULL,
    CONSTRAINT FOREIGN KEY (reviewId) REFERENCES reviews (id)
            ON UPDATE cascade ON DELETE cascade,
    CONSTRAINT FOREIGN KEY (courseId) REFERENCES courses (id)
            ON UPDATE cascade ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS job_application (
    jobId int NOT NULL,
    studentId int NOT NULL,
    CONSTRAINT FOREIGN KEY (jobId) REFERENCES job_posting (id)
            ON UPDATE cascade ON DELETE cascade,
    CONSTRAINT FOREIGN KEY (studentId) REFERENCES students (id)
            ON UPDATE cascade ON DELETE CASCADE
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
            ON UPDATE cascade ON DELETE CASCADE
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

CREATE TABLE IF NOT EXISTS job_views ( 
    id INT AUTO_INCREMENT, 
    jobId INT NOT NULL, 
    viewDate DATETIME DEFAULT CURRENT_TIMESTAMP, 
    PRIMARY KEY (id), 
    CONSTRAINT FOREIGN KEY (jobId) REFERENCES job_posting (id) 
    ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO colleges (name)
    VALUES
    ('Northeastern University'),
    ('Stanford University'),
    ('Boston College'),
    ('Harvard University'),
    ('Massachusetts Institute of Technology'),
    ('University of California, Berkeley'),
    ('California Institute of Technology'),
    ('Princeton University'),
    ('University of Chicago'),
    ('Columbia University'),
    ('Duke University'),
    ('Yale University'),
    ('University of Pennsylvania'),
    ('Cornell University'),
    ('University of Michigan'),
    ('University of California, Los Angeles'),
    ('University of Southern California'),
    ('Carnegie Mellon University'),
    ('New York University'),
    ('University of Texas at Austin'),
    ('University of Washington'),
    ('Georgia Institute of Technology'),
    ('University of Illinois Urbana-Champaign'),
    ('University of Wisconsin-Madison'),
    ('Brown University'),
    ('Dartmouth College'),
    ('University of North Carolina at Chapel Hill'),
    ('University of Florida'),
    ('Purdue University'),
    ('University of Virginia');

INSERT INTO advisors (collegeId, firstName, middleName, lastName, phone, email)
    VALUES
    (1, 'Jim', 'Michael', 'Smith', '(255) 982-6391', 'jsmith@gmail.com'),
    (2, 'Edwin', 'Jason', 'Dickerson', '(378) 308-8040', 'edickerson64@gmail.com'),
    (3, 'Gabriel', 'Kingston', 'Payne', '(590) 786-8219', 'gpayne02@gmail.com'),
    (4, 'Sophia', 'Grace', 'Johnson', '(490) 981-6374', 'sjohnson45@gmail.com'),
    (5, 'Olivia', 'Marie', 'Anderson', '(203) 472-8239', 'oanderson33@gmail.com'),
    (6, 'Liam', 'James', 'Brown', '(512) 734-1278', 'lbrown54@gmail.com'),
    (7, 'Emma', 'Rose', 'Miller', '(382) 672-1104', 'emiller77@gmail.com'),
    (8, 'Noah', 'Alexander', 'Davis', '(298) 641-2789', 'ndavis90@gmail.com'),
    (9, 'Ava', 'Elizabeth', 'Wilson', '(419) 560-3842', 'awilson12@gmail.com'),
    (10, 'Elijah', 'Daniel', 'Moore', '(517) 283-9021', 'emoore21@gmail.com'),
    (11, 'Isabella', 'Grace', 'Taylor', '(607) 781-3845', 'itaylor34@gmail.com'),
    (12, 'Oliver', 'Benjamin', 'Clark', '(325) 490-2984', 'oclark56@gmail.com'),
    (13, 'Charlotte', 'Amelia', 'White', '(389) 231-4578', 'cwhite78@gmail.com'),
    (14, 'William', 'Henry', 'Harris', '(493) 732-1194', 'wharris81@gmail.com'),
    (15, 'Mia', 'Victoria', 'Martinez', '(204) 482-7389', 'mmartinez44@gmail.com'),
    (16, 'James', 'Edward', 'Garcia', '(295) 650-9127', 'jgarcia67@gmail.com'),
    (17, 'Harper', 'Sophia', 'Lewis', '(310) 543-2198', 'hlewis98@gmail.com'),
    (18, 'Benjamin', 'Isaac', 'Walker', '(390) 761-3458', 'bwalker32@gmail.com'),
    (19, 'Evelyn', 'Lily', 'Hall', '(506) 812-3946', 'ehall87@gmail.com'),
    (20, 'Lucas', 'Nathaniel', 'Allen', '(608) 921-3098', 'lallen13@gmail.com'),
    (21, 'Amelia', 'Ruth', 'Young', '(715) 873-2987', 'ayoung45@gmail.com'),
    (22, 'Mason', 'David', 'King', '(210) 384-9176', 'mking72@gmail.com'),
    (23, 'Ella', 'Rose', 'Wright', '(328) 740-2165', 'ewright34@gmail.com'),
    (24, 'Logan', 'Samuel', 'Scott', '(408) 621-3945', 'lscott29@gmail.com'),
    (25, 'Aria', 'Grace', 'Green', '(509) 673-2891', 'agreen65@gmail.com'),
    (26, 'Ethan', 'Lucas', 'Adams', '(601) 231-4867', 'eadams40@gmail.com'),
    (27, 'Abigail', 'Lillian', 'Nelson', '(702) 892-7345', 'anelson38@gmail.com'),
    (28, 'Henry', 'Sebastian', 'Mitchell', '(804) 345-8912', 'hmitchell19@gmail.com'),
    (29, 'Emily', 'Claire', 'Perez', '(912) 574-2187', 'eperez61@gmail.com'),
    (30, 'Alexander', 'Levi', 'Roberts', '(305) 681-3927', 'aroberts82@gmail.com');

INSERT INTO students (firstName, middleName, lastName, phone, email, dateOfBirth, gpa, gradYear, years_exp, advisorId, collegeId, resume)
    VALUES
    ('Floyd', 'Jonathan', 'Wilkinson', '(255) 982-6391', 'fwilkinson14@gmail.com', '2002-12-19', 3.8, 2025, 2, 1, 1, 'sample resume 1'),
    ('Helen', 'Lily', 'Sims', '(882) 666-1060', 'hsims94@gmail.com', '2004-01-23', 3.9, 2026, 1, 2, 2, 'sample resume 2'),
    ('John', 'Jonah', 'Jones', '(123) 546-7890', 'jojojo@gmail.com', '2005-02-02', 3.6, 2027, 0, 3, 3, 'sample resume 3'),
    ('Guest', 'GuestMN', 'GuestLN', '(123) 456-7890', 'guest@user.com', '2004-01-06', 3.8, 2026, 1, 2, 2, 'sample resume guest'),
    ('Emma', 'Rose', 'Parker', '(321) 123-4567', 'eparker@gmail.com', '2003-11-15', 3.7, 2025, 1, 10, 4, 'sample resume 4'),
    ('Liam', 'James', 'Clark', '(453) 782-3945', 'lclark@gmail.com', '2004-04-20', 3.5, 2026, 1, 15, 5, 'sample resume 5'),
    ('Olivia', 'Marie', 'Evans', '(567) 294-1238', 'oevans@gmail.com', '2005-08-09', 3.9, 2027, 0, 18, 6, 'sample resume 6'),
    ('Sophia', 'Grace', 'Hughes', '(604) 729-3284', 'shughes@gmail.com', '2003-06-12', 3.8, 2025, 2, 7, 7, 'sample resume 7'),
    ('Noah', 'Alexander', 'Reed', '(712) 834-9374', 'nreed@gmail.com', '2002-10-25', 3.4, 2024, 3, 14, 8, 'sample resume 8'),
    ('Ava', 'Elizabeth', 'Bennett', '(890) 192-7384', 'abennett@gmail.com', '2005-03-14', 3.6, 2027, 0, 21, 9, 'sample resume 9'),
    ('James', 'Edward', 'Garcia', '(320) 598-7893', 'jgarcia@gmail.com', '2003-01-12', 3.7, 2025, 1, 8, 10, 'sample resume 10'),
    ('Charlotte', 'Amelia', 'Gray', '(203) 789-4125', 'cgray@gmail.com', '2004-09-16', 3.8, 2026, 1, 6, 11, 'sample resume 11'),
    ('Benjamin', 'Isaac', 'Ward', '(452) 923-7145', 'bward@gmail.com', '2005-05-22', 3.5, 2027, 0, 11, 12, 'sample resume 12'),
    ('Harper', 'Sophia', 'Coleman', '(509) 847-3157', 'hcoleman@gmail.com', '2003-07-30', 3.9, 2025, 2, 16, 13, 'sample resume 13'),
    ('Evelyn', 'Lily', 'Morgan', '(389) 194-3921', 'emorgan@gmail.com', '2002-12-10', 3.4, 2024, 3, 22, 14, 'sample resume 14'),
    ('Lucas', 'Nathaniel', 'Foster', '(517) 283-8721', 'lfoster@gmail.com', '2004-08-03', 3.6, 2026, 1, 9, 15, 'sample resume 15'),
    ('Mason', 'David', 'Wright', '(612) 812-3845', 'mwright@gmail.com', '2005-02-28', 3.7, 2027, 0, 25, 16, 'sample resume 16'),
    ('Ella', 'Rose', 'Cooper', '(503) 192-8476', 'ecooper@gmail.com', '2003-11-14', 3.9, 2025, 2, 13, 17, 'sample resume 17'),
    ('Logan', 'Samuel', 'Perry', '(617) 394-7182', 'lperry@gmail.com', '2004-03-19', 3.8, 2026, 1, 29, 18, 'sample resume 18'),
    ('Emily', 'Claire', 'Myers', '(720) 934-1827', 'emyers@gmail.com', '2002-07-05', 3.5, 2024, 3, 4, 19, 'sample resume 19'),
    ('Aria', 'Grace', 'Howard', '(203) 982-7193', 'ahoward@gmail.com', '2005-06-18', 3.7, 2027, 0, 12, 20, 'sample resume 20'),
    ('Henry', 'Sebastian', 'Mitchell', '(407) 812-3948', 'hmitchell@gmail.com', '2003-05-09', 3.8, 2025, 1, 19, 21, 'sample resume 21'),
    ('Abigail', 'Lillian', 'Jordan', '(501) 394-1287', 'ajordan@gmail.com', '2004-11-24', 3.9, 2026, 1, 30, 22, 'sample resume 22'),
    ('Alexander', 'Levi', 'Carter', '(602) 312-8497', 'acarter@gmail.com', '2005-10-21', 3.6, 2027, 0, 23, 23, 'sample resume 23'),
    ('Oliver', 'Benjamin', 'Parker', '(303) 621-9382', 'oparker@gmail.com', '2003-04-11', 3.7, 2025, 2, 20, 24, 'sample resume 24'),
    ('Mia', 'Victoria', 'Bailey', '(401) 598-2348', 'mbailey@gmail.com', '2004-09-14', 3.9, 2026, 1, 5, 25, 'sample resume 25'),
    ('Isabella', 'Grace', 'Peterson', '(609) 394-8123', 'ipeterson@gmail.com', '2005-07-08', 3.8, 2027, 0, 17, 26, 'sample resume 26'),
    ('William', 'Henry', 'Sanders', '(205) 789-3942', 'wsanders@gmail.com', '2002-03-28', 3.5, 2024, 3, 28, 27, 'sample resume 27'),
    ('Amelia', 'Ruth', 'Baker', '(708) 412-9381', 'abaker@gmail.com', '2003-01-17', 3.6, 2025, 1, 24, 28, 'sample resume 28'),
    ('Ethan', 'Lucas', 'Bryant', '(501) 672-3984', 'ebryant@gmail.com', '2004-12-01', 3.7, 2026, 1, 27, 29, 'sample resume 29'),
    ('Charlotte', 'Amelia', 'Fisher', '(605) 234-8731', 'cfisher@gmail.com', '2005-11-20', 3.9, 2027, 0, 26, 30, 'sample resume 30');

INSERT INTO skills (skillName)
    VALUES
    ('JavaScript'),
    ('React'),
    ('SQL'),
    ('Python'),
    ('Java'),
    ('C++'),
    ('HTML'),
    ('CSS'),
    ('Node.js'),
    ('MongoDB'),
    ('PostgreSQL'),
    ('TypeScript'),
    ('Angular'),
    ('Vue.js'),
    ('Swift'),
    ('Kotlin'),
    ('PHP'),
    ('Ruby'),
    ('Go'),
    ('Django'),
    ('Flask'),
    ('Spring Boot'),
    ('Express.js'),
    ('GraphQL'),
    ('AWS'),
    ('Azure'),
    ('Docker'),
    ('Kubernetes'),
    ('Machine Learning'),
    ('Data Analysis');

INSERT INTO student_skills (studentId, skillId)
    VALUES
    (1, 5), (2, 15), (3, 9), (4, 1), (5, 20),
    (6, 14), (7, 18), (8, 3), (9, 22), (10, 7),
    (11, 2), (12, 25), (13, 11), (14, 6), (15, 19),
    (16, 10), (17, 21), (18, 12), (19, 30), (20, 4),
    (21, 8), (22, 28), (23, 13), (24, 17), (25, 26),
    (26, 24), (27, 29), (28, 16), (29, 27), (30, 23),
    (1, 12), (2, 8), (3, 19), (4, 26), (5, 9),
    (6, 22), (7, 30), (8, 5), (9, 16), (10, 3);

INSERT INTO courses (title)
    VALUES
    ('CS1100'),
    ('CS1200'),
    ('CS1800'),
    ('CS2500'),
    ('CS2510'),
    ('CS2800'),
    ('CS3000'),
    ('CS3200'),
    ('CS3500'),
    ('CS3540'),
    ('CS3600'),
    ('CS3650'),
    ('CS3700'),
    ('CS3800'),
    ('CS4100'),
    ('CS4120'),
    ('CS4150'),
    ('CS4300'),
    ('CS4500'),
    ('CS4520'),
    ('CS4610'),
    ('CS4700'),
    ('CS4740'),
    ('CS4800'),
    ('CS5004'),
    ('CS5200'),
    ('CS5520'),
    ('CS5610'),
    ('CS5800'),
    ('CS6150');

INSERT INTO student_courses (studentId, courseId)
    VALUES
    (1, 5), (2, 10), (3, 15), (4, 20), (5, 25),
    (6, 30), (7, 2), (8, 8), (9, 14), (10, 22),
    (11, 3), (12, 7), (13, 19), (14, 12), (15, 26),
    (16, 4), (17, 1), (18, 11), (19, 28), (20, 6),
    (21, 9), (22, 23), (23, 18), (24, 17), (25, 13),
    (26, 27), (27, 20), (28, 21), (29, 29), (30, 24),
    (1, 16), (2, 19), (3, 13), (4, 8), (5, 12),
    (6, 18), (7, 3), (8, 5), (9, 15), (10, 9);

INSERT INTO degrees (name)
    VALUES
    ('Computer Science'),
    ('Data Science'),
    ('Cybersecurity'),
    ('Software Engineering'),
    ('Artificial Intelligence'),
    ('Information Technology'),
    ('Machine Learning'),
    ('Computer Systems Engineering'),
    ('Network Engineering'),
    ('Database Management'),
    ('Game Development'),
    ('Mobile App Development'),
    ('Web Development'),
    ('Cloud Computing'),
    ('Digital Forensics'),
    ('Business Analytics'),
    ('Bioinformatics'),
    ('Human-Computer Interaction'),
    ('Robotics'),
    ('Embedded Systems'),
    ('Big Data Analytics'),
    ('Health Informatics'),
    ('Internet of Things'),
    ('Blockchain Technology'),
    ('Virtual Reality'),
    ('Augmented Reality'),
    ('Quantum Computing'),
    ('Data Engineering'),
    ('Software Development'),
    ('DevOps Engineering');

INSERT INTO student_degrees (studentId, degreeId)
    VALUES
    (1, 5), (2, 10), (3, 15), (4, 20), (5, 25),
    (6, 30), (7, 2), (8, 8), (9, 14), (10, 22),
    (11, 3), (12, 7), (13, 19), (14, 12), (15, 26),
    (16, 4), (17, 1), (18, 11), (19, 28), (20, 6),
    (21, 9), (22, 23), (23, 18), (24, 17), (25, 13),
    (26, 27), (27, 20), (28, 21), (29, 29), (30, 24),
    (1, 16), (2, 19), (3, 13), (4, 8), (5, 12),
    (6, 18), (7, 3), (8, 5), (9, 15), (10, 9);

INSERT INTO companies (name)
    VALUES
    ('Google'),
    ('Apple'),
    ('Facebook'),
    ('Microsoft'),
    ('Amazon'),
    ('Netflix'),
    ('Tesla'),
    ('IBM'),
    ('Intel'),
    ('Samsung'),
    ('Oracle'),
    ('Adobe'),
    ('Cisco'),
    ('NVIDIA'),
    ('Salesforce'),
    ('Zoom'),
    ('Spotify'),
    ('Twitter'),
    ('LinkedIn'),
    ('Snapchat'),
    ('Uber'),
    ('Lyft'),
    ('Pinterest'),
    ('Shopify'),
    ('Square'),
    ('Stripe'),
    ('PayPal'),
    ('Dell'),
    ('HP'),
    ('SpaceX');

INSERT INTO common_questions (commonQuestion, company_id)
    VALUES
    ('Tell us about your experiences', 1),
    ('How would you design this basic application?', 1),
    ('What motivates you to do your best at work?', 1),

    ('A problem arises in the workplace, how do you fix it?', 2),
    ('What is your greatest strength?', 2),

    ('Describe a challenging project you worked on.', 3),
    ('How do you approach debugging?', 3),
    ('Explain a time you worked with a team to solve a problem.', 3),

    ('What do you know about our company?', 4),
    ('Why are you interested in this role?', 4),

    ('What is your biggest weakness?', 5),
    ('How do you stay updated with the latest technologies?', 5),
    ('Describe a time you had to learn a new skill quickly.', 5),

    ('What is your favorite programming language and why?', 6),
    ('How would you improve our product/service?', 6),

    ('Tell us about a time you failed and what you learned.', 7),
    ('What motivates you to do your best at work?', 7),
    ('How do you handle tight deadlines?', 7),

    ('What makes you a good fit for our team?', 8),
    ('Can you explain a project you are particularly proud of?', 8),

    ('How do you handle feedback or criticism?', 9),
    ('What is your approach to writing clean, maintainable code?', 9),
    ('Tell us about a time you solved a difficult problem.', 9),

    ('How do you prioritize tasks in a project?', 10),
    ('Explain the importance of collaboration in a team.', 10),

    ('What unique skills or experiences can you bring to this role?', 11),
    ('Describe a situation where you went above and beyond.', 11),

    ('How would you test and deploy a software application?', 12),
    ('What do you consider when designing user interfaces?', 12),
    ('How do you handle a disagreement with a team member?', 12),

    ('Describe your experience with agile methodologies.', 13),
    ('What strategies do you use to manage stress?', 13),

    ('Explain a situation where you showed leadership.', 14),
    ('What do you know about our competitors?', 14),
    ('How would you handle a situation where requirements change midway?', 14),

    ('What’s the most challenging technical problem you’ve faced?', 15),
    ('How do you approach code optimization?', 15),

    ('Tell us about a project where you implemented innovation.', 16),
    ('What are your career goals in the next five years?', 16),

    ('Describe how you handle conflicts in a team setting.', 17),
    ('What’s your process for learning new technologies?', 17),
    ('How do you handle stressful deadlines?', 17),

    ('What’s the last new tool or framework you learned?', 18),
    ('How do you measure success in your work?', 18),

    ('What motivates you to stay productive?', 19),
    ('What challenges do you think our industry is facing?', 19),
    ('How do you contribute to a positive work environment?', 19),

    ('Describe a time you made a tough decision at work.', 20),
    ('What steps do you take to ensure quality in your work?', 20),

    ('How do you prioritize competing tasks?', 21),
    ('What do you consider when solving problems collaboratively?', 21),

    ('How do you ensure your work aligns with company goals?', 22),
    ('What is your approach to balancing innovation with efficiency?', 22),

    ('What role does feedback play in your professional growth?', 23),
    ('Tell us about a time you exceeded expectations.', 23),

    ('What is your preferred method for resolving conflicts?', 24),
    ('How do you balance technical challenges and deadlines?', 24),
    ('What techniques do you use to mentor others?', 24),

    ('How do you adapt to changes in project requirements?', 25),
    ('What do you think makes a strong team member?', 25),

    ('How do you approach learning from failure?', 26),
    ('What motivates you to take on new challenges?', 26),
    ('What is your philosophy on collaboration?', 26),

    ('How do you balance work and life responsibilities?', 27),
    ('What is the most rewarding part of your career?', 27),

    ('What are your thoughts on workplace diversity?', 28),
    ('Describe a time you challenged the status quo.', 28),
    ('What is your approach to mentoring others in the workplace?', 28),

    ('How do you keep up with industry trends?', 29),
    ('What motivates you to pursue professional development?', 29),

    ('What skills do you want to develop further?', 30),
    ('How do you see your career evolving with us?', 30),
    ('What excites you most about this role?', 30);

INSERT INTO company_contact (companyId, firstName, middleName, lastName, phone, email, dateOfBirth)
    VALUES
    (1, 'Jack', 'William', 'Daniels', '(321) 654-0987', 'jackdaniels@gmail.com', '1987-12-24'),
    (2, 'Sam', 'Nat', 'Adams', '(231) 645-8690', 'samadams@gmail.com', '1989-01-01'),
    (3, 'Daniel', 'Ferdinand', 'Lane', '(235) 234-9874', 'daniellane@gmail.com', '1995-05-17'),
    (4, 'Emily', 'Grace', 'Smith', '(312) 456-7890', 'emilysmith@gmail.com', '1990-04-12'),
    (5, 'Michael', 'Andrew', 'Jones', '(678) 345-6789', 'michaeljones@gmail.com', '1993-09-15'),
    (6, 'Sarah', 'Anne', 'Taylor', '(789) 654-3210', 'sarahtaylor@gmail.com', '1988-11-05'),
    (7, 'David', 'Oliver', 'Johnson', '(987) 654-1234', 'davidjohnson@gmail.com', '1992-03-22'),
    (8, 'Laura', 'Marie', 'Brown', '(123) 567-8901', 'laurabrown@gmail.com', '1991-06-30'),
    (9, 'John', 'Patrick', 'Lee', '(234) 678-9012', 'johnlee@gmail.com', '1994-02-14'),
    (10, 'Anna', 'Rose', 'Miller', '(345) 789-0123', 'annamiller@gmail.com', '1986-08-18'),
    (11, 'Chris', 'James', 'Clark', '(456) 890-1234', 'chrisclark@gmail.com', '1997-07-11'),
    (12, 'Jessica', 'Lynn', 'Lewis', '(567) 901-2345', 'jessicalewis@gmail.com', '1990-01-25'),
    (13, 'Andrew', 'Paul', 'Walker', '(678) 012-3456', 'andrewwalker@gmail.com', '1993-10-08'),
    (14, 'Sophia', 'Eleanor', 'Young', '(789) 123-4567', 'sophiayoung@gmail.com', '1989-05-19'),
    (15, 'Matthew', 'Ryan', 'Green', '(890) 234-5678', 'matthewgreen@gmail.com', '1985-11-30'),
    (16, 'Olivia', 'Jane', 'Hall', '(901) 345-6789', 'oliviahall@gmail.com', '1991-04-07'),
    (17, 'Ethan', 'George', 'Harris', '(012) 456-7890', 'ethanharris@gmail.com', '1994-12-01'),
    (18, 'Ava', 'Madison', 'Robinson', '(123) 567-8904', 'avarobinson@gmail.com', '1992-07-14'),
    (19, 'Alexander', 'Charles', 'Thompson', '(234) 678-9013', 'alexanderthompson@gmail.com', '1987-02-20'),
    (20, 'Isabella', 'Grace', 'White', '(345) 789-0124', 'isabellawhite@gmail.com', '1995-09-09'),
    (21, 'James', 'Noah', 'Hughes', '(456) 890-1235', 'jameshughes@gmail.com', '1990-06-23'),
    (22, 'Mia', 'Sophia', 'King', '(567) 901-2346', 'miaking@gmail.com', '1993-03-31'),
    (23, 'Benjamin', 'Henry', 'Scott', '(678) 012-3457', 'benjaminscott@gmail.com', '1994-10-21'),
    (24, 'Ella', 'Victoria', 'Morgan', '(789) 123-4568', 'ellamorgan@gmail.com', '1988-08-13'),
    (25, 'Lucas', 'Michael', 'Carter', '(890) 234-5679', 'lucascarter@gmail.com', '1991-11-29'),
    (26, 'Charlotte', 'Emily', 'Bailey', '(901) 345-6799', 'charlottebailey@gmail.com', '1990-12-17'),
    (27, 'Henry', 'Daniel', 'Parker', '(012) 456-7891', 'henryparker@gmail.com', '1986-07-05'),
    (28, 'Amelia', 'Hannah', 'Mitchell', '(123) 567-8902', 'ameliamitchell@gmail.com', '1992-01-11'),
    (29, 'William', 'Matthew', 'Phillips', '(234) 678-9014', 'williamphillips@gmail.com', '1993-02-25'),
    (30, 'Emily', 'Ann', 'Evans', '(345) 789-0125', 'emilyevans@gmail.com', '1989-09-30');

INSERT INTO job_posting (companyId, contactId, name, description, location)
    VALUES
    -- Company 1
    (1, 1, 'Software Engineer', 'Develop and maintain software applications', 'Mountain View, CA'),
    (1, 1, 'Frontend Developer', 'Design and build user-facing features', 'Mountain View, CA'),
    (1, 1, 'Backend Engineer', 'Work on APIs and server-side architecture', 'Mountain View, CA'),

    -- Company 2
    (2, 2, 'Data Scientist', 'Analyze data and build predictive models', 'Cupertino, CA'),
    (2, 2, 'Machine Learning Engineer', 'Develop machine learning pipelines', 'Cupertino, CA'),
    (2, 2, 'AI Researcher', 'Research cutting-edge AI technologies', 'Cupertino, CA'),

    -- Company 3
    (3, 3, 'IT Support Specialist', 'Provide technical support to employees', 'Menlo Park, CA'),
    (3, 3, 'Network Administrator', 'Manage company network and systems', 'Menlo Park, CA'),
    (3, 3, 'System Analyst', 'Analyze and improve IT systems', 'Menlo Park, CA'),

    -- Company 4
    (4, 4, 'Product Manager', 'Oversee product lifecycle and strategy', 'Seattle, WA'),
    (4, 4, 'UX Designer', 'Design user-friendly interfaces', 'Seattle, WA'),
    (4, 4, 'Technical Writer', 'Document technical processes', 'Seattle, WA'),

    -- Company 5
    (5, 5, 'DevOps Engineer', 'Ensure CI/CD and infrastructure reliability', 'New York, NY'),
    (5, 5, 'Cloud Architect', 'Design cloud-based solutions', 'New York, NY'),
    (5, 5, 'Database Administrator', 'Manage and optimize databases', 'New York, NY'),

    -- Company 6
    (6, 6, 'Security Analyst', 'Monitor and enhance cybersecurity', 'Austin, TX'),
    (6, 6, 'Penetration Tester', 'Identify vulnerabilities in systems', 'Austin, TX'),
    (6, 6, 'Compliance Officer', 'Ensure regulatory compliance', 'Austin, TX'),

    -- Company 7
    (7, 7, 'Software Engineer', 'Build and maintain scalable software', 'San Diego, CA'),
    (7, 7, 'QA Tester', 'Test software to identify bugs', 'San Diego, CA'),
    (7, 7, 'Mobile Developer', 'Develop mobile applications', 'San Diego, CA'),

    -- Company 8
    (8, 8, 'Business Analyst', 'Analyze and document business processes', 'Boston, MA'),
    (8, 8, 'Sales Engineer', 'Support sales with technical expertise', 'Boston, MA'),
    (8, 8, 'Marketing Specialist', 'Drive marketing campaigns', 'Boston, MA'),

    -- Company 9
    (9, 9, 'Project Manager', 'Manage and coordinate projects', 'Chicago, IL'),
    (9, 9, 'Scrum Master', 'Facilitate agile team practices', 'Chicago, IL'),
    (9, 9, 'Agile Coach', 'Promote agile methodologies', 'Chicago, IL'),

    -- Company 10
    (10, 10, 'Software Developer', 'Write and optimize code', 'Atlanta, GA'),
    (10, 10, 'UI Designer', 'Create visually appealing designs', 'Atlanta, GA'),
    (10, 10, 'Support Engineer', 'Assist clients with technical issues', 'Atlanta, GA'),

    -- Company 11
    (11, 11, 'Cybersecurity Specialist', 'Implement security protocols', 'Houston, TX'),
    (11, 11, 'Incident Responder', 'Respond to cybersecurity threats', 'Houston, TX'),
    (11, 11, 'SOC Analyst', 'Monitor and respond to security incidents', 'Houston, TX'),

    -- Company 12
    (12, 12, 'Product Designer', 'Design and iterate on product features', 'Miami, FL'),
    (12, 12, 'Full Stack Developer', 'Develop end-to-end solutions', 'Miami, FL'),
    (12, 12, 'Content Strategist', 'Plan and create content strategies', 'Miami, FL'),

    -- Company 13
    (13, 13, 'Data Engineer', 'Build and maintain data pipelines', 'Phoenix, AZ'),
    (13, 13, 'Analytics Consultant', 'Provide data-driven recommendations', 'Phoenix, AZ'),
    (13, 13, 'Data Visualization Specialist', 'Create visual data representations', 'Phoenix, AZ'),

    -- Company 14
    (14, 14, 'AI Specialist', 'Design AI-powered solutions', 'Denver, CO'),
    (14, 14, 'Cloud Engineer', 'Implement cloud infrastructure', 'Denver, CO'),
    (14, 14, 'Blockchain Developer', 'Develop blockchain-based applications', 'Denver, CO'),

    -- Company 15
    (15, 15, 'Front-End Engineer', 'Build responsive web interfaces', 'Portland, OR'),
    (15, 15, 'Back-End Engineer', 'Handle server-side development', 'Portland, OR'),
    (15, 15, 'Tech Lead', 'Lead development teams', 'Portland, OR'),

    -- Company 16
    (16, 16, 'Network Engineer', 'Design and optimize network systems', 'Dallas, TX'),
    (16, 16, 'DevOps Manager', 'Lead DevOps teams and projects', 'Dallas, TX'),
    (16, 16, 'System Architect', 'Architect IT infrastructure solutions', 'Dallas, TX'),

    -- Company 17
    (17, 17, 'Game Developer', 'Develop engaging video games', 'San Francisco, CA'),
    (17, 17, 'Graphics Programmer', 'Create graphical rendering systems', 'San Francisco, CA'),
    (17, 17, 'Audio Engineer', 'Develop audio systems for games', 'San Francisco, CA'),

    -- Company 18
    (18, 18, 'Operations Manager', 'Oversee daily company operations', 'Orlando, FL'),
    (18, 18, 'Strategy Consultant', 'Advise on business strategies', 'Orlando, FL'),
    (18, 18, 'Financial Analyst', 'Analyze company finances', 'Orlando, FL'),

    -- Company 19
    (19, 19, 'HR Specialist', 'Manage recruitment and HR processes', 'San Antonio, TX'),
    (19, 19, 'Compensation Analyst', 'Design competitive salary structures', 'San Antonio, TX'),
    (19, 19, 'Recruiter', 'Identify and onboard talent', 'San Antonio, TX'),

    -- Company 20
    (20, 20, 'Technical Support Engineer', 'Resolve technical issues for clients', 'Charlotte, NC'),
    (20, 20, 'Help Desk Technician', 'Provide front-line IT support', 'Charlotte, NC'),
    (20, 20, 'IT Consultant', 'Advise on IT strategies', 'Charlotte, NC'),

    -- Company 21
    (21, 21, 'Sales Executive', 'Drive sales and build client relationships', 'Las Vegas, NV'),
    (21, 21, 'Account Manager', 'Manage client accounts', 'Las Vegas, NV'),
    (21, 21, 'Business Development Manager', 'Identify growth opportunities', 'Las Vegas, NV'),

    -- Company 22
    (22, 22, 'Marketing Manager', 'Develop and execute marketing strategies', 'Philadelphia, PA'),
    (22, 22, 'Content Creator', 'Create engaging marketing content', 'Philadelphia, PA'),
    (22, 22, 'Social Media Specialist', 'Manage social media campaigns', 'Philadelphia, PA'),

    -- Company 23
    (23, 23, 'Research Scientist', 'Conduct innovative research projects', 'Raleigh, NC'),
    (23, 23, 'Lab Technician', 'Support research activities', 'Raleigh, NC'),
    (23, 23, 'Data Analyst', 'Analyze research data', 'Raleigh, NC'),

    -- Company 24
    (24, 24, 'Architect', 'Design sustainable building plans', 'Salt Lake City, UT'),
    (24, 24, 'Urban Planner', 'Develop city planning initiatives', 'Salt Lake City, UT'),
    (24, 24, 'Environmental Consultant', 'Advise on environmental projects', 'Salt Lake City, UT'),

    -- Company 25
    (25, 25, 'Legal Assistant', 'Support legal teams and documentation', 'Nashville, TN'),
    (25, 25, 'Paralegal', 'Assist with legal case preparations', 'Nashville, TN'),
    (25, 25, 'Contracts Manager', 'Review and negotiate contracts', 'Nashville, TN'),

    -- Company 26
    (26, 26, 'Healthcare Administrator', 'Oversee healthcare facilities', 'Columbus, OH'),
    (26, 26, 'Medical Coder', 'Translate medical procedures into codes', 'Columbus, OH'),
    (26, 26, 'Health IT Specialist', 'Implement health technology systems', 'Columbus, OH'),

    -- Company 27
    (27, 27, 'Event Planner', 'Organize corporate events and meetings', 'Salt Lake City, UT'),
    (27, 27, 'Event Coordinator', 'Manage event logistics and vendors', 'Salt Lake City, UT'),
    (27, 27, 'Public Relations Manager', 'Develop PR campaigns', 'Salt Lake City, UT'),

    -- Company 28
    (28, 28, 'Customer Success Manager', 'Build relationships with customers', 'Portland, ME'),
    (28, 28, 'Support Specialist', 'Assist customers with technical issues', 'Portland, ME'),
    (28, 28, 'Implementation Consultant', 'Help clients deploy solutions', 'Portland, ME'),

    -- Company 29
    (29, 29, 'Manufacturing Engineer', 'Improve manufacturing processes', 'Detroit, MI'),
    (29, 29, 'Quality Control Specialist', 'Ensure product quality standards', 'Detroit, MI'),
    (29, 29, 'Supply Chain Analyst', 'Optimize supply chain operations', 'Detroit, MI'),

    -- Company 30
    (30, 30, 'AI Research Scientist', 'Conduct research in AI and machine learning', 'Toronto, ON'),
    (30, 30, 'Data Engineer', 'Build and maintain data infrastructure', 'Toronto, ON'),
    (30, 30, 'Product Manager', 'Oversee product lifecycle from concept to launch', 'Toronto, ON');

INSERT INTO job_degrees (jobId, degreeId)
    VALUES (1, 1),
           (1, 14),
           (1, 25),
           (2, 17),
           (2, 22),
           (3, 27),
           (3, 11),
           (4, 20),
           (4, 6),
           (5, 21),
           (5, 7),
           (6, 26),
           (6, 3),
           (6, 20),
           (7, 18),
           (7, 21),
           (7, 23),
           (8, 16),
           (8, 21),
           (9, 17),
           (9, 10),
           (9, 18),
           (10, 24),
           (10, 10),
           (10, 6),
           (11, 8),
           (11, 3),
           (11, 5),
           (12, 17),
           (12, 9),
           (13, 25),
           (13, 1),
           (14, 17),
           (14, 27),
           (15, 8),
           (15, 25),
           (15, 3),
           (16, 1),
           (16, 22),
           (17, 9),
           (17, 14),
           (17, 23),
           (18, 27),
           (18, 15),
           (19, 30),
           (19, 7),
           (20, 25),
           (20, 3),
           (21, 16),
           (21, 2),
           (22, 16),
           (22, 15),
           (23, 4),
           (23, 30),
           (24, 9),
           (24, 12),
           (24, 21),
           (25, 25),
           (25, 3),
           (25, 15),
           (26, 10),
           (26, 18),
           (26, 23),
           (27, 2),
           (27, 3),
           (27, 7),
           (28, 24),
           (28, 30),
           (29, 25),
           (29, 20),
           (30, 17),
           (30, 2),
           (30, 19),
           (31, 17),
           (31, 20),
           (31, 5),
           (32, 9),
           (32, 15),
           (33, 16),
           (33, 28),
           (33, 29),
           (34, 9),
           (34, 27),
           (35, 4),
           (35, 28),
           (36, 19),
           (36, 15),
           (37, 26),
           (37, 20),
           (37, 15),
           (38, 9),
           (38, 12),
           (38, 20),
           (39, 8),
           (39, 25),
           (39, 24),
           (40, 22),
           (40, 14),
           (41, 26),
           (41, 5),
           (42, 8),
           (42, 25),
           (42, 21),
           (43, 16),
           (43, 4),
           (44, 16),
           (44, 11),
           (44, 7),
           (45, 1),
           (45, 14),
           (45, 7),
           (46, 8),
           (46, 19),
           (46, 15),
           (47, 16),
           (47, 27),
           (47, 13),
           (48, 19),
           (48, 3),
           (48, 5),
           (49, 3),
           (49, 23),
           (50, 8),
           (50, 1),
           (50, 29),
           (51, 9),
           (51, 20),
           (51, 25),
           (52, 18),
           (52, 5),
           (52, 15),
           (53, 5),
           (53, 13),
           (54, 24),
           (54, 11),
           (55, 16),
           (55, 27),
           (55, 13),
           (56, 8),
           (56, 10),
           (56, 6),
           (57, 18),
           (57, 4),
           (57, 21),
           (58, 3),
           (58, 14),
           (59, 3),
           (59, 23),
           (60, 1),
           (60, 19),
           (61, 21),
           (61, 6),
           (62, 29),
           (62, 14),
           (62, 15),
           (63, 25),
           (63, 27),
           (63, 28),
           (64, 18),
           (64, 3),
           (64, 29),
           (65, 18),
           (65, 14),
           (66, 16),
           (66, 20),
           (67, 1),
           (67, 3),
           (68, 1),
           (68, 17),
           (68, 25),
           (69, 9),
           (69, 5),
           (70, 25),
           (70, 14),
           (70, 17),
           (71, 9),
           (71, 5),
           (72, 8),
           (72, 19),
           (72, 20),
           (73, 26),
           (73, 21),
           (74, 12),
           (74, 13),
           (75, 16),
           (75, 11),
           (75, 23),
           (76, 10),
           (76, 21),
           (77, 4),
           (77, 22),
           (77, 14),
           (78, 24),
           (78, 5),
           (78, 22),
           (79, 17),
           (79, 28),
           (79, 23),
           (80, 2),
           (80, 21),
           (81, 9),
           (81, 11),
           (81, 12),
           (82, 16),
           (82, 1),
           (82, 29),
           (83, 16),
           (83, 9),
           (84, 8),
           (84, 25),
           (84, 19),
           (85, 1),
           (85, 14),
           (86, 13),
           (86, 6),
           (87, 8),
           (87, 7),
           (87, 23),
           (88, 8),
           (88, 1),
           (88, 15),
           (89, 2),
           (89, 21),
           (89, 14),
           (90, 4),
           (90, 30);

INSERT INTO reviews (content, title, rating, studentId, jobId)
    VALUES
    ('Great team and projects!', 'Software Engineering Feedback', 5, 1, 1),
    ('Good mentorship opportunities.', 'Software Engineer Role Review', 4, 2, 1),

    ('Exciting data challenges!', 'Data Scientist Review', 5, 3, 2),
    ('Collaborative environment.', 'Data Science Experience', 4, 4, 2),

    ('Supportive management and clear tasks.', 'IT Support Role Feedback', 4, 5, 3),
    ('Great place to start a tech career.', 'IT Support Review', 4, 6, 3),

    ('Lots of leadership opportunities.', 'Product Manager Feedback', 5, 7, 4),
    ('Innovative ideas and team spirit.', 'Product Manager Role', 4, 8, 4),

    ('Learned about CI/CD pipelines.', 'DevOps Engineer Review', 5, 9, 5),
    ('Good tools and supportive peers.', 'DevOps Engineer Feedback', 4, 10, 5),

    ('Challenging but rewarding.', 'Cloud Architect Role', 5, 11, 6),
    ('Gained hands-on cloud experience.', 'Cloud Engineer Feedback', 4, 12, 6),

    ('Excellent learning curve.', 'ML Engineer Feedback', 5, 13, 7),
    ('Fast-paced but rewarding.', 'Machine Learning Engineer Role', 4, 14, 7),

    ('Cutting-edge AI projects.', 'AI Researcher Review', 5, 15, 8),
    ('Lots of learning opportunities.', 'AI Scientist Role', 4, 16, 8),

    ('Amazing backend projects.', 'Backend Developer Role', 5, 17, 9),
    ('Collaborative workplace.', 'Backend Engineer Feedback', 4, 18, 9),

    ('Engaging frontend tasks.', 'Frontend Developer Feedback', 5, 19, 10),
    ('Good work-life balance.', 'Frontend Engineer Review', 4, 20, 10),

    ('Strong security culture.', 'Cybersecurity Specialist Feedback', 5, 21, 11),
    ('Clear security protocols.', 'Incident Responder Review', 4, 22, 11),

    ('Creative environment.', 'Product Designer Role', 5, 23, 12),
    ('Clear project goals.', 'Content Strategist Feedback', 4, 24, 12),

    ('Solid data infrastructure.', 'Data Engineer Review', 5, 25, 13),
    ('Good analytics tools.', 'Analytics Consultant Role', 4, 26, 13),

    ('Innovative AI tasks.', 'AI Specialist Role', 5, 27, 14),
    ('Fun blockchain projects.', 'Blockchain Developer Feedback', 4, 28, 14),

    ('Strong tech leadership.', 'Frontend Engineer Feedback', 5, 29, 15),
    ('Collaborative backend team.', 'Backend Engineer Role', 4, 30, 15),

    ('Hands-on systems work.', 'System Analyst Feedback', 5, 1, 16),
    ('Supportive IT projects.', 'Network Administrator Role', 4, 2, 16),

    ('Good sales incentives.', 'Sales Engineer Feedback', 5, 3, 17),
    ('Marketing projects galore.', 'Marketing Specialist Role', 4, 4, 17),

    ('Solid UI guidance.', 'UI Designer Feedback', 5, 5, 18),
    ('In-depth support guidance.', 'Support Engineer Role', 4, 6, 18),

    ('Strong focus on incident response.', 'SOC Analyst Review', 5, 7, 19),
    ('Fast-paced security tasks.', 'Security Analyst Role', 4, 8, 19),

    ('Well-organized systems.', 'Technical Writer Feedback', 5, 9, 20),
    ('Clear documentation tasks.', 'UX Designer Role', 4, 10, 20),

    ('Broad DevOps skills.', 'Cloud Architect Role', 5, 11, 21),
    ('Extensive CI/CD practices.', 'DevOps Engineer Feedback', 4, 12, 21),

    ('Great for junior engineers.', 'Frontend Developer Feedback', 5, 13, 22),
    ('Scalable backend projects.', 'Backend Developer Role', 4, 14, 22),

    ('Lots of analytics work.', 'Analytics Consultant Review', 5, 15, 23),
    ('Strong Python culture.', 'Data Scientist Role', 4, 16, 23),

    ('Collaborative QA team.', 'QA Tester Feedback', 5, 17, 24),
    ('In-depth feature testing.', 'Software Engineer Role', 4, 18, 24),

    ('Empowering sales team.', 'Sales Engineer Feedback', 5, 19, 25),
    ('Engaging process analytics.', 'Business Analyst Role', 4, 20, 25),

    ('Strong DevOps practices.', 'Cloud Architect Role', 5, 21, 26),
    ('CI/CD clarity.', 'DevOps Engineer Feedback', 4, 22, 26),

    ('Clear AI modeling.', 'ML Engineer Role', 5, 23, 27),
    ('Innovative AI trends.', 'AI Researcher Feedback', 4, 24, 27),

    ('Good backend scalability.', 'Backend Engineer Feedback', 5, 25, 28),
    ('Frontend guidance helpful.', 'Frontend Engineer Role', 4, 26, 28),

    ('AI depth and clarity.', 'AI Research Role', 5, 27, 29),
    ('Collaborative ML trends.', 'Machine Learning Engineer Feedback', 4, 28, 29),

    ('Solid backend scalability.', 'Backend Engineer Feedback', 5, 29, 30),
    ('Strong ML scope.', 'ML Engineer Role', 4, 30, 30);

INSERT INTO review_courses (reviewId, courseId)
    VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15),
    (16, 16),
    (17, 17),
    (18, 18),
    (19, 19),
    (20, 20),
    (21, 21),
    (22, 22),
    (23, 23),
    (24, 24),
    (25, 25),
    (26, 26),
    (27, 27),
    (28, 28),
    (29, 29),
    (30, 30),
    (31, 1),
    (32, 2),
    (33, 3),
    (34, 4),
    (35, 5),
    (36, 6),
    (37, 7),
    (38, 8),
    (39, 9),
    (40, 10);

INSERT INTO job_application (jobId, studentId)
    VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15),
    (16, 16),
    (17, 17),
    (18, 18),
    (19, 19),
    (20, 20),
    (21, 21),
    (22, 22),
    (23, 23),
    (24, 24),
    (25, 25),
    (26, 26),
    (27, 27),
    (28, 28),
    (29, 29),
    (30, 30),
    (1, 5),
    (2, 10),
    (3, 15),
    (4, 20),
    (5, 25),
    (6, 30),
    (7, 4),
    (8, 8),
    (9, 12),
    (10, 16);

INSERT INTO announcements (authorId, title, content)
    VALUES
    (1, 'Announcement 1', 'This is the first announcement.'),
    (2, 'Announcement 2', 'This is the second announcement.'),
    (3, 'Announcement 3', 'This is the third announcement.'),
    (4, 'Announcement 4', 'This is the fourth announcement.'),
    (5, 'Announcement 5', 'This is the fifth announcement.'),
    (6, 'Announcement 6', 'This is the sixth announcement.'),
    (7, 'Announcement 7', 'This is the seventh announcement.'),
    (8, 'Announcement 8', 'This is the eighth announcement.'),
    (9, 'Announcement 9', 'This is the ninth announcement.'),
    (10, 'Announcement 10', 'This is the tenth announcement.'),
    (11, 'Announcement 11', 'This is the eleventh announcement.'),
    (12, 'Announcement 12', 'This is the twelfth announcement.'),
    (13, 'Announcement 13', 'This is the thirteenth announcement.'),
    (14, 'Announcement 14', 'This is the fourteenth announcement.'),
    (15, 'Announcement 15', 'This is the fifteenth announcement.'),
    (16, 'Announcement 16', 'This is the sixteenth announcement.'),
    (17, 'Announcement 17', 'This is the seventeenth announcement.'),
    (18, 'Announcement 18', 'This is the eighteenth announcement.'),
    (19, 'Announcement 19', 'This is the nineteenth announcement.'),
    (20, 'Announcement 20', 'This is the twentieth announcement.'),
    (21, 'Announcement 21', 'This is the twenty-first announcement.'),
    (22, 'Announcement 22', 'This is the twenty-second announcement.'),
    (23, 'Announcement 23', 'This is the twenty-third announcement.'),
    (24, 'Announcement 24', 'This is the twenty-fourth announcement.'),
    (25, 'Announcement 25', 'This is the twenty-fifth announcement.'),
    (26, 'Announcement 26', 'This is the twenty-sixth announcement.'),
    (27, 'Announcement 27', 'This is the twenty-seventh announcement.'),
    (28, 'Announcement 28', 'This is the twenty-eighth announcement.'),
    (29, 'Announcement 29', 'This is the twenty-ninth announcement.'),
    (30, 'Announcement 30', 'This is the thirtieth announcement.'),
    (1, 'Announcement 31', 'This is another announcement by advisor 1.'),
    (2, 'Announcement 32', 'This is another announcement by advisor 2.'),
    (3, 'Announcement 33', 'This is another announcement by advisor 3.'),
    (4, 'Announcement 34', 'This is another announcement by advisor 4.'),
    (5, 'Announcement 35', 'This is another announcement by advisor 5.'),
    (6, 'Announcement 36', 'This is another announcement by advisor 6.'),
    (7, 'Announcement 37', 'This is another announcement by advisor 7.'),
    (8, 'Announcement 38', 'This is another announcement by advisor 8.'),
    (9, 'Announcement 39', 'This is another announcement by advisor 9.'),
    (10, 'Announcement 40', 'This is another announcement by advisor 10.');

INSERT INTO announcement_degrees (announcementId, degreeId)
    VALUES
    (1, 1), (1, 2),
    (2, 2), (2, 3),
    (3, 3), (3, 1),
    (4, 1), (4, 4),
    (5, 2), (5, 5),
    (6, 3), (6, 6),
    (7, 4), (7, 7),
    (8, 5), (8, 8),
    (9, 6), (9, 9),
    (10, 7), (10, 10),
    (11, 8), (11, 11),
    (12, 9), (12, 12),
    (13, 10), (13, 13),
    (14, 11), (14, 14),
    (15, 12), (15, 15),
    (16, 13), (16, 16),
    (17, 14), (17, 17),
    (18, 15), (18, 18),
    (19, 16), (19, 19),
    (20, 17), (20, 20),
    (21, 18), (21, 1),
    (22, 19), (22, 2),
    (23, 20), (23, 3),
    (24, 1), (24, 4),
    (25, 2), (25, 5),
    (26, 3), (26, 6),
    (27, 4), (27, 7),
    (28, 5), (28, 8),
    (29, 6), (29, 9),
    (30, 7), (30, 10),
    (31, 8), (31, 11),
    (32, 9), (32, 12),
    (33, 10), (33, 13),
    (34, 11), (34, 14),
    (35, 12), (35, 15),
    (36, 13), (36, 16),
    (37, 14), (37, 17),
    (38, 15), (38, 18),
    (39, 16), (39, 19),
    (40, 17), (40, 20);

INSERT INTO system_admins (firstName, middleName, lastName, phone, email)
    VALUES
    ('Bob', 'Bill', 'Dee', '(432) 235-4368', 'bobdee@gmail.com'),
    ('Fred', 'Chip', 'Thatcher', '(368) 983-2386', 'fredthatcher@gmail.com'),
    ('Jack', 'Brady', 'White', '(869) 347-2397', 'jackwhite@gmail.com'),
    ('Alice', 'Marie', 'Johnson', '(312) 555-1234', 'alicejohnson@gmail.com'),
    ('Charlie', 'Edward', 'Smith', '(789) 234-5678', 'charliesmith@gmail.com'),
    ('Diana', 'Grace', 'Brown', '(456) 345-6789', 'dianabrown@gmail.com'),
    ('Ethan', 'James', 'Miller', '(123) 456-7890', 'ethanmiller@gmail.com'),
    ('Fiona', 'Rose', 'Davis', '(987) 654-3210', 'fionadavis@gmail.com'),
    ('George', 'Michael', 'Anderson', '(654) 789-1234', 'georgeanderson@gmail.com'),
    ('Hannah', 'Sophia', 'Taylor', '(321) 123-4567', 'hannahtaylor@gmail.com'),
    ('Ian', 'Alexander', 'Wilson', '(567) 234-5678', 'ianwilson@gmail.com'),
    ('Jenna', 'Marie', 'Moore', '(432) 987-6543', 'jennamoore@gmail.com'),
    ('Kevin', 'Nathaniel', 'Clark', '(890) 567-2345', 'kevinclark@gmail.com'),
    ('Laura', 'Emily', 'Walker', '(567) 890-1234', 'laurawalker@gmail.com'),
    ('Matthew', 'Liam', 'Hall', '(432) 234-5678', 'matthewhall@gmail.com'),
    ('Nina', 'Grace', 'Allen', '(789) 123-4567', 'ninaallen@gmail.com'),
    ('Oscar', 'Daniel', 'Young', '(321) 654-7890', 'oscaryoung@gmail.com'),
    ('Paula', 'Elizabeth', 'King', '(987) 456-1234', 'paulaking@gmail.com'),
    ('Quinn', 'David', 'Wright', '(654) 567-8901', 'quinnwright@gmail.com'),
    ('Rachel', 'Lily', 'Green', '(567) 234-6789', 'rachelgreen@gmail.com'),
    ('Samuel', 'Henry', 'Adams', '(890) 789-1234', 'samueladams@gmail.com'),
    ('Tina', 'Sophia', 'Nelson', '(789) 654-3210', 'tinanelson@gmail.com'),
    ('Ulysses', 'Victor', 'Roberts', '(456) 789-2345', 'ulyssesroberts@gmail.com'),
    ('Vanessa', 'Claire', 'Perez', '(123) 567-8904', 'vanessaperez@gmail.com'),
    ('William', 'Isaac', 'Mitchell', '(987) 234-5678', 'williammitchell@gmail.com'),
    ('Xander', 'Nathan', 'Fisher', '(432) 789-2345', 'xanderfisher@gmail.com'),
    ('Yvonne', 'Amelia', 'Carter', '(654) 123-4567', 'yvonnecarter@gmail.com'),
    ('Zachary', 'Ethan', 'Stewart', '(567) 890-2345', 'zacharystewart@gmail.com'),
    ('Amber', 'Rose', 'Patterson', '(321) 456-7890', 'amberpatterson@gmail.com'),
    ('Brian', 'Lucas', 'Hughes', '(890) 654-1234', 'brianhughes@gmail.com');

INSERT INTO job_views (jobId)
    VALUES (1), (2), (3);
DROP TABLE job_views;