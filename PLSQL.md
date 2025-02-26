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
