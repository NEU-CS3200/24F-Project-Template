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
  
)