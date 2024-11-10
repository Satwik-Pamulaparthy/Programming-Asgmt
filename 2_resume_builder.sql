DROP DATABASE IF EXISTS hw3_resume_builder;
CREATE DATABASE hw3_resume_builder;
USE hw3_resume_builder;

-- DDL section

-- Task 2.1: Create tables: User, Resume, Experience, Education, Skill, Resume_Skill
-- Please maintain the order of all tables as shown in the code below, as the autograder will evaluate each table in this exact sequence.
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Resume (
    resume_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

CREATE TABLE Experience (
    experience_id INT AUTO_INCREMENT PRIMARY KEY,
    resume_id INT NOT NULL,
    company VARCHAR(100) NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (resume_id) REFERENCES Resume(resume_id) ON DELETE CASCADE
);

-- Education table
CREATE TABLE Education (
    education_id INT AUTO_INCREMENT PRIMARY KEY,
    resume_id INT NOT NULL,
    institution VARCHAR(100) NOT NULL,
    degree VARCHAR(100) NOT NULL,
    graduation_year YEAR,
    FOREIGN KEY (resume_id) REFERENCES Resume(resume_id) ON DELETE CASCADE
);

-- Skill table
CREATE TABLE Skill (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(100) NOT NULL UNIQUE
);

-- Resume_Skill table (many-to-many relationship between Resume and Skill)
CREATE TABLE Resume_Skill (
    resume_id INT NOT NULL,
    skill_id INT NOT NULL,
    PRIMARY KEY (resume_id, skill_id),
    FOREIGN KEY (resume_id) REFERENCES Resume(resume_id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES Skill(skill_id) ON DELETE CASCADE
);
-- Output (please maintain the order of columns):
-- User: user_id, name, email
-- Resume: resume_id, title, user_id
-- Experience: experience_id, resume_id, company, job_title, start_date, end_date
-- Education: education_id, resume_id, institution, degree, graduation_year
-- Skill: skill_id, skill_name
-- Resume_Skill: resume_id, skill_id

-- DML section:

-- Task 2.2: Insert Data
INSERT INTO User (user_id, name, email) VALUES 
(1, 'Alice', 'alice@example.com'),
(2, 'Bob', 'bob@example.com'),
(3, 'Eve', 'eve@example.com');

INSERT INTO Resume (resume_id, title, user_id) VALUES 
(1, 'Software Developer Resume', 1),
(2, 'Security Specialist Resume', 3);


INSERT INTO Education (education_id, resume_id, institution, degree, graduation_year) VALUES 
(1, 1, 'UIC', 'B.Sc. Computer Science', 2023),
(2, 1, 'Advanced Coding Bootcamp', 'Software Engineering Certification', 2024),
(3, 2, 'BU', 'B.Sc. Cybersecurity', 2023);

INSERT INTO Experience (experience_id, resume_id, company, job_title, start_date, end_date) VALUES 
(1, 2, 'AOL', 'Cybersecurity Analyst', '2024-05-01', '2024-11-01');


INSERT INTO Skill (skill_id, skill_name) VALUES 
(1, 'Python'),
(2, 'SQL'),
(3, 'Cybersecurity');


INSERT INTO Resume_Skill (resume_id, skill_id) VALUES 
(1, 1),  -- Alice with Python
(2, 2),  -- Eve with SQL
(2, 3);  -- Eve with Cybersecurity
-- Display all tables after Task 2.2
SELECT * FROM User;
SELECT * FROM Resume;
SELECT * FROM Education;
SELECT * FROM Experience;
SELECT * FROM Skill;
SELECT * FROM Resume_Skill;

-- Display all tables after Task 2.2
SELECT * FROM User;
SELECT * FROM Resume;
SELECT * FROM Education;
SELECT * FROM Experience;
SELECT * FROM Skill;
SELECT * FROM Resume_Skill;

-- Task 2.3: Update tables
UPDATE Education
SET degree = 'Advanced Software Engineering Certification'
WHERE education_id = 2;

UPDATE Experience
SET job_title = 'Lead Cybersecurity Analyst'
WHERE experience_id = 1;

-- Display all tables after Task 2.3
SELECT * FROM User;
SELECT * FROM Resume;
SELECT * FROM Education;
SELECT * FROM Experience;
SELECT * FROM Skill;
SELECT * FROM Resume_Skill;
-- Display all tables after Task 2.3
SELECT * FROM User;
SELECT * FROM Resume;
SELECT * FROM Education;
SELECT * FROM Experience;
SELECT * FROM Skill;
SELECT * FROM Resume_Skill;

-- Task 2.4: Delete operations
DELETE FROM User
WHERE name = 'Bob';

DELETE FROM Skill
WHERE skill_name = 'SQL';

-- Display all tables after Task 2.4
SELECT * FROM User;
SELECT * FROM Resume;
SELECT * FROM Education;
SELECT * FROM Experience;
SELECT * FROM Skill;
SELECT * FROM Resume_Skill;
