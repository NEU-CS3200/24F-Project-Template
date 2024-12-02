Create DATABASE cosint;
USE cosint;

CREATE TABLE companies
(
  name varchar(30),
  registeredAt DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  id int AUTO_INCREMENT,
  PRIMARY KEY(id)
);

CREATE TABLE users
(
  name varchar(150),
  firstName varchar(50),
  middleName varchar(50),
  lastName varchar(50),
  mobile varchar(50),
  email varchar(15),
  passwordHash varchar(128) NOT NULL, 
  profile text,
  advisorId int, 
  companyId int,
  lastLogin DATETIME, 
  active boolean DEFAULT 1,
  registeredAt DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  updatedAt datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
  id int AUTO_INCREMENT,
  PRIMARY KEY(id),
  UNIQUE INDEX uq_idx_mobile (mobile),
  UNIQUE INDEX uq_idx_email (email),
  CONSTRAINT fk_01 FOREIGN KEY (advisorId) REFERENCES users (id) ON UPDATE CASCADE, 
  CONSTRAINT fk_02 FOREIGN KEY (companyId) REFERENCES companies (id) ON UPDATE CASCADE,

);

CREATE TABLE user_reference
(
  name varchar(150),
  firstName varchar(50),
  middleName varchar(50),
  lastName varchar(50),
  mobile varchar(15),
  email varchar(75),
  referral text,
  userId int,
  registeredAt datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,.
  PRIMARY KEY(userId),
  UNIQUE INDEX uq_idx_mobile (mobile),
  UNIQUE INDEX uq_idx_email (email),
  CONSTRAINT fk_03 FOREIGN KEY (userId) REFERENCES users (id) ON UPDATE CASCADE
);

CREATE TABLE ticket
(
  userId int,
  helperId int,
  summary text,
  completed boolean DEFAULT 0,
  viewedAt datetime,
  updatedAt datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  registeredAt datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
  id int AUTO_INCREMENT,
  PRIMARY KEY(id),
  CONSTRAINT fk_04 FOREIGN KEY (userId) REFERENCES users (id) ON UPDATE CASCADE,
  CONSTRAINT fk_05 FOREIGN KEY (helperId) REFERENCES users (id) ON UPDATE CASCADE
);

CREATE TABLE positions
(
  registeredAt datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
  companyId int,
  applicantQuestions text,
  summary text,
  country varchar(15),
  city varchar(15),
  address varchar(60),
  filled boolean DEFAULT 0,
  expectedSalary int,
  viewedAt datetime,
  updatedAt datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  id int AUTO_INCREMENT,
  PRIMARY KEY(id),
  CONSTRAINT fk_11 FOREIGN KEY (companyId) REFERENCES companies (id) ON UPDATE CASCADE
);
CREATE TABLE applications
(
  registeredAt datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
  questionResponse text,
  summary text,
  GPA decimal(3,2),
  submittedAt datetime,
  accepted boolean DEFAULT 0,
  viewedAt datetime,
  updatedAt datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  id int AUTO_INCREMENT,
  PRIMARY KEY(id)
);
CREATE TABLE related_coursework
(
  applicationId int,
  name varchar(30),
  summary text,
  PRIMARY KEY (applicationId, name),
  CONSTRAINT fk_08 FOREIGN KEY (applicationId) REFERENCES applications (id) ON UPDATE CASCADE ON DELETE RESTRICT
);
CREATE TABLE notable_skills
(
  applicationId int,
  name varchar(30),
  summary text,
  PRIMARY KEY (applicationId, name),
  CONSTRAINT fk_09 FOREIGN KEY (applicationId) REFERENCES applications (id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE work_experience 
(
  applicationId int,
  name varchar(30),
  summary text,
  PRIMARY KEY (applicationId, name),
  CONSTRAINT fk_10 FOREIGN KEY (applicationId) REFERENCES applications (id) ON UPDATE CASCADE ON DELETE RESTRICT
);
  CREATE TABLE position_user_bookmark
(
  positionId int, 
  userId int, 
  PRIMARY KEY (positionId, userId),
  CONSTRAINT fk_12 FOREIGN KEY (positionId) REFERENCES positions (id) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_13 FOREIGN KEY (userId) REFERENCES users (id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE company_user_bookmark
( 
  companyID int, 
  userId int, 
  PRIMARY KEY (companyId, userId),
  CONSTRAINT fk_18 FOREIGN KEY (companyId) REFERENCES companies (id) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_19 FOREIGN KEY (userId) REFERENCES users (id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE application_bookmark
(
  applicationId int,
  userId int,
  PRIMARY KEY (applicationId, userId),
  CONSTRAINT fk_14 FOREIGN KEY (applicationId) REFERENCES applications (id) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_15 FOREIGN KEY (userId) REFERENCES users (id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE offer_list
(

);