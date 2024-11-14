CREATE DATABASE IF NOT EXISTS BLOG;
USE BLOG;

CREATE TABLE IF NOT EXISTS users
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    username     VARCHAR(30) UNIQUE NOT NULL,
    firstName    VARCHAR(50),
    middleName   VARCHAR(50),
    lastName     VARCHAR(50),
    mobile       VARCHAR(15)        NOT NULL,
    email        VARCHAR(75)        NOT NULL,
    passwordHash VARCHAR(128)       NOT NULL,
    registeredAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt    DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    lastLogin    DATETIME,
    intro        TINYTEXT,
    profile      TEXT,
    active       BOOLEAN  DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS posts
(
    id               INT PRIMARY KEY AUTO_INCREMENT,
    authorId         INT,
    title            VARCHAR(75),
    metaTitle        VARCHAR(100),
    slug             VARCHAR(100) NOT NULL,
    summary          TINYTEXT,
    generatedSummary VARCHAR(1500),
    published        TINYINT(1)   NOT NULL,
    createdAt        DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt        DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    publishedAt      DATETIME,
    content          TEXT,
    FOREIGN KEY (authorId) REFERENCES users (id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS post_comments
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    postId      INT,
    title       VARCHAR(100) NOT NULL,
    published   TINYINT(1)   NOT NULL,
    createdAt   DATETIME DEFAULT CURRENT_TIMESTAMP,
    publishedAt DATETIME,
    content     TEXT,
    FOREIGN KEY (postId) REFERENCES posts (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tags
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    title     VARCHAR(75)  NOT NULL,
    metaTitle VARCHAR(100),
    slug      VARCHAR(100) NOT NULL,
    content   TEXT
);

CREATE TABLE IF NOT EXISTS categories
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    title     VARCHAR(75)  NOT NULL,
    metaTitle VARCHAR(100),
    slug      VARCHAR(100) UNIQUE NOT NULL,
    content   TEXT
);

CREATE TABLE IF NOT EXISTS post_tags
(
    postId INT,
    tagId  INT,
    PRIMARY KEY (postId, tagId),
    FOREIGN KEY (postId) REFERENCES posts (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (tagId) REFERENCES tags (id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS post_categories
(
    postId     INT,
    categoryId INT,
    PRIMARY KEY (postId, categoryId),
    FOREIGN KEY (postId) REFERENCES posts (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (categoryId) REFERENCES categories (id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

INSERT IGNORE INTO users (username, firstName, middleName, lastName, mobile, email, passwordHash, lastLogin, intro,
                   profile, active)
VALUES ('aaryan123', 'Aaryan', NULL, 'Jain', '1234567890', 'aaryan@gmail.com', 'aaryan123', '2024-10-16 08:00:00',
        'Hi, my name is Aaryan.', 'Introduction for Aaryan.', TRUE),
       ('bob123', 'Bob', NULL, 'Smith', '2345678901', 'bob@gmail.com', 'bob123', '2024-10-16 09:00:00',
        'Hi, my name is Bob.', 'Introduction for Bob.', TRUE),
       ('steve123', 'Steve', NULL, 'Jobs', '3456789012', 'steve@gmail.com', 'steve123', '2024-10-16 10:00:00',
        'Hi, my name is Steve.', 'Introduction for Steve.', TRUE),
       ('lauren123', 'Lauren', NULL, 'Wang', '4567890123', 'lauren@gmail.com', 'lauren123', '2024-10-16 11:00:00',
        'Hi, my name is Lauren.', 'Introduction for Lauren.', TRUE);

INSERT IGNORE INTO tags(title, metaTitle, slug, content)
VALUES ('Technology', 'All about technology', 'technology',
        'Posts about technology.'),
       ('Health', 'Health and Wellness', 'health',
        'Posts about health.');

INSERT IGNORE INTO categories(title, metaTitle, slug, content)
VALUES ('Lifestyle', 'Lifestyle Tips and Trends', 'lifestyle',
        'Lifestyle posts.'),
       ('Science', 'Science News and Updates', 'science',
        'Science posts.');

INSERT IGNORE INTO posts (authorId, title, metaTitle, slug, summary, generatedSummary, published, publishedAt, content)
VALUES (1, 'post 1', 'post 1 meta title', 'post1', 'Summary of post 1', 'generated summary of post 1', 1,
        '2024-10-16 12:00:00', 'post 1 content.'),
       (1, 'post 2', 'post 2 meta title', 'post1', 'Summary of post 2', 'generated summary of post 2', 1,
        '2024-10-16 12:00:00', 'post 2 content.'),
       (2, 'post 3', 'post 3 meta title', 'post1', 'Summary of post 3', 'generated summary of post 3', 1,
        '2024-10-16 12:00:00', 'post 3 content.'),
       (1, 'post 4', 'post 4 meta title', 'post1', 'Summary of post 4', 'generated summary of post 4', 1,
        '2024-10-16 12:00:00', 'post 4 content.'),
       (2, 'post 5', 'post 5 meta title', 'post1', 'Summary of post 5', 'generated summary of post 5', 1,
        '2024-10-16 12:00:00', 'post 5 content.'),
       (1, 'post 6', 'post 6 meta title', 'post1', 'Summary of post 6', 'generated summary of post 6', 1,
        '2024-10-16 12:00:00', 'post 6 content.');

INSERT IGNORE INTO post_tags(postId, tagId)
VALUES (1, 1),
       (1, 2),
       (2, 1),
       (2, 2),
       (3, 1),
       (3, 2),
       (4, 1),
       (4, 2),
       (5, 1),
       (5, 2),
       (6, 1),
       (6, 2);

INSERT IGNORE INTO post_categories(postId, categoryId)
VALUES (1, 1),
       (2, 1),
       (3, 2),
       (4, 2),
       (5, 1),
       (6, 2);

INSERT IGNORE INTO post_comments (postId, title, published, publishedAt, content)
VALUES (1, 'comment 1', 1, '2024-10-16 15:00:00', 'comment 1 info'),
       (1, 'comment 2', 1, '2024-10-16 15:30:00', 'comment 2 info'),
       (2, 'comment 3', 1, '2024-10-16 16:00:00', 'comment 3 info'),
       (2, 'comment 4', 1, '2024-10-16 16:15:00', 'comment 4 info'),
       (3, 'comment 5', 1, '2024-10-16 16:30:00', 'comment 5 info'),
       (3, 'comment 6', 1, '2024-10-16 16:45:00', 'comment 6 info');
