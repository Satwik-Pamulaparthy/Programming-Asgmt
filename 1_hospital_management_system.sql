DROP DATABASE IF EXISTS hw3_hms;
CREATE DATABASE hw3_hms;
USE hw3_hms;

-- DDL section
-- Please maintain the order of all tables as shown in the code below, as the autograder will evaluate each table in this exact sequence. 

-- Task 1.1: Create tables: Department, Ward, Patient, Doctor, Diagnosis.
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    dept_address VARCHAR(100),
    dept_phone VARCHAR(15)
);

CREATE TABLE Ward (
    ward_id INT,
    bed_id INT,
    dept_id INT,
    PRIMARY KEY (ward_id, bed_id)
);

CREATE TABLE Patient (
    record_id INT PRIMARY KEY,
    name VARCHAR(50),
    gender CHAR(1),
    ward_id INT 
);

CREATE TABLE Doctor (
    work_id INT PRIMARY KEY,
    name VARCHAR(50),
    title VARCHAR(50),
    age INT,
    dept_id INT
);

CREATE TABLE Composition (
    ward_id INT,
    dept_id INT,
    PRIMARY KEY (ward_id, dept_id),
    FOREIGN KEY (ward_id) REFERENCES Ward(ward_id),
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);
CREATE TABLE Admission (
    record_id INT,
    ward_id INT,
    bed_id INT,
    PRIMARY KEY (record_id, ward_id, bed_id),
    FOREIGN KEY (record_id) REFERENCES Patient(record_id),
    FOREIGN KEY (ward_id, bed_id) REFERENCES Ward(ward_id, bed_id)
);

CREATE TABLE Diagnosis (
    record_id INT,
    work_id INT,
    PRIMARY KEY (record_id, work_id),
    FOREIGN KEY (record_id) REFERENCES Patient(record_id),
    FOREIGN KEY (work_id) REFERENCES Doctor(work_id)
);

-- Output (please maintain the order of columns):
-- Department table: dept_id, dept_name, dept_address, dept_phone
-- Ward table: ward_id, bed_id, dept_id
-- Patient table: record_id, name, gender, ward_id
-- Doctor table: work_id, name, title, age, dept_id 
-- Diagnosis table: work_id, record_id

-- DML section:

-- Task 1.2: Insert Data
INSERT INTO Department (dept_id, dept_name, dept_address, dept_phone)
VALUES 
(1, 'Cardiology', '1st Floor, Building A', '555-1234'),
(2, 'Neurology', '1st Floor, Building B', '555-9876');

INSERT INTO Ward (ward_id, bed_id, dept_id)
VALUES 
(1, 101, 1),
(2, 102, 1),
(3, 201, 2);

INSERT INTO Patient (record_id, name, gender,ward_id)
VALUES 
(1, 'Alice Smith', 'F', 1),
(2, 'Bob Jones', 'M', NULL),
(3, 'Charlie Brown', 'M', 3);

INSERT INTO Doctor (work_id, name, title, age, dept_id)
VALUES 
(1, 'Dr. Smith', 'Cardiologist', 45, 1),
(2, 'Dr. Emily White', 'Cardiologist', 38, 1),
(3, 'Dr. John Doe', 'Neurologist', 42, 2);

INSERT INTO Diagnosis (record_id, work_id)
VALUES 
(1, 1),
(2, 2);


-- Display all tables after Task 1.2
SELECT * FROM Department;
SELECT * FROM Ward;
SELECT * FROM Patient;
SELECT * FROM Doctor;
SELECT * FROM Diagnosis;


-- Task 1.3: Update tables
UPDATE Department
SET dept_phone = '555-2345'
WHERE dept_id = 1;

UPDATE Doctor
SET dept_id = 2
WHERE work_id = 1;

SET SQL_SAFE_UPDATES = 0;

UPDATE Patient
SET name = 'Alice Johnson'
WHERE name = 'Alice Smith';

-- Display all tables after Task 1.3
SELECT * FROM Department;
SELECT * FROM Ward;
SELECT * FROM Patient;
SELECT * FROM Doctor;
SELECT * FROM Diagnosis;


-- Task 1.4: Delete operations

DELETE FROM Diagnosis
WHERE work_id = 1;

DELETE FROM Doctor
WHERE work_id = 1;

DELETE FROM Patient
WHERE name = 'Charlie Brown';

-- Display all tables after Task 1.4
SELECT * FROM Department;
SELECT * FROM Ward;
SELECT * FROM Patient;
SELECT * FROM Doctor;
SELECT * FROM Diagnosis;
