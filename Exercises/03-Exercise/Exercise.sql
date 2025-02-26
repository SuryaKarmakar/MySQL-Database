CREATE DATABASE InsuranceDB;
USE InsuranceDB;

-- 1. Create the above tables by properly specifying the primary keys and the foreign keys.
CREATE TABLE PERSON (
    driver_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100)
);

CREATE TABLE CAR (
    regno VARCHAR(20) PRIMARY KEY,
    model VARCHAR(50),
    year INT
);

CREATE TABLE ACCIDENT (
    report_number INT PRIMARY KEY,
    accd_date DATE,
    location VARCHAR(100)
);

CREATE TABLE OWNS (
    driver_id VARCHAR(20),
    regno VARCHAR(20),
    PRIMARY KEY (driver_id, regno),
    FOREIGN KEY (driver_id) REFERENCES PERSON(driver_id),
    FOREIGN KEY (regno) REFERENCES CAR(regno)
);

CREATE TABLE PARTICIPATED (
    driver_id VARCHAR(20),
    regno VARCHAR(20),
    report_number INT,
    damage_amount INT,
    PRIMARY KEY (driver_id, regno, report_number),
    FOREIGN KEY (driver_id) REFERENCES PERSON(driver_id),
    FOREIGN KEY (regno) REFERENCES CAR(regno),
    FOREIGN KEY (report_number) REFERENCES ACCIDENT(report_number)
);

-- 2. Enter at least five tuples for each relation.
INSERT INTO PERSON VALUES
('D001', 'Alice', '123 Main St'),
('D002', 'Bob', '456 Oak St'),
('D003', 'Charlie', '789 Pine St'),
('D004', 'David', '101 Maple St'),
('D005', 'Eve', '202 Elm St');

INSERT INTO CAR VALUES
('C1001', 'Toyota', 2010),
('C1002', 'Honda', 2008),
('C1003', 'Ford', 2012),
('C1004', 'BMW', 2015),
('C1005', 'Audi', 2020);

INSERT INTO ACCIDENT VALUES
(5001, '2024-02-01', 'Downtown'),
(5002, '2023-06-15', 'Uptown'),
(5003, '2022-09-10', 'Midtown'),
(5004, '2021-12-25', 'Suburb'),
(5005, '2020-08-05', 'Highway');

INSERT INTO OWNS VALUES
('D001', 'C1001'),
('D002', 'C1002'),
('D003', 'C1003'),
('D004', 'C1004'),
('D005', 'C1005');

INSERT INTO PARTICIPATED VALUES
('D001', 'C1001', 5001, 15000),
('D002', 'C1002', 5002, 20000),
('D003', 'C1003', 5003, 30000),
('D004', 'C1004', 5004, 25000),
('D005', 'C1005', 5005, 18000);

SELECT * FROM PERSON;
SELECT * FROM CAR;
SELECT * FROM ACCIDENT;
SELECT * FROM OWNS;
SELECT * FROM PARTICIPATED;

-- 3. Update the damage amount to certain amount (say 25000) for the car with a specific Regno in the ACCIDENT table with certain report- number.
UPDATE PARTICIPATED
SET damage_amount = 25000
WHERE regno = 'C1003' AND report_number = 5003;

-- 4. Add a new accident to the database.
INSERT INTO ACCIDENT VALUES (5006, '2025-01-15', 'City Center');

-- 5. Find the total number of people who owned cars that were involved in accidents in certain years (say 2008).
SELECT COUNT(DISTINCT O.driver_id) AS Total_Owners
FROM OWNS O
JOIN PARTICIPATED P ON O.regno = P.regno
JOIN ACCIDENT A ON P.report_number = A.report_number
WHERE A.accd_date = '2024-02-01';

-- 6. Find the number of accidents in which cars belonging to a specific model were involved.
SELECT COUNT(*) AS Total_Accidents
FROM PARTICIPATED P
JOIN CAR C ON P.regno = C.regno
WHERE C.model = 'Toyota';

-- 7. Display the owners and their car details.
SELECT P.name, C.regno, C.model, C.year
FROM PERSON P
JOIN OWNS O ON P.driver_id = O.driver_id
JOIN CAR C ON O.regno = C.regno;