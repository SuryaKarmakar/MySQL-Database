-- Step 1: Create the table
CREATE TABLE acct (
    acctno NUMBER(5),
    cur_bal NUMBER(6, 2),
    acct_name VARCHAR2(100)
);

-- Step 2: Insert some sample data
INSERT INTO acct (acctno, cur_bal, acct_name) 
VALUES (10001, 950.00, 'John Doe');

INSERT INTO acct (acctno, cur_bal, acct_name) 
VALUES (10002, 1200.00, 'Jane Smith');

INSERT INTO acct (acctno, cur_bal, acct_name) 
VALUES (10003, 800.00, 'Robert Brown');

-- Step 3: Write the PL/SQL code block to check balance and deduct Rs. 100 if needed
DECLARE
    mano NUMBER(5);  -- Account number variable
    mcb NUMBER(6, 2);  -- Current balance variable
    minibal CONSTANT NUMBER(7, 2) := 1000.00;  -- Minimum balance constant
    fine NUMBER(6, 2) := 100.00;  -- Deduction amount
BEGIN
    -- Accept account number from user
    mano := 10003;

    -- Get the current balance of the given account number
    SELECT cur_bal INTO mcb FROM acct WHERE acctno = mano;

    -- Check if the balance is less than the minimum balance
    IF mcb < minibal THEN
        -- Deduct Rs. 100 from the balance
        UPDATE acct 
        SET cur_bal = cur_bal - fine 
        WHERE acctno = mano;

        DBMS_OUTPUT.PUT_LINE('Balance is below minimum. Rs. 100 deducted from the account.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Balance is sufficient. No deduction made.');
    END IF;
    
    COMMIT;  -- Commit the transaction

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Account number not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/

SELECT * FROM acct;