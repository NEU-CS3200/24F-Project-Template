DROP DATABASE IF EXISTS `coop_compass`;
CREATE DATABASE IF NOT EXISTS `coop_compass`;
USE `coop_compass`;

DROP TABLE IF EXISTS `reviewResource`;
DROP TABLE IF EXISTS `resource`;
DROP TABLE IF EXISTS `flaggedReview`;
DROP TABLE IF EXISTS `review`;
DROP TABLE IF EXISTS `sentJobListing`;
DROP TABLE IF EXISTS `favoriteJobListings`;
DROP TABLE IF EXISTS `jobListing`;
DROP TABLE IF EXISTS `company`;
DROP TABLE IF EXISTS `recruiter`;
DROP TABLE IF EXISTS `admin`;
DROP TABLE IF EXISTS `student`;
DROP TABLE IF EXISTS `advisor`;

CREATE TABLE IF NOT EXISTS `admin`
(
    `adminId`     VARCHAR(255) PRIMARY KEY,
    `name`        VARCHAR(255) NOT NULL,
    `email`       VARCHAR(255) NOT NULL,
    `phoneNumber` BIGINT
);

CREATE TABLE IF NOT EXISTS `advisor`
(
    `advisorId`   VARCHAR(255) PRIMARY KEY,
    `name`        VARCHAR(255) NOT NULL,
    `email`       VARCHAR(255) NOT NULL,
    `phoneNumber` BIGINT
);

CREATE TABLE IF NOT EXISTS `student`
(
    `studentId`   VARCHAR(255) PRIMARY KEY,
    `advisorId`   VARCHAR(255) REFERENCES `advisor` (`advisorId`),
    `name`        VARCHAR(255) NOT NULL,
    `email`       VARCHAR(255) NOT NULL,
    `phoneNumber` BIGINT
);

CREATE TABLE IF NOT EXISTS `recruiter`
(
    `recruiterId` VARCHAR(255) PRIMARY KEY,
    `name`        VARCHAR(255) NOT NULL,
    `email`       VARCHAR(255) NOT NULL,
    `phoneNumber` BIGINT
);

