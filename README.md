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

```sql
USE collage;
CREATE TABLE student;

CREATE TABLE student(
    id INT PRIMARY KEY,
    age INT,
    ph_no VARCHAR(10)
);

INSERT INTO student
VALUES
(1, 25, "9007505188"),
(2, 26, "9007505177"),
(3, 25, "9007505166");

SELECT * FROM student;

-- ALTER TABLE statement is used to add, delete or modify columns in an existing table.
-- ALTER TABLE statement is also used to add and drop various constraints on an existing table.

-- To add a column in a table:
ALTER TABLE student ADD COLUMN name VARCHAR(20);

-- To drop a column:
ALTER TABLE student DROP COLUMN age;

-- To chnage / modify the data type of column in a table:
ALTER TABLE student MODIFY COLUMN marks VARCHAR(10);

-- rename column name
ALTER TABLE student RENAME COLUMN ph_no TO phone_no;

-- UPDATE statement is used to modify the existing record is a table.
UPDATE student SET name = "abc" WHERE id = 1;
UPDATE student SET name = "xyz" WHERE id = 2;
UPDATE student SET name = "pqr" WHERE id = 3;

-- DELETE statement is used to delete existing records in a table.
DELETE FROM student WHERE id = 3;

-- DROP TABLE statement is used to drop an existing table in a database.
DROP TABLE student;

-- DISTINCT statement is used to retrive unique values from a specific column in a table.
SELECT DISTINCT age FROM student;

-- A view is a virtual table based on the result of a SELECT query.
-- It allows you to simplify complex queries, encapsulate logic, and present a subset or transformation of the data to ysers without exposing the underlying table structure.
CREATE VIEW student_view as SELECT * FROM student;
CREATE OR REPLACE VIEW student_view as SELECT id, ph_no FROM student WHERE age = 25;

SELECT * FROM student_view;

-- GROUP BY clause is a SQL command that is used to group rows that have the same values.
SELECT age, COUNT(*) AS student_count FROM student GROUP BY age;

SELECT age, COUNT(*) AS student_count FROM student GROUP BY age HAVING age = 25; -- grouping age having only 25.

-- A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table.
-- The table with the foreign key is called the child table, and the table with the primary key is called the referenced or parent table.
CREATE TABLE course(
    cid INT PRIMARY KEY,
    cname VARCHAR(20),
    sid INT,
    FOREIGN KEY(sid) REFERENCES student(id) ON DELETE CASCADE
);

INSERT INTO course
VALUES
(1, "DBMS", 1),
(2, "OPPS", 2),
(3, "C++", 3);

SELECT * FROM course;

SELECT name, cname FROM student as st, course as c WHERE st.id = c.sid;
-- OR
SELECT st.name, c.cname  FROM student AS st
INNER JOIN course AS c
ON st.id = c.sid;

-- A subquery, also known as a nested query or inner query, is a query embedded within another query.
-- It can be used to retrieve data that will be used in the main query as a condition to further restrict the data to be retrieved.
-- Subqueries can be used in various parts of a SQL statement, including the SELECT, FROM, WHERE, and HAVING clauses.

SELECT name FROM student WHERE id = (SELECT sid FROM course WHERE cname = "OPPS");

SELECT name FROM student WHERE id NOT IN(SELECT sid FROM course WHERE cname = "OPPS");

```

## Joins:

