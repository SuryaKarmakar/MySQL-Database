# Create a new table. ---------------------------------------------
-- CREATE TABLE <tablename>( 
-- Column1 data type (size) [null/not null]  
-- Column2 data type (size),
-- );
CREATE TABLE employee(
emp_no INT NOT NULL,
emp_name VARCHAR(100),
designation VARCHAR(50),
salary INT,
emp_dob DATE
);

# Insert data into a table. ---------------------------------------------
-- INSERT INTO <tablename>
-- VALUES (value1, value 2);
INSERT INTO employee
VALUES(1, "Surya Karmakar", "Software Developer", 1000, "1999-12-14");
INSERT INTO employee
VALUES(3, "Avijit Mondal", "Software Developer", 2000, "1988-05-25", "8765456786");
INSERT INTO employee
VALUES(4, "Rohan", "Web Developer", 1400, "1988-03-17", "7656765678");

-- Insert data into a specific coloumn
INSERT INTO employee(emp_no, emp_name, emp_dob)
VALUES(2, "Gourav Sarkar", "1970-05-25");

# Delete record/row from table. ---------------------------------------------
-- DELETE FROM <tablename> 
-- WHERE <condition> 
DELETE FROM employee 
WHERE emp_no = 2;

# Destroying table/database schema. ---------------------------------------------
-- DROP TABLE <Table Name>
DROP TABLE employee;

# Alter table or add new attribute to a table. ---------------------------------------------
-- ALTER TABLE <tablename>
-- ADD <coloumn_name> data_type
ALTER TABLE employee
MODIFY phone_no VARCHAR(10);

# Select statement. ---------------------------------------------
-- SELECT <column_list>  
-- FROM <table_list> 
-- WHERE <search_criteria> 

-- An asterisk (*) is used to retrieve all columns from the table
SELECT * FROM employee;

SELECT emp_name, emp_dob
FROM employee
WHERE salary > 500;

# Subquery ---------------------------------------------
-- SELECT <column_list>  
-- FROM <table_list> 
-- WHERE <search_criteria>
-- (SELECT <column_list>  
-- FROM <table_list> 
-- WHERE <search_criteria>)

-- The inner query is executed firstly and then the result is followed by the outer query.
-- Display the employees whose designation is the same as that of employee 1 
SELECT * FROM employee
WHERE designation = (
SELECT designation FROM employee
WHERE emp_no = 1
);

# Funcation. ---------------------------------------------
-- COUNT
SELECT COUNT(*)
FROM employee;

-- SUM, AVG, MAX, MIN
SELECT SUM(salary) AS total_salary,
MAX(salary) AS maximum_salary,
MIN(salary) AS minimum_salary,
AVG(salary) AS avarage_salary
FROM employee;

# Grouping multiple column. ---------------------------------------------
SELECT designation, SUM(salary) AS total_salary, COUNT(*) AS total_row
FROM employee
GROUP BY designation;

# Update row. ---------------------------------------------
-- UPDATE table_name SET attribute = newvalue WHERE condition; 
UPDATE employee 
SET designation = "Team Lead", salary = 3000
WHERE emp_no = 2;

SET SQL_SAFE_UPDATES = 0;
