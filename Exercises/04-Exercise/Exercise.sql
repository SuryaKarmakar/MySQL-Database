CREATE DATABASE UniversityDB;
USE UniversityDB;

-- 1. Create the above tables by properly specifying the primary keys and the foreign keys.
CREATE TABLE STUDENT (
    regno VARCHAR(20) PRIMARY KEY,
    name VARCHAR(50),
    major VARCHAR(50),
    bdate DATE
);
CREATE TABLE COURSE (
    course_no INT PRIMARY KEY,
    cname VARCHAR(50),
    dept VARCHAR(50)
);
CREATE TABLE ENROLL (
    regno VARCHAR(20),
    course_no INT,
    sem INT,
    marks INT,
    PRIMARY KEY (regno, course_no),
    FOREIGN KEY (regno) REFERENCES STUDENT(regno),
    FOREIGN KEY (course_no) REFERENCES COURSE(course_no)
);
CREATE TABLE BOOK_ADOPTION (
    course_no INT,
    sem INT,
    book_ISBN INT,
    PRIMARY KEY (course_no, sem, book_ISBN),
    FOREIGN KEY (course_no) REFERENCES COURSE(course_no)
);
CREATE TABLE TEXT (
    book_ISBN INT PRIMARY KEY,
    book_title VARCHAR(100),
    publisher VARCHAR(50),
    author VARCHAR(50)
);

-- 2. Enter at least five tuples for each relation.
INSERT INTO STUDENT VALUES
('S001', 'Alice', 'CS', '2002-05-12'),
('S002', 'Bob', 'Math', '2001-07-24'),
('S003', 'Charlie', 'Physics', '2003-01-15'),
('S004', 'David', 'CS', '2002-11-20'),
('S005', 'Eve', 'Math', '2001-09-10');

INSERT INTO COURSE VALUES
(101, 'Database Systems', 'CS'),
(102, 'Calculus', 'Math'),
(103, 'Quantum Mechanics', 'Physics'),
(104, 'Algorithms', 'CS'),
(105, 'Statistics', 'Math');

INSERT INTO ENROLL VALUES
('S001', 101, 1, 85),
('S002', 102, 2, 90),
('S003', 103, 3, 78),
('S004', 104, 1, 88),
('S005', 105, 2, 92);

INSERT INTO BOOK_ADOPTION VALUES
(101, 1, 1111),
(102, 2, 2222),
(103, 3, 3333),
(104, 1, 4444),
(105, 2, 5555);

INSERT INTO TEXT VALUES
(1111, 'Database Principles', 'Pearson', 'Elmasri'),
(2222, 'Calculus Made Easy', 'Wiley', 'Thompson'),
(3333, 'Quantum Theory', 'Springer', 'Einstein'),
(4444, 'Algorithm Design', 'MIT Press', 'Kleinberg'),
(5555, 'Statistical Methods', 'Oxford', 'Fisher');

SELECT * FROM STUDENT;
SELECT * FROM COURSE;
SELECT * FROM ENROLL;
SELECT * FROM BOOK_ADOPTION;
SELECT * FROM TEXT;

-- 3. Demonstrate how you add a new text book to the database and make this book be adopted by some department.
INSERT INTO TEXT VALUES (6666, 'Data Science Handbook', 'OReilly', 'Smith');
INSERT INTO BOOK_ADOPTION VALUES (101, 1, 6666);

-- 4. List the students who have been enrolled.
SELECT * FROM STUDENT WHERE regno IN (SELECT regno FROM ENROLL);

-- 5. List the students who have registered but not enrolled.
SELECT * FROM STUDENT WHERE regno NOT IN (SELECT regno FROM ENROLL);

-- 6. List the books which have been adopted.
SELECT * FROM TEXT WHERE book_ISBN IN (SELECT book_ISBN FROM BOOK_ADOPTION);

-- 7. List any department that has all its adopted books published by a specific publisher.
SELECT dept FROM COURSE
WHERE course_no IN
(SELECT course_no FROM BOOK_ADOPTION
WHERE book_ISBN IN (SELECT book_ISBN FROM TEXT WHERE publisher = 'Pearson'))
GROUP BY dept;

-- Step 9: Demonstrate Joins
-- Inner Join
SELECT S.regno, S.name, E.course_no, E.marks
FROM STUDENT S
INNER JOIN ENROLL E ON S.regno = E.regno;

-- Left Join
SELECT S.regno, S.name, E.course_no, E.marks
FROM STUDENT S
LEFT JOIN ENROLL E ON S.regno = E.regno;

-- Right Join
SELECT S.regno, S.name, E.course_no, E.marks
FROM STUDENT S
RIGHT JOIN ENROLL E ON S.regno = E.regno;

-- Full Join (Using UNION for MySQL since FULL JOIN is not supported)
SELECT S.regno, S.name, E.course_no, E.marks
FROM STUDENT S
LEFT JOIN ENROLL E ON S.regno = E.regno
UNION
SELECT S.regno, S.name, E.course_no, E.marks
FROM STUDENT S
RIGHT JOIN ENROLL E ON S.regno = E.regno;