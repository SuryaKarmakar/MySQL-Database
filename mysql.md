# MySQL-Database

## SQL(Structured Query Language):

SQL is a standard language for storing, manipulating and retrieving data in database.

SQL commands are instruction. it is used to communicate with the database. it is also used to perform various taska like create a table, add data to tables, drop the table, modify the table, set permission for users etc.

## SQL Commands:

- DDL

1. Create
2. Drop
3. Alter
4. Truncate

- DML

1. Insert
2. Update
3. Delete

- DCL

1. Grant
2. Revoke

- TCL

1. Commit
2. Rollback
3. SavePoint

- DQL

1. Select

## Data Types in SQL:

SQL Data Type is an attribute that specifies the type of data of any object. Each column, variable and expression has a related data type in SQL. You can use these data types while creating your tables.

1. Char(size) - A FIXED length string (can contain letters, numbers, and special characters). The size parameter specifies the column length in characters - can be from 0 to 255. Default is 1

2. VARCHAR(size) - A VARIABLE length string (can contain letters, numbers, and special characters). The size parameter specifies the maximum column length in characters - can be from 0 to 65535

3. INT (size) - A medium integer. Signed range is from -2147483648 to 2147483647. Unsigned range is from 0 to 4294967295. The size parameter specifies the maximum display width (which is 255)

4. INTEGER(size) - Equal to INT(size)

5. DATE - A date. Format: YYYY-MM-DD. The supported range is from '1000-01-01' to '9999-12-31'

6. FLOAT(n) - Floating precision number data from -1.79E + 308 to 1.79E + 308.The n parameter indicates whether the field should hold 4 or 8 bytes. FLOAT(24) holds a 4-byte field and FLOAT(53) holds an 8-byte field.

## Create Command:

It is used to create a new table in the database.

Syntax: CREATE TABLE TABLE_NAME (COLUMN_NAME DATATYPES);

```sql
Create Table Student(Name char(10), Roll_no int Primary key, age int, dob date);
```

## Insert Command:

It is used to insert values in a tables.

Syntax: Insert into table_name values(value1, value2);

```sql
Insert into Student values('Deepika', 102, 34,'1984-04-27');
Insert into Student values('Deepika', 106, 34, '1984-04-27');
Insert into Student values('Ankit', 103, 24, '2022-04-27');
Insert into Student values('Deepika', 104, 34,'2011-04-27');
Insert into Student values('Deepika', 105, 24,'1984-04-27');
```

## Select Command:

It is used to select the attribute based on the condition described by WHERE clause.

Syntax:

SELECT expressions
FROM TABLES
WHERE conditions;

```sql
select * from Student where age > 30;
select * from Student where Roll_no = 102;
```

## ORDER BY:

The ORDER BY keyword is used to sort the result-set in ascending or descending order. The ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending order, use the DESC keyword.

Syntax:

SELECT coLumn1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC | DESC;

```sql
Select * from Student order by age;
Select * from student order by age desc;
```

## Logical Operators:

1. The AND operator displays a record if all the conditions separated by AND are TRUE.
2. The OR operator displays a record if any of the conditions separated by OR is TRUE.
3. The NOT operator displays a record if the condition(s) is NOT TRUE.

Syntax:

SELECT column1, column2, ...
FROM table name
WHERE condition1 AND condition2 AND condition3;

SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3;

SELECT column1, column2, ...
FROM table_name
WHERE NOT condition;

```sql
select name, Roll_no from Student where age=34 OR marks=78;
select name, Roll_no from Student where age=34 And marks=78;
Select name, Roll_no from Student where not marks=98;
```

## Min() and Max() functions:

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

## Like Operator:

The LIKE operator is used in a WHERE clause to search for a specified pattern in a column. There are two wildcards often used in conjunction with the LIKE operator:

1. The percent sign (%) represents zero, one, or multiple characters.
2. The underscore sign (\_) represents one, single character Syntax.

Syntax:

SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;

WHERE CustomerName LIKE 'a%' - Finds any values that start with "a"

WHERE CustomerName LIKE '%а' - Finds any values that end with "a"

WHERE CustomerName LIKE '%or%' - Finds any values that have "or" in any position

WHERE CustomerName LIKE '\_r%' - Finds any values that have "r" in the second position

WHERE CustomerName LIKE 'a\_%' - Finds any values that start with "a" and are at least 2 characters in length

WHERE CustomerName LIKE 'a\_\_%' - Finds any values that start with "a" and are at least 3 characters in length

WHERE CustomerName LIKE 'a%o' - Finds any values that start with "a" and ends with "o"

```sql
SELECT * FROM student WHERE s_name LIKE 'a%';
SELECT * FROM student WHERE s_name LIKE '%a';
SELECT * FROM student WHERE s_name LIKE 'a%o';
SELECT * FROM student WHERE s_name LIKE '%or%';
```

## IN Operator:

IN operator allows you to specify multiple values in a WHERE clause. IN operator is a shorthand for multiple OR conditions.

Syntax:

SELECT column_name
FROM table_name
WHERE column_name IN(value1, value2, ...);

```sql
SELECT * FROM student WHERE s_name IN('John Doe', 'Alice Smith');
```

## Between Operator:

The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates. The BETWEEN operator is inclusive: begin and end values are included.

Syntax:

SELECT column_name
FROM table name
WHERE column_name BETWEEN value1 AND value2;

Example:

```sql
Select * from Student where marks between 78 and 87;
```

## Alter Command:

