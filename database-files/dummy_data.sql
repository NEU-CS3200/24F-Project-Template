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
    ('John Doe', 'John', 'A', 'Doe',