CREATE DATABASE IF NOT EXISTS JavaCan; 
-- Using IF NOT EXISTS prevents duplicate database creation errors when creating a database for the first time.

CREATE DATABASE JavaCan; 
-- Creates a new database named JavaCan (if it does not already exist).

USE JavaCan; 
-- Switches to the existing database JavaCan.

USE imren;
-- Switches to database imren (if it exists).

-- Single-line comment

/* Multi-line comment */

CREATE TABLE students(
    id VARCHAR(4),
    name VARCHAR(50),
    grade INT,
    age INT
); 
-- Column definitions with data types.

/******************************************************
                    DATA INSERTION
******************************************************/

INSERT INTO students VALUES('1001','haluk',77,23);
INSERT INTO students VALUES('1002','tulin',88,15);
INSERT INTO students VALUES('1003','erdem',95,11);
INSERT INTO students VALUES('1002','mehmet',63,21);

/******************************************************
                    DATA QUERYING
******************************************************/

SELECT * FROM students;
-- Retrieves all records from students table.

/******************************************************
                PARTIAL DATA INSERTION
******************************************************/

INSERT INTO students(id,age) VALUES('99',50);

SELECT * FROM students;

/******************************************************
                DROP TABLE
******************************************************/

DROP TABLE students;
-- Deletes students table from database.