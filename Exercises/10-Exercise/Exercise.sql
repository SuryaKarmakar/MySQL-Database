-- Step 1: Create the table `sals` to store the salary ranges for each job title
CREATE TABLE sals (
    job VARCHAR2(10) PRIMARY KEY,  -- Job title
    losal NUMBER(7, 2),            -- Minimum salary for the job
    hisal NUMBER(7, 2)            -- Maximum salary for the job
);

-- Step 2: Insert sample data into the `sals` table for different job titles
INSERT INTO sals (job, losal, hisal) VALUES ('DEV', 30000, 60000);
INSERT INTO sals (job, losal, hisal) VALUES ('HR', 25000, 50000);
INSERT INTO sals (job, losal, hisal) VALUES ('MGR', 40000, 80000);

-- Commit the changes
COMMIT;

-- Step 3: Create the function to check if salary is within the range for a given job title
CREATE OR REPLACE FUNCTION sal_ok (
    salary IN NUMBER,  -- The salary of the employee
    title IN VARCHAR2  -- The job title of the employee
) RETURN BOOLEAN IS
    min_sal NUMBER(7, 2);  -- Minimum salary for the job title
    max_sal NUMBER(7, 2);  -- Maximum salary for the job title
BEGIN
    -- Fetch the min and max salary for the given job title from the `sals` table
    SELECT losal, hisal INTO min_sal, max_sal
    FROM sals
    WHERE job = title;

    -- Check if the salary is within the range of the job title
    IF salary >= min_sal AND salary <= max_sal THEN
        RETURN TRUE;  -- Salary is within range
    ELSE
        RETURN FALSE;  -- Salary is out of range
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- If no data is found for the given job title, return FALSE
        RETURN FALSE;
    WHEN OTHERS THEN
        -- In case of any other error, return FALSE
        RETURN FALSE;
END sal_ok;
/

-- Step 4: Test the function with some sample input
DECLARE
    emp_salary NUMBER(7, 2);
    emp_job VARCHAR2(10);
    result BOOLEAN;
BEGIN
    -- Test 1: Check if the salary for an employee is within the range for job 'DEV'
    emp_salary := 35000;
    emp_job := 'DEV';
    result := sal_ok(emp_salary, emp_job);  -- Call the function
    DBMS_OUTPUT.PUT_LINE('Salary ' || emp_salary || ' for job ' || emp_job || ' is within range: ' || CASE WHEN result THEN 'TRUE' ELSE 'FALSE' END);

    -- Test 2: Check if the salary for an employee is within the range for job 'HR'
    emp_salary := 60000;
    emp_job := 'HR';
    result := sal_ok(emp_salary, emp_job);  -- Call the function
    DBMS_OUTPUT.PUT_LINE('Salary ' || emp_salary || ' for job ' || emp_job || ' is within range: ' || CASE WHEN result THEN 'TRUE' ELSE 'FALSE' END);

    -- Test 3: Check if the salary for an employee is within the range for job 'MGR'
    emp_salary := 90000;
    emp_job := 'MGR';
    result := sal_ok(emp_salary, emp_job);  -- Call the function
    DBMS_OUTPUT.PUT_LINE('Salary ' || emp_salary || ' for job ' || emp_job || ' is within range: ' || CASE WHEN result THEN 'TRUE' ELSE 'FALSE' END);
END;
/