```sql
-- Joins
-- A JOIN clause is used to combine rows from or more tables, based on a related column between then.
CREATE TABLE student2(
    roll_no INT PRIMARY KEY,
    name VARCHAR(20),
    address VARCHAR(20),
    phone_no VARCHAR(10),
    age INT
);

INSERT INTO student2
VALUES
(1, "Harsh", "Delhi", "9999999999", 18),
(2, "Pratik", "Bihar", "8888888888", 19),
(3, "Riyanka", "Siliguri", "7777777777", 20),
(4, "Deep", "Ramnagar", "6666666666", 18),
(5, "Saptarhi", "Kolkata", "5555555555", 19),
(6, "Rohit", "Alipur", "4444444444", 18),
(7, "Niraj", "Delhi", "3333333333", 20);

SELECT * FROM student2;

CREATE TABLE course(
    c_id INT PRIMARY KEY,
    name VARCHAR(20),
    roll_no INT,
    FOREIGN KEY (roll_no) REFERENCES student2(roll_no)
);

INSERT INTO course
VALUES
(1, "MCA", 1),
(2, "BCA", 2),
(3, "BBA", 3),
(4, "BTECH", 4),
(5, "MBA", 5),
(6, "MTECH", NULL);

SELECT * FROM course;

-- 1. EQUI JOIN
-- show student details with course name.
SELECT *
FROM student2 AS s
JOIN course AS c
ON c.roll_no = s.roll_no;

SELECT s.name, c.name
FROM student2 AS s
JOIN course AS c
ON c.roll_no = s.roll_no;

-- 2. INNER JOIN: this selects all rows from both the tables as long as the condiotion is satisfied.
-- this join will create the result-set by combining all rows from both the tables where the condiotion satisfies that is value of the common field will be the same.
SELECT c.c_id, c.name, s.name, s.age
FROM student2 AS s
INNER JOIN course AS c
ON c.roll_no = s.roll_no;

-- 3. LEFT OUTER JOIN: left join returns all the rows of the table on the left side of the join and matches rows for the table on the right side of the join.
-- left table <LEFT JOIN> right table.
SELECT s.name, c.name
FROM student2 AS s -- left table
LEFT JOIN course AS c -- right table
ON s.roll_no = c.roll_no;

-- 4. RIGHT OUTER JOIN: right join returns all the rows of the table on the right side of the join and matching rows for the table on the left of the join.
-- it is very similar to LEFT JOIN for the rows for which there is no matching row on the left side, the result-set will contain null.
SELECT s.name, c.name
FROM student2 AS s
RIGHT JOIN course AS c
ON s.roll_no = c.roll_no;

-- result will be same as right join.
SELECT s.name, c.name
FROM course AS c
LEFT JOIN student2 AS s
ON s.roll_no = c.roll_no;

-- FULL OUTER JOIN: full join creates the result-set by combining results of both LEFT and RIGHT JOIN.
-- the result-set will contain all the rows from both tables. for the rows for there is no matching, the result-set will contain NULL values.
SELECT student2.name, course.name
FROM student2
FULL JOIN course
ON student2.roll_no = course.roll_no;

-- uisng both join to make full join.
SELECT s.name, c.name
FROM student2 s
LEFT JOIN course c ON s.roll_no = c.roll_no
UNION
SELECT s.name, c.name
FROM student2 s
RIGHT JOIN course c ON s.roll_no = c.roll_no;
```

```sql
USE muj;
DROP TABLE student;

CREATE TABLE student(
id INT PRIMARY KEY,
    age INT,
    ph_no VARCHAR(10)
);

INSERT INTO student
VALUES
(1, 25, "9007505188"),
(2, 26, "9007505177"),
(3, 25, "9007505166");

SELECT * FROM student;

-- ALTER TABLE statement is used to add, delete or modify columns in an existing table.
-- ALTER TABLE statement is also used to add and drop various constraints on an existing table.

-- To add a column in a table:
ALTER TABLE student ADD COLUMN name VARCHAR(20);

-- To drop a column:
ALTER TABLE student DROP COLUMN age;

-- To chnage / modify the data type of column in a table:
ALTER TABLE student MODIFY COLUMN marks VARCHAR(10);

-- rename column name
ALTER TABLE student RENAME COLUMN ph_no TO phone_no;

-- UPDATE statement is used to modify the existing record is a table.
UPDATE student SET name = "abc" WHERE id = 1;
UPDATE student SET name = "xyz" WHERE id = 2;
UPDATE student SET name = "pqr" WHERE id = 3;

-- DELETE statement is used to delete existing records in a table.
DELETE FROM student WHERE id = 3;

-- DROP TABLE statement is used to drop an existing table in a database.
DROP TABLE student;

-- DISTINCT statement is used to retrive unique values from a specific column in a table.
SELECT DISTINCT age FROM student;

-- A view is a virtual table based on the result of a SELECT query.
-- It allows you to simplify complex queries, encapsulate logic, and present a subset or transformation of the data to ysers without exposing the underlying table structure.
CREATE VIEW student_view as SELECT * FROM student;
CREATE OR REPLACE VIEW student_view as SELECT id, ph_no FROM student WHERE age = 25;

SELECT * FROM student_view;

-- GROUP BY clause is a SQL command that is used to group rows that have the same values.
SELECT age, COUNT(*) AS student_count FROM student GROUP BY age;

SELECT age, COUNT(*) AS student_count FROM student GROUP BY age HAVING age = 25; -- grouping age having only 25.

-- A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table.
-- The table with the foreign key is called the child table, and the table with the primary key is called the referenced or parent table.
CREATE TABLE course(
cid INT PRIMARY KEY,
    cname VARCHAR(20),
    sid INT,
    FOREIGN KEY(sid) REFERENCES student(id) ON DELETE CASCADE
);

INSERT INTO course
VALUES
(1, "DBMS", 1),
(2, "OPPS", 2),
(3, "C++", 3);

SELECT * FROM course;

SELECT name, cname FROM student as st, course as c WHERE st.id = c.sid;
-- OR
SELECT st.name, c.cname  FROM student AS st
INNER JOIN course AS c
ON st.id = c.sid;

-- A subquery, also known as a nested query or inner query, is a query embedded within another query.
-- It can be used to retrieve data that will be used in the main query as a condition to further restrict the data to be retrieved.
-- Subqueries can be used in various parts of a SQL statement, including the SELECT, FROM, WHERE, and HAVING clauses.

SELECT name FROM student WHERE id = (SELECT sid FROM course WHERE cname = "OPPS");

SELECT name FROM student WHERE id NOT IN(SELECT sid FROM course WHERE cname = "OPPS");
```
