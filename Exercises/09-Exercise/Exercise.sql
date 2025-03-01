-- Step 1: Create the Procedure to calculate Simple Interest
CREATE OR REPLACE PROCEDURE calculate_simple_interest (
    P IN NUMBER,  -- Principal amount
    R IN NUMBER,  -- Rate of interest
    N IN NUMBER   -- Number of years
) IS
    SI NUMBER(9,2);  -- Variable to store Simple Interest
BEGIN
    -- Calculate Simple Interest using the formula
    SI := (P * N * R) / 100;

    -- Output the result
    DBMS_OUTPUT.PUT_LINE('Simple Interest = ' || SI);
EXCEPTION
    WHEN OTHERS THEN
        -- Handle any exceptions and display the error message
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

-- Step 2: Execute the procedure with sample values for P, R, and N
-- Example: Principal = 10000, Rate = 5%, Years = 2
BEGIN
    -- Calling the procedure with specific values for P, R, and N
    calculate_simple_interest(P => 10000, R => 5, N => 2);
END;
/
