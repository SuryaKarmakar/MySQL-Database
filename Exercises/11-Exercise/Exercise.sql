-- Step 1: Create the product_price_history table
CREATE TABLE product_price_history (
    product_id NUMBER(5),
    product_name VARCHAR2(32),
    supplier_name VARCHAR2(32),
    unit_price NUMBER(7, 2)
);

-- Step 2: Create the product table
CREATE TABLE product (
    product_id NUMBER(5),
    product_name VARCHAR2(32),
    supplier_name VARCHAR2(32),
    unit_price NUMBER(7, 2)
);

-- Step 3: Create the trigger to maintain price history
CREATE OR REPLACE TRIGGER price_history_trigger
BEFORE UPDATE OF unit_price
ON product
FOR EACH ROW
BEGIN
    -- Insert old price details into the product_price_history table
    INSERT INTO product_price_history (
        product_id,
        product_name,
        supplier_name,
        unit_price
    ) VALUES (
        :old.product_id,        -- Old product ID
        :old.product_name,      -- Old product name
        :old.supplier_name,     -- Old supplier name
        :old.unit_price         -- Old price before the update
    );
END;
/

-- Step 4: Insert initial data into the product table
-- Insert a product with initial price
INSERT INTO product VALUES (100, 'Laptop', 'SupplierA', 750);
INSERT INTO product VALUES (101, 'Smartphone', 'SupplierB', 500);
INSERT INTO product VALUES (102, 'Tablet', 'SupplierC', 300);

-- Step 5: Update the price of a product (this will trigger the insert into product_price_history)
UPDATE product
SET unit_price = 800
WHERE product_id = 100;

-- Step 6: Check the product_price_history table to see the history of prices
SELECT * FROM product_price_history;
