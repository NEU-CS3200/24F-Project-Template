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
)