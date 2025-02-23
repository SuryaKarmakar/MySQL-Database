CREATE DATABASE muj_institute;

USE muj_institute;

CREATE TABLE computer_dept(
    student_id VARCHAR(10),
    student_name VARCHAR(20),
    sex CHAR(1),
    phone_no VARCHAR(10),
    date_of_birth DATE,
    dept VARCHAR(10),
    address VARCHAR(50)
);

CREATE TABLE electronics_dept(
    student_id VARCHAR(10),
    student_name VARCHAR(20),
    sex CHAR(1),
    phone_no VARCHAR(10),
    date_of_birth DATE,
    dept VARCHAR(10),
    address VARCHAR(50)
);

CREATE TABLE mechanical_dept(
    student_id VARCHAR(10),
    student_name VARCHAR(20),
    sex CHAR(1),
    phone_no VARCHAR(10),
    date_of_birth DATE,
    dept VARCHAR(10),
    address VARCHAR(50)
);

SHOW TABLES;

# Get information about your Database and tables.
DESC computer_dept;
DESC electronics_dept;
DESC mechanical_dept;

# Add two new column in each table as Roll_number and Marks (in percentage or CGPA)
ALTER TABLE computer_dept ADD roll_number INT;
ALTER TABLE computer_dept ADD marks INT;

ALTER TABLE electronics_dept ADD roll_number INT;
ALTER TABLE electronics_dept ADD marks INT;

ALTER TABLE mechanical_dept ADD roll_number INT;
ALTER TABLE mechanical_dept ADD marks INT;

# Enter at least five tuples for each relation in each table.
INSERT INTO computer_dept
VALUES
('C101', 'Alice', 'F', "1234567890", '2000-01-01', 'cs', '123 Main St', 101, 88),
('C102', 'Bob', 'M', "1234567891", '1999-02-14', 'cs', '456 Elm St', 102, 91),
('C103', 'Charlie', 'M', "1234567892", '2001-03-20', 'cs', '789 Oak St', 103, 80),
('C104', 'David', 'M', "1234567893", '1998-07-15', 'cs', '321 Pine St', 104, 85),
('C105', 'Eva', 'F', "1234567894", '2000-05-10', 'cs', '654 Maple St', 105, 92);

INSERT INTO electronics_dept
VALUES
('E101', 'John', 'M', "2345678901", '2001-08-22', 'el', '123 Birch St', 201, 78),
('E102', 'Emma', 'F', "2345678902", '2000-12-11', 'el', '456 Cedar St', 202, 89),
('E103', 'Sophia', 'F', "2345678903", '2001-06-30', 'el', '789 Redwood St', 203, 84),
('E104', 'William', 'M', "2345678904", '1999-10-13', 'el', '321 Walnut St', 204, 91),
('E105', 'Liam', 'M', "2345678905", '2000-09-01', 'el', '654 Chestnut St', 205, 87);

INSERT INTO mechanical_dept
VALUES
('M101', 'Michael', 'M', "3456789012", '2001-04-02', 'me', '123 Maple St', 301, 76),
('M102', 'Olivia', 'F', "3456789013", '2000-01-05', 'me', '456 Pine St', 302, 84),
('M103', 'Lucas', 'M', "3456789014", '1999-11-18', 'me', '789 Oak St', 303, 92),
('M104', 'Amelia', 'F', "3456789015", '2000-07-28', 'me', '321 Cedar St', 304, 90),
('M105', 'James', 'M', "3456789016", '1999-09-14', 'me', '654 Birch St', 305, 80);

SELECT * FROM computer_dept;
SELECT * FROM electronics_dept;
SELECT * FROM mechanical_dept;

# Delete the column Phone_no. in any one table.
ALTER TABLE computer_dept DROP COLUMN phone_no;

SET SQL_SAFE_UPDATES = 0;

# Update any one table for column with certain roll number and address.
UPDATE electronics_dept SET address = "999 New Address St" WHERE roll_number = 201;

# Modify existing column with new data type.
ALTER TABLE mechanical_dept MODIFY marks DECIMAL;

# Delete any one tuples from any two tables with Marks less than certain value (say 85%)
DELETE FROM electronics_dept WHERE marks < 85;
DELETE FROM mechanical_dept WHERE marks < 85 LIMIT 1;

# Drop any one table (say student table of Mechanical Dept.)
DROP TABLE mechanical_dept;

# Get the table with only two columns: name and age.
SELECT student_name, TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age
FROM computer_dept;

SELECT student_name, TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age
FROM electronics_dept;