CREATE TABLE IF NOT EXISTS `company`
(
    `companyId`      VARCHAR(255) PRIMARY KEY,
    `adminCreatedId` VARCHAR(255) NOT NULL REFERENCES `admin` (`adminId`),
    `name`           VARCHAR(255) NOT NULL,
    `headline`       VARCHAR(255),
    `description`    TEXT,
    `websiteLink`    VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS `resource`
(
    `resourceId` VARCHAR(255) PRIMARY KEY,
    `studentId`  VARCHAR(255) NOT NULL REFERENCES `student` (`studentId`),
    `name`       VARCHAR(255) NOT NULL,
    `URL`        VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS `jobListing`
(
    `jobListingId` VARCHAR(255) PRIMARY KEY,
    `recruiterId`  VARCHAR(255) NOT NULL REFERENCES `recruiter` (`recruiterId`),
    `companyId`    VARCHAR(255) NOT NULL REFERENCES `company` (`companyId`),
    `jobTitle`     VARCHAR(255) NOT NULL,
    `description`  TEXT,
    `startDate`    DATE,
    `endDate`      DATE,
    `hourlyWage`   INT,
    `skills`       TEXT,
    `location`     VARCHAR(255),
    `deleted`      BOOLEAN DEFAULT false,
    `datePosted`   TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS `review`
(
    `reviewId`        VARCHAR(255) PRIMARY KEY,
    `jobListingId`    VARCHAR(255) NOT NULL REFERENCES `jobListing` (`jobListingId`),
    `studentId`       VARCHAR(255) NOT NULL REFERENCES `student` (`studentId`),
    `anonymous`       BOOLEAN DEFAULT true,
    `description`     TEXT,
    `jobSatisfaction` INT CHECK (`jobSatisfaction` BETWEEN 1 AND 5),
    `hourlyWage`      INT,
    `deleted`         BOOLEAN DEFAULT false,
    `datePosted`      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS `reviewResource`
(
    `resourceId` VARCHAR(255) NOT NULL REFERENCES `resource` (`resourceId`),
    `reviewId`   VARCHAR(255) NOT NULL REFERENCES `review` (`reviewId`),
    PRIMARY KEY (`resourceId`, `reviewId`)
);

CREATE TABLE IF NOT EXISTS `favoriteJobListings`
(
    `studentId`    VARCHAR(255) NOT NULL REFERENCES `student` (`studentId`),
    `jobListingId` VARCHAR(255) NOT NULL REFERENCES `jobListing` (`jobListingId`),
    PRIMARY KEY (`studentId`, `jobListingId`)
);

CREATE TABLE IF NOT EXISTS `flaggedReview`
(
    `flaggedReviewId` VARCHAR(255) PRIMARY KEY,
    `reviewId`        VARCHAR(255) NOT NULL REFERENCES `review` (`reviewId`),
    `flaggedById`     VARCHAR(255) NOT NULL REFERENCES `recruiter` (`recruiterId`),
    `reason`          TEXT         NOT NULL,
    `dateFlagged`     TIMESTAMP    NOT NULL
);

CREATE TABLE IF NOT EXISTS `sentJobListing`
(
    `jobListingId`     VARCHAR(255) NOT NULL REFERENCES `jobListing` (`jobListingId`),
    `studentId`        VARCHAR(255) NOT NULL REFERENCES `student` (`studentId`),
    `advisorCreatedId` VARCHAR(255) NOT NULL REFERENCES `advisor` (`advisorId`),
    PRIMARY KEY (`jobListingId`, `studentId`, `advisorCreatedId`)
);


INSERT IGNORE INTO `admin` (`adminId`, `name`, `email`, `phoneNumber`)
VALUES ('A1', 'John Doe', 'john.doe@example.com', 1234567890),
       ('A2', 'Jane Smith', 'jane.smith@example.com', 2345678901),
       ('A3', 'Alice Johnson', 'alice.johnson@example.com', 3456789012);

INSERT IGNORE INTO `company` (`companyId`, `adminCreatedId`, `name`, `headline`, `description`, `websiteLink`)
VALUES ('C1', 'A1', 'Tech Solutions', 'Innovative Tech', 'A leading tech company.', 'http://techsolutions.com'),
       ('C2', 'A2', 'Health Corp', 'Healthcare for All', 'Healthcare provider.', 'http://healthcorp.com'),
       ('C3', 'A3', 'Finance Group', 'Finance Experts', 'Financial services provider.', 'http://financegroup.com');

INSERT IGNORE INTO `advisor` (`advisorId`, `name`, `email`, `phoneNumber`)
VALUES ('Adv1', 'Charlie Brown', 'charlie.brown@example.com', 4567890123),
       ('Adv2', 'Lucy Van Pelt', 'lucy.van@example.com', 5678901234),
       ('Adv3', 'Linus Van Pelt', 'linus.van@example.com', 6789012345);

INSERT IGNORE INTO `student` (`studentId`, `advisorId`, `name`, `email`, `phoneNumber`)
VALUES ('S1', 'Adv1', 'Mike Ross', 'mike.ross@example.com', 7890123456),
       ('S2', 'Adv2', 'Rachel Zane', 'rachel.zane@example.com', 8901234567),
       ('S3', 'Adv3', 'Harvey Specter', 'harvey.specter@example.com', 9012345678);

INSERT IGNORE INTO `resource` (`resourceId`, `studentId`, `name`, `URL`)
VALUES ('R1', 'S1', 'Python Tutorial', 'http://pythontutorial.com'),
       ('R2', 'S2', 'Data Analysis Guide', 'http://dataanalysis.com'),
       ('R3', 'S3', 'Machine Learning Course', 'http://mlcourse.com');

INSERT IGNORE INTO `recruiter` (`recruiterId`, `name`, `email`, `phoneNumber`)
VALUES ('Rcrt1', 'Walter White', 'walter.white@example.com', 2345678901),
       ('Rcrt2', 'Saul Goodman', 'saul.goodman@example.com', 3456789012),
       ('Rcrt3', 'Gus Fring', 'gus.fring@example.com', 4567890123);

INSERT IGNORE INTO `jobListing` (`jobListingId`, `recruiterId`, `companyId`, `jobTitle`, `description`, `startDate`, `endDate`, `hourlyWage`,
                                 `skills`, `location`, `deleted`, `datePosted`)
VALUES ('J1', 'Rcrt1', 'C1', 'Software Engineer', 'Develop software solutions.', '2024-01-15', '2024-07-15', 30,
        'Python, SQL', 'Boston', false, '2024-01-01'),
       ('J2', 'Rcrt2', 'C2', 'Data Analyst', 'Analyze data trends.', '2024-03-01', '2024-08-01', 25, 'R, Excel',
        'New York', false, '2024-02-01'),
       ('J3', 'Rcrt3', 'C3', 'Financial Advisor', 'Provide financial guidance.', '2024-04-01', '2024-10-01', 40,
        'Finance, Communication', 'Chicago', false, '2024-03-01');

INSERT IGNORE INTO `review` (`reviewId`, `jobListingId`, `studentId`, `anonymous`, `description`, `jobSatisfaction`, `hourlyWage`, `deleted`,
                             `datePosted`)
VALUES ('Rev1', 'J1', 'S1', true, 'Great experience.', 5, 30, false, '2024-05-01'),
       ('Rev2', 'J2', 'S2', false, 'Learned a lot.', 4, 25, false, '2024-06-01'),
       ('Rev3', 'J3', 'S3', true, 'Good pay, challenging work.', 3, 40, false, '2024-07-01');

INSERT IGNORE INTO `reviewResource` (`resourceId`, `reviewId`)
VALUES ('R1', 'Rev1'),
       ('R2', 'Rev2'),
       ('R3', 'Rev3');

INSERT IGNORE INTO `favoriteJobListings` (`studentId`, `jobListingId`)
VALUES ('S1', 'J1'),
       ('S2', 'J2'),
       ('S3', 'J3');

INSERT IGNORE INTO `flaggedReview` (`flaggedReviewId`, `reviewId`, `flaggedById`, `reason`, `dateFlagged`)
VALUES ('FR1', 'Rev1', 'Rcrt1', 'Inappropriate language', '2024-05-15'),
       ('FR2', 'Rev2', 'Rcrt2', 'Misleading content', '2024-06-15'),
       ('FR3', 'Rev3', 'Rcrt3', 'False information', '2024-07-15');

INSERT IGNORE INTO `sentJobListing` (`jobListingId`, `studentId`, `advisorCreatedId`)
VALUES ('J1', 'S1', 'Adv1'),
       ('J2', 'S2', 'Adv2'),
       ('J3', 'S3', 'Adv3');
