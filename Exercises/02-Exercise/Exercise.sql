CREATE DATABASE muj;
USE muj;

-- 1. Create the above tables
CREATE TABLE Supplier (
    scode INT PRIMARY KEY,
    sname VARCHAR(50),
    scity VARCHAR(50),
    turnover INT
);

CREATE TABLE Part (
    pcode VARCHAR(10) PRIMARY KEY,
    weight INT,
    color VARCHAR(20),
    cost INT,
    sellingprice INT
);

CREATE TABLE Supplier_Part (
    scode INT,
    pcode VARCHAR(10),
    qty INT,
    FOREIGN KEY (scode) REFERENCES Supplier(scode),
    FOREIGN KEY (pcode) REFERENCES Part(pcode)
);

-- 2. Insert at least five suitable tuples for each relation.
INSERT INTO Supplier VALUES (1, 'SupplierA', 'Kolkata', 10000);
INSERT INTO Supplier VALUES (2, 'SupplierB', 'Ahmedabad', 20000);
INSERT INTO Supplier VALUES (3, 'SupplierC', 'Kolkata', 15000);
INSERT INTO Supplier VALUES (4, 'SupplierD', 'Mumbai', 25000);
INSERT INTO Supplier VALUES (5, 'SupplierE', 'Ahmedabad', 30000);

INSERT INTO Part VALUES ('P1', 30, 'Red', 25, 50);
INSERT INTO Part VALUES ('P2', 40, 'Blue', 30, 60);
INSERT INTO Part VALUES ('P3', 35, 'Green', 20, 45);
INSERT INTO Part VALUES ('P4', 50, 'Yellow', 40, 75);
INSERT INTO Part VALUES ('P5', 25, 'Black', 20, 40);

INSERT INTO Supplier_Part VALUES (1, 'P1', 100);
INSERT INTO Supplier_Part VALUES (2, 'P2', 150);
INSERT INTO Supplier_Part VALUES (3, 'P3', 200);
INSERT INTO Supplier_Part VALUES (4, 'P4', 250);
INSERT INTO Supplier_Part VALUES (5, 'P5', 300);

SELECT * FROM Supplier;
SELECT * FROM Part;
SELECT * FROM Supplier_Part;

--  3. Get the supplier number and part number in ascending order of supplier number.
SELECT scode, pcode
FROM Supplier_Part
ORDER BY scode;

--  4. Get the details of supplier who operate from certain place (say Kolkata) with turnover 50.
SELECT *
FROM Supplier
WHERE scity = 'Kolkata' AND turnover = 50;

--  5. Get the total number of supplier.
SELECT COUNT(*) AS total_suppliers
FROM Supplier;

-- 6. Get pairs of supplier number such that both operate from the same city.
SELECT A.scode, B.scode
FROM Supplier A, Supplier B
WHERE A.scity = B.scity AND A.scode < B.scode;

-- 7. Get the part number (code) weighing between 25 and 35.
SELECT pcode
FROM Part
WHERE weight BETWEEN 25 AND 35;

-- 8. Get the supplier number whose turnover is null.
SELECT scode
FROM Supplier
WHERE turnover IS NULL;

-- 9. Get the part number that cost 20, 30 or 40 rupees.
SELECT pcode
FROM Part
WHERE cost IN (20, 30, 40);

-- 10. Get the supplier number of supplier are located in the same city(say Ahmedabad). 
SELECT scode
FROM Supplier
WHERE scity = 'Ahmedabad';

-- 11. Get the part number for part whose cost is less than the current maximum cost.
SELECT pcode
FROM Part
WHERE cost < (SELECT MAX(cost) FROM Part);

-- 12. Get the part number whose cost is greater than the average cost.
SELECT pcode
FROM Part
WHERE cost > (SELECT AVG(cost) FROM Part);

-- 13. For each part supplied get part number and names of all cities supplying the part.
SELECT SP.pcode, S.scity
FROM Supplier_Part SP
JOIN Supplier S ON SP.scode = S.scode;

-- 14. Get the supplier number who supply at least one part supplied by supplier 5.
SELECT DISTINCT sp.scode
FROM Supplier_Part sp
WHERE sp.pcode IN (SELECT pcode FROM Supplier_Part WHERE scode = 5);

-- 15. Get the part number for the part supplied by more than one supplier.
SELECT pcode
FROM Supplier_Part
GROUP BY pcode
HAVING COUNT(DISTINCT scode) > 1;

-- 16. Get the names of suppliers who supply from city where there is at least one more supplier.
SELECT DISTINCT S1.sname
FROM Supplier S1
WHERE EXISTS (
    SELECT 1
    FROM Supplier S2
    WHERE S1.scity = S2.scity AND S1.scode != S2.scode
);

-- 17. Get the part number of all the part being supplied with no duplicates.
SELECT DISTINCT pcode
FROM Supplier_Part;