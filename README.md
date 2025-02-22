# MySQL-Database

## DDL Command:

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
