# MySQL-Database

## Data Types in SQL:

SQL Data Type is an attribute that specifies the type of data of any object. Each column, variable and expression has a related data type in SQL. You can use these data types while creating your tables.

1. Char(size) - A FIXED length string (can contain letters, numbers, and special characters). The size parameter specifies the column length in characters - can be from 0 to 255. Default is 1

2. VARCHAR(size) - A VARIABLE length string (can contain letters, numbers, and special characters). The size parameter specifies the maximum column length in characters - can be from 0 to 65535

3. INT (size) - A medium integer. Signed range is from -2147483648 to 2147483647. Unsigned range is from 0 to 4294967295. The size parameter specifies the maximum display width (which is 255)

4. INTEGER(size) - Equal to INT(size)

5. DATE - A date. Format: YYYY-MM-DD. The supported range is from '1000-01-01' to '9999-12-31'

6. FLOAT(n) - Floating precision number data from -1.79E + 308 to 1.79E + 308.The n parameter indicates whether the field should hold 4 or 8 bytes. FLOAT(24) holds a 4-byte field and FLOAT(53) holds an 8-byte field.

## DDL Commands:

DDL stands for data definition language. DDL Commands deal with the schema, i.e., the table in which our data is stored.

- Commands covered under DDL are:

1. CREATE
2. ALTER
3. DROP
4. TRUNCATE
5. RENAME

- Create Command:

It is used to create a new table in the database.

Syntax: CREATE TABLE TABLE_NAME (COLUMN_NAME DATATYPES);

```sql
Create Table Student(Name char(10),Roll_no int Primary key,age int,dob date);
```

- Insert Command:

It is used to insert values in a tables.

Syntax: Insert into table_name values(value1, value2);

```sql
Insert into Student values('Deepika', 102, 34,'1984-04-27');
Insert into Student values('Deepika', 106, 34, '1984-04-27');
Insert into Student values('Ankit', 103, 24, '2022-04-27');
Insert into Student values('Deepika', 104, 34,'2011-04-27');
Insert into Student values('Deepika', 105, 24,'1984-04-27');
```

- Select Command:

It is used to select the attribute based on the condition described by WHERE clause.

Syntax:

SELECT expressions
FROM TABLES
WHERE conditions;

```sql
-- Display the records of employees whose age is greater that 30.
select * from Student where age > 30;

-- Display the records of employees whose Roll_no is 102.
select * from Student where Roll_no = 102;
```

- ORDER BY:

The ORDER BY keyword is used to sort the result-set in ascending or descending order. The ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending order, use the DESC keyword.

Syntax:

SELECT coLumni, columnz, ...
FROM table_name
ORDER BY columni, columnz, ... ASC |DESC;

```sql
Select * from Student order by age;
Select * from student order by age desc;
```

- AND OR NOT:

1. The AND and OR operators are used to filter records based on more than one condition.
2. The AND operator displays a record if all the conditions separated by AND are TRUE.
3. The OR operator displays a record if any of the conditions separated by OR is TRUE.
4. The NOT operator displays a record if the condition(s) is NOT TRUE.

Syntax:

SELECT coLumni, coLumn2, ...
FROM table name
WHERE conditioni AND condition2 AND condition3;

SELECT coLumn, coLumn2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3;

ELECT columni, column2, ...
FROM table_name
WHERE NOT condition;

```sql
select name, Roll_no from Student where age=34 OR marks=78;
select name, Roll_no from Student where age=34 And marks=78;
Select * from Student where not marks=98;
```

- Min() and Max() functions:

1. The MIN() function returns the smallest value of the selected column.
2. The MAX() function returns the largest value of the selected column.

Syntax:

SELECT MIN(coLumn_name)
FROM table_name
WHERE condition;

SELECT MAX(column_name)
FROM table_name
WHERE condition;

Example:

```sql
select min(age) from Student;
Select max(age) from Student;
```
