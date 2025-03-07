## PLSQL:

PL/SQL is a combination of SQL along with the procedural features of programming languages. It was developed by Oracle Corporation in the early 90's to enhance the capabilities of SQL.

Basic Syntax of PL/SQL which is a block-structured language; this means that the PL/SQL programs are divided and written in logical blocks of code. Each block consists of three sub-parts.

1. Declare: This section starts with the keyword DECLARE. It is an optional section and defines all variables, cursors, subprograms, and other elements to be used in the program.

2. BEGIN and END :It consists of the executable PL/SQL statements of the program. It should have at least one executable line of code, which may be just a NULL command to indicate that nothing should be executed.

3. Exception: This section starts with the keyword EXCEPTION. This optional section contains exception(s) that handle errors in the program.

```sql
DECLARE
  message VARCHAR2(20) := 'Hello World';
BEGIN
  DBMS_OUTPUT.PUT_LINE(message);
END;
```

## PLSQL Identifiers:

1. PL/SQL identifiers are constants, variables, exceptions, procedures, cursors, and reserved words. The identifiers consist of a letter optionally followed by more letters, numerals, dollar signs, underscores, and number signs and should not exceed 30 characters.

2. By default, identifiers are not case-sensitive. So you can use integer or INTEGER to represent a numeric value. You cannot use a reserved keyword as an identifier.

## Data Types:

1. FLOAT: ANSI and IBM specific floating-point type with maximum precision of 126 binary digits (approximately 38 decimal digits)

2. INT: ANSI specific integer type with maximum precision of 38 decimal digits

3. INTEGER: ANSI and IBM specific integer type with maximum precision of 38 decimal digits

4. CHAR: Fixed-length character string with maximum size of 32,767 bytes

5. VARCHAR2: Variable-length character string with maximum size of 32,767 bytes

## Variable Declaration:

PL/SQL variables must be declared in the declaration section or in a package as a global variable. When you declare a variable, PL/SQL allocates memory for the variable's value and the storage location is identified by the variable name.

The syntax for declaring a variable is - variable_name [CONSTANT] datatype [NOT NULL] [:= | DEFAULT initial_value]

Example:

Sales number(10, 2);

Name varchar2(10);

A integer : = 7;

```sql
DECLARE
  a INTEGER := 10;
  b INTEGER := 20;
  c INTEGER;
  f REAL;
BEGIN
  c := a + b;
  DBMS_OUTPUT.PUT_LINE('Value of c: ' || c);

  f := 70.0 / 3.0;
  DBMS_OUTPUT.PUT_LINE('Value of f: ' || f);
END;
```

## Decision Making Structures:

Decision-making structures require that the programmer specify one or more conditions to be evaluated or tested by the program, along with a statement or statements to be executed if the condition is determined to be true, and optionally, other statements to be executed if the condition is determined to be false.

Pl/SQL provides the following decision making statement:

1. IF-THEN statement
2. IF-THEN-ELSE
3. IF-THEN-ELSEIF
4. CASE
5. Nested IF-THEN-ELSE

## If-Then Statement

The IF statement associates a condition with a sequence of statements enclosed by the keywords THEN and END IF. If the condition is TRUE, the statements get executed, and if the condition is FALSE or NULL, then the IF statement does nothing.

Syntax

IF condition THEN
Statement;
END IF;

Example: Program to check if then statement

```sql
DECLARE
  a NUMBER(2) := 10;
BEGIN
  IF (a < 20) THEN
    DBMS_OUTPUT.PUT_LINE('a is less than 20');
  END IF;
END;
```

## If-Then-else

sequence of IF-THEN statements can be followed by an optional sequence of ELSE statements, which execute when the condition is FALSE.

Syntax:

IF condition THEN
S1;
ELSE
S2;
END IF;

Example: Program to check if-then-else condition

```sql
DECLARE
  a NUMBER(3) := 100;
BEGIN
  IF (a < 20) THEN
    DBMS_OUTPUT.PUT_LINE('a is less than 20');
  ELSE
    DBMS_OUTPUT.PUT_LINE('a is not less than 20');
  END IF;
END;
```