The ALTER TABLE statement is used to add, delete, or modify columns in an existing table. The ALTER TABLE statement is also used to add and drop various constraints on an existing table.

Syntax: To add a column in a table:

ALTER TABLE table_name
ADD column_name datatype;

Example:

```sql
ALTER TABLE Student
Add column marks integer;
```

Syntax :To drop a column

ALTER TABLE table_name
DROP COLUMN column_name;

Example:

```sql
ALTER TABLE Student
DROP COLUMN Age;
```

Syntax :to change /modify the data type of column in a table

ALTER TABLE table_name
MODIFY COLUMN coLumn_name datatype;

Example:

```sql
ALTER TABLE Student
MODIFY COLUMN Age VARCHAR(10);
```

- Update:

The UPDATE statement is used to modify the existing records in a table.

Syntax:

UPDATE table_name
SET column1 = value1, column2 = value 2, ...
WHERE condition;

Example:

```sql
Update Student set name='Ankita' where name ='Ankit';
```

- Delete Command:

The DELETE statement is used to delete existing records in a table.

Syntax:

DELETE FROM table_name WHERE condition;

Example:

```sql
Delete from Student where Roll_no =106;
```

- Drop Command:

The DROP TABLE statement is used to drop an existing table in a database.

Syntax:

DROP TABLE table_name;

Example:

```sql
Drop Table Student;
```

- Distinct:

The SELECT DISTINCT statement is used to retrieve unique values from a specific column in a table. It eliminates duplicate rows and returns only distinct values.

Syntax:

SELECT DISTINCT column1, column2, ...
FROM table_name
WHERE condition;

Example:

```sql
select distinct age from student;
```

- Views in SQL:

A view is a virtual table based on the result of a SELECT query. It allows you to simplify cor queries, encapsulate logic, and present a subset or transformation of the data to users wit exposing the underlying table structure.

Syntax:

CREATE VIEW view_name AS SELECT columnl, column2, ...
FROM table_name WHERE condition;

Example:

```sql
create view studentview as select name, age from student where age=23;

select * from studentview;
```

- Group by And Having Clause:

The GROUP BY clause is a SQL command that is used to group rows that have the same values. The GROUP BY clause is used in the SELECT statement.

Syntax:

SELECT statements...
GROUP BY column_name1, column_name2,...
HAVING condition;

Example:

```sql
Select * from Student group by age;
```

HAVING: it is used to restrict the rows affected by the GROUP BY clause. It is similar to the WHERE clause.

Example:

```sql
Select * from Student group by age having age=34;
```

- Foreign Key:

A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table. The table with the foreign key is called the child table, and the table with the primary key is called the referenced or parent table.

Syntax:

Create Table table_name (column 1, column 2....)
Foreign key(column_name) References Table Name(column name of Primary key)

Example:

```sql
Create table S_course(
    cid integer primary key,
    cname char(20),
    Roll_no int,
    foreign key(Roll_no) references Student(Roll _no)
);
```

- SubQueries in SQL:

1. A subquery, also known as a nested query or inner query, is a query embedded within another query.
2. It can be used to retrieve data that will be used in the main query as a condition to further restrict the data to be retrieved.
3. Subqueries can be used in various parts of a SQL statement, including the SELECT, FROM, WHERE, and HAVING clauses.

Syntax:

SELECT column1, column2, ...
FROM table_name
WHERE column_name operator
(SELECT column_name FROM another_table WHERE condition);

Example: Write a query in SQL which select the names of those students whose course name is BBA.

```sql
Select name from student where rno in(select Roll_no from S_course where cname='BBA');
```

- String Functions in SQL:

1. string is traditionally a sequence of characters, either as a literal constant or as some kind of variable. The latter may allow its elements to be mutated and/or the length changed, or it may be fixed (after creation).
2. A string is generally understood as a data type and is often implemented as an array of bytes (or words) that stores a sequence of elements, typically characters, using some character encoding.

- Aggregate Functions:

The most commonly used SQL aggregate functions are:

1. MIN() - returns the smallest value within the selected column

2. MAX() - returns the largest value within the selected column

3. COUNT() - returns the number of rows in a set

4. SUM() - returns the total sum of a numerical column

5. AVG() - returns the average value of a numerical column

```sql
SELECT MIN(Age)
FROM Student;
```

- Joins:

A JOIN clause is used to combine rows from two or more tables, based on a related column between them.

- EQUI JOIN:

To retrieve values from two tables.

- Inner Join:

The INNER JOIN keyword selects all rows from both the tables as long as the condition is satisfied. This keyword will create the result-set by combining all rows from both the tables where the condition satisfies i.e value of the common field will be the same.

Syntax:

SELECT table1.column1,table1.column2,table2.column1,....
FROM table1
INNER JOIN table2
ON table1.matching_column = table2.matching_column;

- Left Outer Join:

LEFT JOIN returns all the rows of the table on the left side of the join and matches rows for the table on the right side of the join. For the rows for which there is no matching row on the right side, the result-set will contain null.

Syntax:

SELECT table1.column1,table1.column2,table2.column1,....
FROM table1
LEFT JOIN table2
ON table1.matching_column = table2.matching_column;

- Full outer Join:

FULL JOIN creates the result-set by combining results of both LEFT JOIN and RIGHT JOIN. The result-set will contain all the rows from both tables. For the rows for which there is no matching, the result-set will contain NULL values

Syntax:

SELECT table1.column1,table1.column2,table2.column1,....
FROM table1
FULL JOIN table2
ON table1.matching_column = table2.matching_column;
