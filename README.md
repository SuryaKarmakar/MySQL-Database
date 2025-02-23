# MySQL-Database

## DDL Commands:

```sql
# show all exesting databases
SHOW DATABASES;

# create new database
CREATE DATABASE company;

# use database
USE company;

# create table
CREATE TABLE employee(
    id INT,
    name VARCHAR(20),
    address VARCHAR(100)
);

# show all tables into current database
SHOW TABLES;

# see table schema
DESC employee;

# update table schema
ALTER TABLE employee ADD PRIMARY KEY (id);

# add new attribute
ALTER TABLE employee ADD age INT;

# delete attribute
ALTER TABLE employee DROP age;

# modify data type
ALTER TABLE employee ADD phone_no INT;
ALTER TABLE employee MODIFY phone_no VARCHAR(10);

# remove table
DROP TABLE employee;

# remove database
DROP DATABASE company;
```

## DML Commands:

```sql
CREATE DATABASE company;

USE company;

CREATE TABLE employee(
    id INT,
    name VARCHAR(10),
    age INT,
    address VARCHAR(100),
    dept_no INT
);

DESC employee;

# insert data into table
INSERT INTO employee
VALUE(1, "Alice", 25, "123 Main St", 1);

# insert data into specific attribute
INSERT INTO employee (id, name, age, dept_no)
VALUE(2, "David", 26, 2);

# insert NULL value
INSERT INTO employee
VALUE(3, "Eva", NULL, NULL, 2);

# insert multiple data
INSERT INTO employee
VALUES
(4, "Bob", 27, "456 Elm St", 7),
(5, "Charlie", 30, "789 Oak St", 5);

# read all data
SELECT * FROM employee;

# update column data
UPDATE employee SET name = "abcd" WHERE id = 1;

# delete a row
DELETE FROM employee WHERE id = 3;

# delete all rows
DELETE FROM employee;
```

## Basic Select Query:

```sql
-- the ORDER BY is used to sort the result-set in ascending or descending order. by default its use ascending order.
USE collage;
SELECT * FROM student;

SELECT * FROM student ORDER BY avg_m ASC;
SELECT * FROM student ORDER BY avg_m DESC;

-- AND and OR operators are used to filter records based on more than one condition.
SELECT * FROM student WHERE avg_m > 50 AND total > 150;
SELECT * FROM student WHERE avg_m > 80 OR total > 100;
SELECT * FROM student WHERE NOT class = "first";

-- MIN fuction returns the smallest value and MAX returns the largest value.
SELECT MAX(avg_m) FROM student;
SELECT MIN(avg_m) FROM student;

-- LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
-- % represents zero, one or multiple character.
-- _ represents one or single character.
SELECT * FROM student WHERE s_name LIKE 'A%'; -- start with A
SELECT * FROM student WHERE s_name LIKE '%e'; -- end with e
SELECT * FROM student WHERE s_name LIKE 'J%n'; -- stared with J and ended with n
SELECT * FROM student WHERE s_name LIKE '%hn%'; -- hn in any position
SELECT * FROM student WHERE s_name LIKE '____________%'; -- name should be atlest 12 character or more

-- IN operator allows you to specify multiple values in a WHERE clause.
-- IN operator is a shorthand for multiple OR conditions.
SELECT * FROM student WHERE s_name IN('John Doe', 'Alice Smith');

-- BETWEEN operator selects values within a given range. the values can be numbers, text or dates.
-- BETWEEN operator is inclusive begin and end values are included.
SELECT * FROM student WHERE total BETWEEN 150 AND 200;

```