## IF-THEN-ELSIF:

The IF-THEN-ELSIF statement allows you to choose between several alternatives. An IF-THEN statement can be followed by an optional ELSIF...ELSE statement. The ELSIF clause lets you add additional conditions.

Syntax:

IF condition THEN
S1;
ELSIF condition2 THEN
S2;
ELSIF condition3 THEN
S3;
ELSE
S4;
END IF;

Example:

```sql
DECLARE
  a NUMBER(3) := 25;
BEGIN
  IF (a = 10) THEN
    DBMS_OUTPUT.PUT_LINE('Value of a is 10');
  ELSIF (a = 20) THEN
    DBMS_OUTPUT.PUT_LINE('Value of a is 20');
  ELSIF (a = 30) THEN
    DBMS_OUTPUT.PUT_LINE('Value of a is 30');
  ELSE
    DBMS_OUTPUT.PUT_LINE('None of the values is matching');
  END IF;
END;
```

## CASE Statement:

Like the IF statement, the CASE statement selects one sequence of statements to execute. However, to select the sequence, the CASE statement uses a selector rather than multiple Boolean expressions. A selector is an expression, the value of which is used to select one of several alternatives.

Syntax:

CASE selector
WHEN 'value1' THEN S1;
WHEN 'value2' THEN S2;
WHEN 'value3' THEN S3;
ELSE S4; -- default case
END CASE;

Example:

```sql
DECLARE
  grade CHAR(1) := 'A';
BEGIN
  CASE grade
    WHEN 'A' THEN
      DBMS_OUTPUT.PUT_LINE('Excellent');
    WHEN 'B' THEN
      DBMS_OUTPUT.PUT_LINE('Very good');
    WHEN 'C' THEN
      DBMS_OUTPUT.PUT_LINE('Well done');
    WHEN 'D' THEN
      DBMS_OUTPUT.PUT_LINE('You passed');
    WHEN 'F' THEN
      DBMS_OUTPUT.PUT_LINE('Better try again');
    ELSE
      DBMS_OUTPUT.PUT_LINE('No such grade');
  END CASE;
END;
```

## LOOPS In PLSQL:

A loop statement allows us to execute a statement or group of statements multiple times

The loops in PL/SQL are:

1. PL/SQL BASIC LOOP: In this loop structure, sequence of statements is enclosed between the LOOP and the END LOOP statements. At each iteration, the sequence of statements is executed and then control resumes at the top of the loop.

2. PL/SQL WHILE LOOP: Repeats a statement or group of statements while a given condition is true. It tests the condition before executing the loop body.

3. PL/SQL FOR LOOP: Execute a sequence of statements multiple times and abbreviates the code that manages the loop variable.

## Basic loop:

Basic loop structure encloses sequence of statements in between the LOOP and END LOOP statements. With each iteration, the sequence of statements is executed and then control resumes at the top of the loop.

Syntax:

LOOP
Sequence of statements;
END LOOP;

```sql
DECLARE
  x NUMBER := 10;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE(x);
    x := x + 10;
    IF x > 50 THEN
      EXIT;
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('After Exit x is: ' || x);
END;
```

## While Loop:

A WHILE LOOP statement in PL/SQL programming language repeatedly executes a target statement as long as a given condition is true.

Syntax:

WHILE condition LOOP
sequence_of_statements
END LOOP;

```sql
DECLARE
  a NUMBER(2) := 10;
BEGIN
  WHILE a < 20 LOOP
    DBMS_OUTPUT.PUT_LINE('value of a: ' || a);
    a := a + 1;
  END LOOP;
END;
```

## For Loop:

A FOR LOOP is a repetition control structure that allows you to efficiently write a loop that needs to execute a specific number of times.

Syntax:

FOR counter IN initial_value .. final_value LOOP
sequence_of_statements
END LOOP;

```sql
DECLARE
  a NUMBER(2);
BEGIN
  FOR a IN 10 .. 20 LOOP
    DBMS_OUTPUT.PUT_LINE('value of a: ' || a);
  END LOOP;
END;
```

