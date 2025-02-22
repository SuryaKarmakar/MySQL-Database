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
VALUE(1, "abc", 25, "New Delhi", 5);

# insert multiple data
INSERT INTO employee
VALUES
(2, "xyz", 27, "Mumbai", 7),
(3, "pqr", 30, "Kolkata", 5);

# read all data
SELECT * FROM employee;

# update column data
UPDATE employee SET name = "abcd" WHERE id = 1;

# delete a row
DELETE FROM employee WHERE id = 3;

# delete all rows
DELETE FROM employee;
```
