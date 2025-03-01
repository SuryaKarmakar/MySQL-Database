CREATE DATABASE book;
USE book;

-- 1. Create the above tables by properly specifying the primary keys and the foreign keys.
CREATE TABLE AUTHOR (
    author_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE PUBLISHER (
    publisher_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE CATEGORY (
    category_id INT PRIMARY KEY,
    description VARCHAR(100)
);

CREATE TABLE CATALOG (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    publisher_id INT,
    category_id INT,
    year INT,
    price INT,
    FOREIGN KEY (author_id) REFERENCES AUTHOR(author_id),
    FOREIGN KEY (publisher_id) REFERENCES PUBLISHER(publisher_id),
    FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id)
);

CREATE TABLE ORDER_DETAILS (
    order_no INT PRIMARY KEY,
    book_id INT,
    quantity INT,
    FOREIGN KEY (book_id) REFERENCES CATALOG(book_id)
);

-- 2. Enter at least five tuples for each relation.
INSERT INTO AUTHOR VALUES (1, 'J.K. Rowling', 'Edinburgh', 'UK');
INSERT INTO AUTHOR VALUES (2, 'George Orwell', 'London', 'UK');
INSERT INTO AUTHOR VALUES (3, 'J.R.R. Tolkien', 'Oxford', 'UK');
INSERT INTO AUTHOR VALUES (4, 'Isaac Asimov', 'New York', 'USA');
INSERT INTO AUTHOR VALUES (5, 'Arthur C. Clarke', 'London', 'UK');

INSERT INTO PUBLISHER VALUES (1, 'Bloomsbury', 'London', 'UK');
INSERT INTO PUBLISHER VALUES (2, 'Secker & Warburg', 'London', 'UK');
INSERT INTO PUBLISHER VALUES (3, 'Harcourt', 'New York', 'USA');
INSERT INTO PUBLISHER VALUES (4, 'Penguin', 'London', 'UK');
INSERT INTO PUBLISHER VALUES (5, 'Del Rey', 'New York', 'USA');

INSERT INTO CATEGORY VALUES (1, 'Fantasy');
INSERT INTO CATEGORY VALUES (2, 'Science Fiction');
INSERT INTO CATEGORY VALUES (3, 'Dystopian');
INSERT INTO CATEGORY VALUES (4, 'Adventure');
INSERT INTO CATEGORY VALUES (5, 'Historical Fiction');

INSERT INTO CATALOG VALUES (1, 'Harry Potter and the Philosophers Stone', 1, 1, 1, 1997, 500);
INSERT INTO CATALOG VALUES (2, '1984', 2, 2, 3, 1949, 300);
INSERT INTO CATALOG VALUES (3, 'The Hobbit', 3, 1, 1, 1937, 400);
INSERT INTO CATALOG VALUES (4, 'Foundation', 4, 3, 2, 1951, 350);
INSERT INTO CATALOG VALUES (5, 'Rendezvous with Rama', 5, 4, 2, 1973, 450);
INSERT INTO CATALOG VALUES (6, 'Harry Potter', 1, 1, 1, 1998, 550);

INSERT INTO ORDER_DETAILS VALUES (101, 1, 10);
INSERT INTO ORDER_DETAILS VALUES (102, 2, 5);
INSERT INTO ORDER_DETAILS VALUES (103, 3, 8);
INSERT INTO ORDER_DETAILS VALUES (104, 4, 12);
INSERT INTO ORDER_DETAILS VALUES (105, 5, 15);

SELECT * FROM AUTHOR;
SELECT * FROM PUBLISHER;
SELECT * FROM CATEGORY;
SELECT * FROM CATALOG;
SELECT * FROM ORDER_DETAILS;


-- 3. Give the details of the authors who have 2 or more books in the catalog, 
-- and the price of the books is greater than the average price of the books in the catalog and the year of publication is after certain year (say 1990).
SELECT a.name
FROM AUTHOR AS a
JOIN CATALOG AS c ON a.author_id = c.author_id
WHERE c.price > (SELECT AVG(price) FROM CATALOG)
  AND c.year > 1970
GROUP BY a.name
HAVING COUNT(c.book_id) >= 2;

-- 4. Find the author of the book which has maximum sales.
SELECT a.name
FROM AUTHOR AS a
JOIN CATALOG AS c ON a.author_id = c.author_id
JOIN ORDER_DETAILS AS o ON c.book_id = o.book_id
WHERE c.book_id = (
    SELECT book_id
    FROM ORDER_DETAILS
    GROUP BY book_id
    ORDER BY SUM(quantity) DESC
    LIMIT 1
);

-- 5. Demonstrate how you increase the price of books published by a specific publisher by 10%.
UPDATE CATALOG
SET price = price * 1.10
WHERE publisher_id = (
    SELECT publisher_id
    FROM PUBLISHER
    WHERE name = 'Bloomsbury'
);

-- 6. Illustrate the use of UNION operator between the table AUTHOR and CATALOG table.
SELECT name FROM AUTHOR
UNION
SELECT title AS name FROM CATALOG;

-- Step 1: Create the SalesDetails view
CREATE VIEW SalesDetails AS
SELECT
    c.book_id,
    c.title,
    a.name AS author_name,
    c.price,
    o.quantity,
    (c.price * o.quantity) AS total_sales,
    c.year
FROM CATALOG c
JOIN ORDER_DETAILS o ON c.book_id = o.book_id
JOIN AUTHOR a ON c.author_id = a.author_id;

-- Step 2: Query to find authors with 2 or more books, price > average price, and year > 2000
SELECT author_name
FROM SalesDetails
WHERE price > (SELECT AVG(price) FROM SalesDetails)
  AND year > 1970
GROUP BY author_name
HAVING COUNT(book_id) >= 2;

-- Step 3: Query to find the author of the book with maximum sales
SELECT author_name
FROM SalesDetails
WHERE total_sales = (SELECT MAX(total_sales) FROM SalesDetails);

-- Step 4: Increase the price of books published by 'Bloomsbury' by 10%
UPDATE CATALOG
SET price = price * 1.10
WHERE publisher_id = (
    SELECT publisher_id
    FROM PUBLISHER
    WHERE name = 'Bloomsbury'
);

-- Step 5: Union of AUTHOR and CATALOG tables
SELECT name AS name
FROM AUTHOR
UNION
SELECT title AS name
FROM CATALOG;