## Arrays in PLSQL:

The PL/SQL programming language provides a data structure called the VARRAY, which can store a fixed-size sequential collection of elements of the same type. A varray is used to store an ordered collection of data. All varrays consist of contiguous memory locations. The lowest address corresponds to the first element and the highest address to the last element.

Creating a Varray Type

A varray type is created with the CREATE TYPE statement. You must specify the maximum size and the type of elements stored in the varray.

Syntax:

CREATE OR REPLACE TYPE varray_type_name IS VARRAY(n) of <element_type>

1. varray_type_name is a valid attribute name, on is the number of elements (maximum) in the varray.
2. element_type is the data type of the elements of the array.

Example

TYPE namearray IS VARRAY(5) OF VARCHAR2(10);

Type grades IS VARRAY(5) OF INTEGER;

```sql
DECLARE
  TYPE namesarray IS VARRAY(5) OF VARCHAR2(10);
  TYPE grades IS VARRAY(5) OF INTEGER;
  names namesarray;
  marks grades;
  total INTEGER;
BEGIN
  names := namesarray('Kavita', 'Pritam', 'Ayan', 'Rishav', 'Aziz');
  marks := grades(98, 97, 78, 87, 92);
  total := names.count;
  DBMS_OUTPUT.PUT_LINE('Total ' || total || ' Students');

  FOR i IN 1 .. total LOOP
    DBMS_OUTPUT.PUT_LINE('Student: ' || names(i) || ', Marks: ' || marks(i));
  END LOOP;
END;
```

## Strings in PLSQL:

The string in PL/SQL is actually a sequence of characters with an optional size specification. The characters could be numeric, letters, blank, special characters or a combination of all. PL/SQL offers three kinds of strings —

1. Fixed-length strings - In such strings, programmers specify the length while declaring the string. The string is right-padded with spaces to the length so specified.

2. Variable-length strings - In such strings, a maximum length up to 32,767, for the string is specified and no padding takes place.

3. Character large objects (CLOBs) - These are variable-length strings that can be up to 128 terabytes.

4. PL/SQL strings could be either variables or literals. A string literal is enclosed within quotation marks. For example, 'This is a string literal.' Or 'hello world'.

```sql
DECLARE
  name VARCHAR2(20);
  company VARCHAR2(30);
  introduction CLOB;
  choice CHAR(1);
BEGIN
  name := 'John Smith';
  company := 'Infotech';
  introduction := 'Hello! I''m John Smith from Infotech.';
  choice := 'y';

  IF choice = 'y' THEN
    DBMS_OUTPUT.PUT_LINE(name);
    DBMS_OUTPUT.PUT_LINE(company);
    DBMS_OUTPUT.PUT_LINE(introduction);
  END IF;
END;
```

## Function In String:

ASCII(x) - Returns the ASCII value of the character x.

CHR(x) - Returns the character with the ASCII value of x.

CONCAT(x, y) - Concatenates the strings x and y and returns the appended string.

INITCAP(x) - Converts the initial letter of each word in x to uppercase and returns that string.

INSTR(x, find_string [, start] [, occurrence]) - Searches for find_string in x and returns the position at which it occurs.

INSTRB(x) - Returns the location of a string within another string, but returns the value in bytes.

LENGTH(x) - Returns the number of characters in x.

LENGTHB(x) - Returns the length of a character string in bytes for single byte character set.

UPPER(x) - Converts the letters in x to uppercase and returns that string.

LOWER(x) - Converts the letters in x to lowercase and returns that string.

LPAD(x, width [, pad_string]) - Pads x with spaces to the left, to bring the total length of the string up to width characters.

RPAD(x, width [, pad_string]) - Pads x to the right.

LTRIM(x [, trim_string]) - Trims characters from the left of x.

RTRIM(x [, trim_string]) - Trims x from the right.

NANVL(x, value) - Returns value if x matches the NaN special value (not a number), otherwise x is returned.

NLS_INITCAP(x) - Same as the INITCAP function except that it can use a different sort method as specified by NLSSORT.

