PL/SQL is a combination of SQL along with the procedural features of programming languages. It was developed by Oracle Corporation in the early 90's to enhance the capabilities of SQL.

Basic Syntax of PL/SQL which is a block-structured language; this means that the PL/SQL programs are divided and written in logical blocks of code. Each block consists of three sub-parts.

1. Declare: This section starts with the keyword DECLARE. It is an optional section and defines all variables, cursors, subprograms, and other elements to be used in the program.

2. BEGIN and END :It consists of the executable PL/SQL statements of the program. It should have at least one executable line of code, which may be just a NULL command to indicate that nothing should be executed.

3. Exception: This section starts with the keyword EXCEPTION. This optional section contains exception(s) that handle errors in the program.

```sql
DECLARE

	message varchar2(20):= 'Hello World';

BEGIN

	dbms_output.put_line (message);

END;

```

- PL/SQL Identifiers:

1. PL/SQL identifiers are constants, variables, exceptions, procedures, cursors, and reserved words. The identifiers consist of a letter optionally followed by more letters, numerals, dollar signs, underscores, and number signs and should not exceed 30 characters.

2. By default, identifiers are not case-sensitive. So you can use integer or INTEGER to represent a numeric value. You cannot use a reserved keyword as an identifier.

- Data Types:

1. FLOAT: ANSI and IBM specific floating-point type with maximum precision of 126 binary digits (approximately 38 decimal digits)

2. INT: ANSI specific integer type with maximum precision of 38 decimal digits

3. INTEGER: ANSI and IBM specific integer type with maximum precision of 38 decimal digits

4. CHAR: Fixed-length character string with maximum size of 32,767 bytes

5. VARCHAR2: Variable-length character string with maximum size of 32,767 bytes

- Variable Declaration:

1. PL/SQL variables must be declared in the declaration section or in a package as a global variable. When you declare a variable, PL/SQL allocates memory for the variable's value and the storage location is identified by the variable name.
2. The syntax for declaring a variable is - variable_name [CONSTANT] datatype [NOT NULL] [:= | DEFAULT initial_value]

Example:

Sales number (10,2);

Name varchar2(10);

A integer: =7;

```sql
DECLARE
	a integer := 10; b integer := 20;
	c integer;
	f real;
BEGIN
	C := a + b;
	dbms_output.put_line('Value of c: ' || c);
	f := 70.0/3.0;
	dbms_output.put_line('Value of f: ' || f);
END;
```

- Decision Making Structures:

Decision-making structures require that the programmer specify one or more conditions to be evaluated or tested by the program, along with a statement or statements to be executed if the condition is determined to be true, and optionally, other statements to be executed if the condition is determined to be false.

Pl/SQL provides the following decision making statement:

1. IF-THEN statement
2. IF-THEN-ELSE
3. IF-THEN-ELSEIF
4. CASE
5. Nested IF-THEN-ELSE

- If-Then Statement

The IF statement associates a condition with a sequence of statements enclosed by the keywords THEN and END IF. If the condition is TRUE, the statements get executed, and if the condition is FALSE or NULL, then the IF statement does nothing.

Syntax

IF condition THEN
Statement;
END IF;

Example: Program to check if then statement

```sql
DECLARE

	a number (2) := 10;

BEGIN

	a:= 10;

	IF ( a < 20 ) THEN

	dbms_output.put_line('a is less than 20');

	END IF;

END;
```

- If-Then-else

sequence of IF-THEN statements can be followed by an optional sequence of ELSE statements, which execute when the condition is FALSE.

Syntax:

IF condition THEN S1;
ELSE
S2;
END IF;

Example:Program to check if-then-else condition

```sql
DECLARE

  a number (3) := 100;

BEGIN

  -- check the boolean condition using if statement

  IF(a < 20) THEN

  -- if condition is true then print the following
  dbms_output.put_line('a is less than 20 ');

  ELSE

    dbms_output.put_line('a is not less than 20');

  END IF;

  dbms_output.put_line('value of a is : ' || a);

END;
```

- IF-THEN-ELSIF:

The IF-THEN-ELSIF statement allows you to choose between several alternatives. An IF-THEN statement can be followed by an optional ELSIF...ELSE statement. The ELSIF clause lets you add additional conditions.

Syntax:

IF(boolean_expression 1) THEN
S1; - Executes when the boolean expression 1 is true ELSIF( boolean_expression 2) THEN
S2; - Executes when the boolean expression 2 is true ELSIF (boolean_expression 3) THEN
S3; -- Executes when the boolean expression 3 is true
ELSE
S4; - executes when the none of the above condition is true
END IF;

Example:

```sql
DECLARE

  a number (3) := 100;

BEGIN

  IF (a = 10) THEN

    dbms_output.put_line('Value of a is 10' );

  ELSIF ( a = 20) THEN

    dbms_output.put_line('Value of a is 20' );

  ELSIF ( a = 30) THEN

    dbms_output.put_line('Value of a is 30' );

  ELSE

  dbms_output.put_line('None of the values is matching');

  END IF;
END;
```

- CASE Statement:

Like the IF statement, the CASE statement selects one sequence of statements to execute. However, to select the sequence, the CASE statement uses a selector rather than multiple Boolean expressions. A selector is an expression, the value of which is used to select one of several alternatives.

Syntax:

CASE selector
WHEN 'value1' THEN S1;
WHEN 'value2' THEN S2;
WHEN 'value3' THEN S3;
ELSE Sn; -- default case
END CASE;

Example:

```sql
DECLARE

  grade char (1) := 'A';

BEGIN

  CASE grade

    when 'A' then dbms_output.put_line('Excellent');
    when 'B' then dbms_output.put_line('Very good');
    when 'C' then dbms_output.put_line('Well done');
    when 'D' then dbms_output.put_line('You passed');
    when 'F' then dbms_output.put_line('Better try again');
    else
      dbms_output.put_line('No such grade');

  END CASE;
END;
```

- LOOPS in PL/SQL:

A loop statement allows us to execute a statement or group of statements multiple times

The loops in PL/SQL are:

1. PL/SQL BASIC LOOP: In this loop structure, sequence of statements is enclosed between the LOOP and the END LOOP statements. At each iteration, the sequence of statements is executed and then control resumes at the top of the loop.

2. PL/SQL WHILE LOOP: Repeats a statement or group of statements while a given condition is true.
   It tests the condition before executing the loop body.

3. PL/SQL FOR LOOP: Execute a sequence of statements multiple times and abbreviates the code that manages the loop variable.

- Basic loop:

Basic loop structure encloses sequence of statements in between the LOOP and END LOOP statements. With each iteration, the sequence of statements is executed and then control resumes at the top of the loop.

Syntax:

LOOP
Sequence of statements;
END LOOP;

```sql
DECLARE

x number:= 10;

BEGIN

LOOP

dbms_output.put_line(x);

x:=x+ 10;

IF x > 50 THEN

exit;

END IF;

END LOOP;

-- after exit, control resumes here

dbms_output.put_line('After Exit x is:' || x);

END;
```
