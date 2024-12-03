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