NLS_LOWER(x) - Same as the LOWER function except that it can use a different sort method as specified by NLSSORT.

NLS_UPPER(x) - Same as the UPPER function except that it can use a different sort method as specified by NLSSORT.

REPLACE(x, search_string, replace_string) - Searches x for search_string and replaces it with replace_string.

SUBSTR(x, start [, length]) - Returns a substring of x that begins at the position specified by start. An optional length for the substring may be supplied.

SUBSTRB(x) - Same as SUBSTR except that the parameters are expressed in bytes instead of characters for the single-byte character systems.

TRIM([trim_char FROM] x) - Trims characters from the left and right of x.

```sql
DECLARE
  greetings VARCHAR2(11) := 'hello world';
BEGIN
  DBMS_OUTPUT.PUT_LINE(UPPER(greetings));
  DBMS_OUTPUT.PUT_LINE(LOWER(greetings));
  DBMS_OUTPUT.PUT_LINE(INITCAP(greetings));
  DBMS_OUTPUT.PUT_LINE(SUBSTR(greetings, 1, 1));
  DBMS_OUTPUT.PUT_LINE(SUBSTR(greetings, -1, 1));
  DBMS_OUTPUT.PUT_LINE(SUBSTR(greetings, 7, 5));
  DBMS_OUTPUT.PUT_LINE(INSTR(greetings, 'e'));
END;
```

## Procedures In PLSQL:

The PL/SQL stored procedure or simply a procedure is a PL/SQL block which performs one or more specific tasks. It is just like procedures in other programming languages.

The procedure contains a header and a body:

1. Header: The header contains the name of the procedure and the parameters or variables passed to the procedure.
2. Body: The body contains a declaration section, execution section and exception section similar to a general PL/SQL block.

Parameters in Procedure:

When you want to create a procedure or function, you have to define parameters There is three ways to pass parameters in procedure:

1. IN: An IN parameter lets you pass a value to the subprogram. It is a read-only parameter. Inside the subprogram, an IN parameter acts like a constant. It cannot be assigned a value. You can pass a constant, literal, initialized variable, or expression as an IN parameter. You can also initialize it to a default value. however, in that case, it is omitted from the subprogram call. It is the default mode of parameter passing. Parameters are passed by reference.

2. OUT: An OUT parameter returns a value to the calling program. Inside the subprogram, an OUT parameter acts like a variable. You can change its value and reference the value after assigning it. The actual parameter must be variable and it is passed by value.

3. IN OUT: An IN OUT parameter passes an initial value to a subprogram and returns an updated value to the caller. It can be assigned a value and the value can be read.The actual parameter corresponding to an IN OUT formal parameter must be a variable, not a constant or an expression. Formal parameter must be assigned a value. Actual parameter is passed by value.

Create Procedure:

Example:

we are going to insert record in user table. So you need to create user table first.

Table Creation:

```sql
CREATE TABLE user (
  id NUMBER(10) PRIMARY KEY,
  name VARCHAR2(100)
);

```

Procedure Code:

```sql
DECLARE
  PROCEDURE INSERTUSER(id IN NUMBER, name IN VARCHAR2) IS
  BEGIN
    INSERT INTO users (id, name) VALUES (id, name);
  END;

BEGIN
  INSERTUSER(101, 'Rahul');
  DBMS_OUTPUT.PUT_LINE('Record inserted successfully');
END;

```

Example to demonstrate OUT:

```sql
DECLARE
  a NUMBER;
  b NUMBER;
  c NUMBER;

  PROCEDURE findMin(x IN NUMBER, y IN NUMBER, z OUT NUMBER) IS
  BEGIN
    IF x < y THEN
      z := x;
    ELSE
      z := y;
    END IF;
  END;

BEGIN
  a := 23;
  b := 45;
  findMin(a, b, c);
  DBMS_OUTPUT.PUT_LINE('Minimum of (23, 45) : ' || c);
END;
```

Example to demonstrate IN Out

