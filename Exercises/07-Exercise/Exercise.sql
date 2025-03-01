-- Step 1: Create the EMP table with required attributes
CREATE TABLE emp (
    empno NUMBER(4) PRIMARY KEY,
    ename VARCHAR2(20),
    sal NUMBER(7, 2)
);

-- Step 2: Insert some sample data into the EMP table
INSERT INTO emp (empno, ename, sal) VALUES (101, 'John Doe', 35000);
INSERT INTO emp (empno, ename, sal) VALUES (102, 'Jane Smith', 25000);
INSERT INTO emp (empno, ename, sal) VALUES (103, 'Robert Brown', 32000);
INSERT INTO emp (empno, ename, sal) VALUES (104, 'Emily Davis', 50000);
INSERT INTO emp (empno, ename, sal) VALUES (105, 'Michael Wilson', 28000);
INSERT INTO emp (empno, ename, sal) VALUES (106, 'Sarah Johnson', 45000);

-- Step 3: Write PL/SQL block to use cursor and fetch employees with SAL > 30000
DECLARE
    -- Declare the cursor to select employees with SAL > 30000
    CURSOR c1 IS
        SELECT ename, sal FROM emp
        WHERE sal > 30000
        ORDER BY sal DESC;

    -- Declare variables to hold employee data
    my_ename VARCHAR2(10);
    my_sal   NUMBER(7, 2);
BEGIN
    -- Use FOR loop to fetch and display employee names and salaries
    FOR emp_record IN c1 LOOP
        -- Print employee name and salary
        DBMS_OUTPUT.PUT_LINE('Employee Name: ' || emp_record.ename || ', Salary: ' || emp_record.sal);
    END LOOP;
END;
