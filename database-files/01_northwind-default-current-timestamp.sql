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
  
)