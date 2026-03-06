/*============================== JOIN OPERATIONS ===============================
    
    Set Operators (Union, Union All, {Oracle->Intersect, Minus}) are used to
    combine columns from different tables.
    
    Join operations are used to combine different tables. In other words, they
    allow creating a new table from selected columns of different tables.
    
    JOIN operations are very important in Relational Databases because they
    allow retrieving columns from related tables via Foreign Keys.
    
    In MySQL, there are 3 types of JOINs:
    
    1) INNER JOIN: Shows the intersection of tables (common rows)
    2) LEFT JOIN: Shows all rows from the first (left) table
    3) RIGHT JOIN: Shows all rows from the second (right) table
       FULL JOIN = (left join + union + right join) Shows all rows from both tables

"Left" and "right" refer to which table is the main table and which is the
joined table during a SQL join operation.

            1. Left Join:
    • Left join considers the left table (first table) as the main table and
      the right table (second table) as the joined table.
    • All records from the left table are displayed, and for matching records,
      the corresponding columns from the right table are shown.
    • If there is no match, the left table record still appears and the right
      table columns show NULL.
            
            2. Right Join:
    • Right join considers the right table (second table) as the main table
      and the left table as the joined table.
    • All records from the right table are displayed, and for matching records,
      the corresponding columns from the left table are shown.
    • If there is no match, the right table record still appears and the left
      table columns show NULL.
      
Which join type to use depends on your data model and requirements. Left joins
are more common because usually there is a primary table and related secondary
tables. But right joins can be needed when the "main" table is the secondary
one, or for specific reporting needs.
==============================================================================*/  

CREATE TABLE company 
(
    company_id INT, 
    company_name VARCHAR(20)
);

INSERT INTO company VALUES(100, 'Toyota');
INSERT INTO company VALUES(101, 'Honda');
INSERT INTO company VALUES(102, 'Ford');
INSERT INTO company VALUES(103, 'Hyundai');
SELECT * FROM company;

CREATE TABLE orders
(
    order_id INT,
    company_id INT, 
    order_date DATE
);

INSERT INTO orders VALUES(11, 101, '2020-04-17');
INSERT INTO orders VALUES(22, 102, '2020-04-18');
INSERT INTO orders VALUES(33, 103, '2020-04-19');
INSERT INTO orders VALUES(44, 104, '2020-04-20');
INSERT INTO orders VALUES(55, 105, '2020-04-21');
SELECT * FROM orders;

/*=============================== INNER JOIN  ==================================
    
Used to create a new table from the intersection of two tables.

Syntax
-----------
SELECT column1, column2,...columnN
FROM table1 
INNER JOIN table2
ON table1.column = table2.column;
================================================================================*/

/* -----------------------------------------------------------------------------
  Task01 -> List company_name, order_id, and order_date for rows where 
  company_id exists in both tables
------------------------------------------------------------------------------*/

/*=============================== LEFT JOIN  ==================================
    
LEFT JOIN returns all rows from the first table (left/main table) and only
matching rows from the second table (right table).

Syntax
-----------
SELECT column1, column2,...columnN
FROM table1 
LEFT JOIN table2
ON table1.column = table2.column;
==============================================================================*/  

/* -----------------------------------------------------------------------------
  Task02 -> List all companies and the order_id and order_date if available
------------------------------------------------------------------------------*/

/*=============================== RIGHT JOIN  ==================================
    
RIGHT JOIN returns all rows from the second table (right/main table) and only
matching rows from the first table (left table).

Syntax
-----------
SELECT column1, column2,...columnN
FROM table1 
RIGHT JOIN table2
ON table1.column = table2.column;
==============================================================================*/  

/* -----------------------------------------------------------------------------
  Task03 -> List all orders with order_id and order_date along with the 
  corresponding company_name if available
------------------------------------------------------------------------------*/

/*=============================== FULL JOIN  ==================================
FULL JOIN: (left join + union + right join)
Returns all rows from both tables.

Syntax
-----------
SELECT column1, column2,...columnN
FROM table1 
LEFT JOIN table2
ON table1.column = table2.column
UNION ALL
SELECT column1, column2,...columnN
FROM table1 
RIGHT JOIN table2
ON table1.column = table2.column;
==============================================================================*/  

/* -----------------------------------------------------------------------------
  Task04 -> List company_name, order_id, and order_date from both tables
------------------------------------------------------------------------------*/

/* ********************************************** */

CREATE TABLE department (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(14),
    location  VARCHAR(13)
);

INSERT INTO department VALUES (10,'ACCOUNTING','IST');
INSERT INTO department VALUES (20,'MANAGEMENT','ANKARA');
INSERT INTO department VALUES (30,'SALES','IZMIR');
INSERT INTO department VALUES (40,'BUSINESS','BURSA');
INSERT INTO department VALUES (50,'WAREHOUSE', 'YOZGAT');
SELECT * FROM department;

CREATE TABLE employee (
    emp_id   INT PRIMARY KEY,
    emp_name VARCHAR(10),
    job      VARCHAR(9),
    manager_id INT,
    salary   INT,
    dept_id  INT
);

SELECT * FROM employee;

INSERT INTO employee VALUES (7369,'AHMET','CLERK',1111,800,20);
INSERT INTO employee VALUES (7499,'BAHATTIN','SALES',1222,1600,30);
INSERT INTO employee VALUES (7521,'NESE','SALES',1222,1250,30);
INSERT INTO employee VALUES (1111,'MUZAFFER','MANAGER',7839,2975,20);
INSERT INTO employee VALUES (7654,'MUHAMMET','SALES',1222,1250,30);
INSERT INTO employee VALUES (1222,'EMINE','MANAGER',7839,2850,30);
INSERT INTO employee VALUES (1333,'HARUN','MANAGER',7839,2450,10);
INSERT INTO employee VALUES (7788,'MESUT','ANALYST',1111,3000,20);
INSERT INTO employee VALUES (7839,'SEHER','CEO',NULL,5000,10);
INSERT INTO employee VALUES (7844,'DUYGU','SALES',1222,1500,30);
INSERT INTO employee VALUES (7876,'ALI','CLERK',1111,1100,20);
INSERT INTO employee VALUES (7900,'MERVE','CLERK',1222,950,30);
INSERT INTO employee VALUES (7902,'NAZLI','ANALYST',1111,3000,20);
INSERT INTO employee VALUES (7934,'EBRU','CLERK',1333,1300,10);
INSERT INTO employee VALUES (7956,'SIBEL','ARCHITECT',1333,3300,60);
INSERT INTO employee VALUES (7933,'ZEKI','ENGINEER',1333,4300,60);

/* -----------------------------------------------------------------------------
  Task05 -> List names and departments of employees working in SALES or ACCOUNTING,
  sorted first by department, then by name
------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------
  Task06 -> List names and departments of employees working in SALES, BUSINESS, or WAREHOUSE.
  NOTE: Departments without employees should still appear.
------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------
  Task07 -> List all employees with their department, name, and salary,
  sorted by department descending and salary ascending. Departments without employees should still appear.
------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------
  Task08 -> List employees in SALES and MANAGEMENT with salary > 2000,
  including name, department, and salary, sorted by department and name
------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------
  Task09 -> List employees whose manager is Harun or Emine,
  including department, employee name, salary, and manager name
  (the manager’s name should appear on the row corresponding to their employees)
------------------------------------------------------------------------------*/