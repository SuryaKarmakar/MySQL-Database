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
ADD phone_no INT;
