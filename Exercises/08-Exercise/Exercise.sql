-- Enable server output to display results in SQL*Plus or SQL Developer
SET SERVEROUTPUT ON SIZE 100000;

-- Step 1: Create the `jobs` table (with job_id, min_salary, and max_salary)
CREATE TABLE jobs (
    job_id VARCHAR2(10) PRIMARY KEY,
    min_salary NUMBER(7, 2),
    max_salary NUMBER(7, 2)
);

-- Step 2: Create the `employees` table (with employee_id, salary, and job_id)
CREATE TABLE employees (
    employee_id NUMBER(4) PRIMARY KEY,
    salary NUMBER(7, 2),
    job_id VARCHAR2(10),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

-- Step 3: Insert sample data into the `jobs` table
INSERT INTO jobs (job_id, min_salary, max_salary) VALUES ('DEV', 30000, 60000);
INSERT INTO jobs (job_id, min_salary, max_salary) VALUES ('HR', 25000, 50000);
INSERT INTO jobs (job_id, min_salary, max_salary) VALUES ('MGR', 40000, 80000);

-- Step 4: Insert sample data into the `employees` table
INSERT INTO employees (employee_id, salary, job_id) VALUES (101, 29000, 'DEV');
INSERT INTO employees (employee_id, salary, job_id) VALUES (102, 65000, 'DEV');
INSERT INTO employees (employee_id, salary, job_id) VALUES (103, 27000, 'HR');
INSERT INTO employees (employee_id, salary, job_id) VALUES (104, 75000, 'MGR');
INSERT INTO employees (employee_id, salary, job_id) VALUES (105, 32000, 'DEV');
INSERT INTO employees (employee_id, salary, job_id) VALUES (106, 38000, 'MGR');

-- Commit the inserts
COMMIT;

-- Step 5: PL/SQL Block for Exception Handling (Salary Check)
DECLARE
  -- Define custom exceptions
  BELOW_SALARY_RANGE EXCEPTION;
  ABOVE_SALARY_RANGE EXCEPTION;

  -- Define variables to hold salary information
  n_salary employees.salary%TYPE;
  n_min_salary employees.salary%TYPE;
  n_max_salary employees.salary%TYPE;

  -- Declare employee id directly (no user input)
  n_emp_id employees.employee_id%TYPE := 101; -- Example: employee ID 101

BEGIN
  -- Fetch salary details for the given employee ID and their job's salary range
  SELECT salary, min_salary, max_salary
  INTO n_salary, n_min_salary, n_max_salary
  FROM employees
  INNER JOIN jobs ON jobs.job_id = employees.job_id
  WHERE employee_id = n_emp_id;

  -- Check if the salary is below or above the defined range
  IF n_salary < n_min_salary THEN
    RAISE BELOW_SALARY_RANGE;  -- Raise exception if salary is below range
  ELSIF n_salary > n_max_salary THEN
    RAISE ABOVE_SALARY_RANGE;  -- Raise exception if salary is above range
  END IF;

  -- If no exception, output employee's salary
  DBMS_OUTPUT.PUT_LINE('Employee ' || n_emp_id || ' has salary $' || n_salary);

EXCEPTION
  -- Handle BELOW_SALARY_RANGE exception
  WHEN BELOW_SALARY_RANGE THEN
    DBMS_OUTPUT.PUT_LINE('Employee ' || n_emp_id || ' has salary below the salary range.');

  -- Handle ABOVE_SALARY_RANGE exception
  WHEN ABOVE_SALARY_RANGE THEN
    DBMS_OUTPUT.PUT_LINE('Employee ' || n_emp_id || ' has salary above the salary range.');

  -- Handle NO_DATA_FOUND if employee is not found
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Employee ' || n_emp_id || ' not found.');

  -- Catch all other exceptions
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/
