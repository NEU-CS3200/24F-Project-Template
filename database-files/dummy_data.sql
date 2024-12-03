USE cosint

-- Insert into companies
INSERT INTO companies (name)
VALUES
    ('TechCorp'),
    ('Innovate Inc'),
    ('Healthify Solutions'),
    ('EduVenture');

-- Insert into users
INSERT INTO users (name, firstName, middleName, lastName, mobile, email, passwordHash, profile, companyId, lastLogin)
VALUES
    ('John Doe', 'John', 'A', 'Doe', '1234567890', 'johndoe@example.com', MD5('password123'), 'Senior Engineer at TechCorp', 1, NOW()),
    ('Jane Smith', 'Jane', 'B', 'Smith', '1234567891', 'janesmith@example.com', MD5('securepass'), 'Manager at Innovate Inc', 2, NOW()),
    ('Samuel Green', 'Samuel', 'C', 'Green', '1234567892', 'samuelgreen@example.com', MD5('mypassword'), 'Data Scientist at Healthify Solutions', 3, NOW()),
    ('Emily White', 'Emily', 'D', 'White', '1234567893', 'emilywhite@example.com', MD5('whitepass'), 'CTO at EduVenture', 4, NOW());

-- Insert into user_references
INSERT INTO user_references (name, firstName, middleName, lastName, mobile, email, referral, userId) 
VALUES
    ('Mark Taylor', 'Mark', 'E', 'Taylor', '1234567894', 'marktaylor@example.com', 'Referred for engineering role', 1),
    ('Lucy Brown', 'Lucy', 'F', 'Brown', '1234567895', 'lucybrown@example.com', 'Recommended for a data position', 3);

-- Insert into tickets
INSERT INTO tickets (userId, helperId, summary, completed, viewedAt)
VALUES
    (1, 2, 'System upgrade issue', 0, NULL),
    (3, 4, 'Database optimization task', 1, NOW());

-- Insert into positions
INSERT INTO positions (companyId, applicantQuestions, summary, country, city, address, expectedSalary)
VALUES
    (1, 'What is your experience in backend development?', 'Backend Developer Role', 'USA', 'New York', '123 Tech Street', 75000),
    (1, 'Describe your approach to team management.', 'Team Manager Role', 'Canada', 'Toronto', '456 Innovate Lane', 85000);

-- Insert into applications
INSERT INTO applications (questionResponse, summary, GPA, submittedAt)
VALUES
    ('I have 5 years of experience in backend development and microservices architecture.',
    'Application for Backend Developer', 3.8, NOW()),
    ('I have 10 years of experience in management and have successfully led teams.',
    );