```sql
DECLARE
  a NUMBER;

  PROCEDURE squareNum(x IN OUT NUMBER) IS
  BEGIN
    x := x * x;
  END;

BEGIN
  a := 23;
  squareNum(a);
  DBMS_OUTPUT.PUT_LINE('Square of (23): ' || a);
END;
```

## Functions in PISQL:

A function is same as a procedure except that it returns a value. Therefore, all the discussions of the previous chapter are true for functions too.

Syntax:

FUNCTION function_name[(parameter_name [IN | OUT | IN OUT] type [, ...])]
RETURN return_datatype
{IS | AS} BEGIN
function_body
END [function_name];

```sql
DECLARE
  result NUMBER;

  FUNCTION add_fun(a NUMBER, b NUMBER)
    RETURN NUMBER
  IS
    c NUMBER;
  BEGIN
    c := a + b;
    RETURN c;
  END add_fun;

BEGIN
  result := add_fun(10, 20);
  DBMS_OUTPUT.PUT_LINE('The sum of 10 and 20 is ' || result);
END;
```

## Cursors In PISQl:

A cursor is used to referred to a program to fetch and process the rows returned by the SQL statement, one at a time. There are two types of cursors:

1. Implicit Cursors
2. Explicit Cursors

## Implicit Cursor:

The implicit cursors are automatically generated by Oracle while an SQL statement is executed, if you don't use an explicit cursor for the statement. Orcale provides some attributes known as Implicit cursor's attributes to check the status of DML operations. Some of them are: %FOUND, %NOTFOUND, %ROWCOUNT and %ISOPEN.

Example - Implicit Cursor

First create a table in PI/SQL:

```sql
CREATE TABLE customers(
  id INT,
  name VARCHAR(10),
  age INT,
  salary INT
);

INSERT INTO customers (id, name, age, salary)
VALUES
(101, 'abc', 10000, 0),
(102, 'abc', 20000, 0);

```

The following program will update the table and increase the salary of each customer by 500 and use the SQL%ROWCOUNT attribute to determine the number of rows affected -

```sql
DECLARE
  total_rows NUMBER(2);
BEGIN
  UPDATE customers
  SET salary = salary + 500;

  IF SQL%NOTFOUND THEN
    DBMS_OUTPUT.PUT_LINE('No customers selected');
  ELSIF SQL%FOUND THEN
    total_rows := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE(total_rows || ' customers selected');
  END IF;
END;
```

## Explicit Cursor:

Explicit cursors are programmer-defined cursors for gaining more control over the context area. An explicit cursor should be defined in the declaration section of the PL/SQL Block. It is created on a SELECT Statement which returns more than one row.

The syntax for creating an explicit cursor is - CURSOR cursor_name IS select_statement;

Working with an explicit cursor includes the following steps -

1. Declaring the cursor for initializing the memory
2. Opening the cursor for allocating the memory
3. Fetching the cursor for retrieving the data
4. Closing the cursor to release the allocated memory

Declaring the Cursor:

Declaring the cursor defines the cursor with a name and the associated SELECT statement. For example -

CURSOR c_customers IS SELECT id, name, address FROM customers;

Opening the Cursor:

Opening the cursor allocates the memory for the cursor and makes it ready for fetching the rows returned by the SQL statement into it. For example, we will open the above defined cursor as follows -

OPEN c_customers;

Fetching the Cursor:

Fetching the cursor involves accessing one row at a time. For example, we will fetch rows from the above-opened cursor as follows -

FETCH c_customers INTO c_id, c_name, c_addr;

Closing the Cursor:

Closing the cursor means releasing the allocated memory. For example, we will close the above-opened cursor as follows -

CLOSE c_customers;

```sql
DECLARE
  c_id   customers.id%type;
  c_name customers.name%type;
  c_age  customers.age%type;

  CURSOR c_customers IS
    SELECT id, name, age
    FROM customers;
BEGIN
  OPEN c_customers;

  LOOP
    FETCH c_customers INTO c_id, c_name, c_age;
    EXIT WHEN c_customers%NOTFOUND;

    dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_age);
  END LOOP;

  CLOSE c_customers;
END;
```
