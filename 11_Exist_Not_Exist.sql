/*=========================== EXISTS, NOT EXISTS ================================
   The EXISTS condition is used with subqueries. Similar to the IN operator,
   EXISTS and NOT EXISTS check whether a value exists or does not exist in
   the result set returned from a subquery.

   EXISTS is a Boolean operator and returns TRUE or FALSE.

   EXISTS is commonly used in subqueries to test row existence.

   If a subquery returns at least one row, EXISTS returns TRUE.
   Otherwise, it returns FALSE.

   It is especially useful for fast existence checks in subqueries.

   SYNTAX:
   SELECT column_name  
   FROM table_name  
   WHERE [NOT] EXISTS (  
       SELECT column_name   
       FROM table_name   
       WHERE condition  
   ); 
==============================================================================*/

use JavaCan;

CREATE TABLE mayis
(
    urun_id int,
    musteri_isim varchar(50), 
    urun_isim varchar(50)
);

CREATE TABLE haziran 
(
    urun_id int ,
    musteri_isim varchar(50), 
    urun_isim varchar(50)
);

/* Insert data into May table */
INSERT INTO mayis VALUES (10, 'Haluk', 'javaCAN');
INSERT INTO mayis VALUES (20, 'Harun', 'javaTAR');
INSERT INTO mayis VALUES (30, 'Ipek', 'javaNAZ');
INSERT INTO mayis VALUES (20, 'Hasan', 'javaHAN');
INSERT INTO mayis VALUES (10, 'Halime', 'javaSU');
INSERT INTO mayis VALUES (40, 'Ebik', 'Gabik');
INSERT INTO mayis VALUES (20, 'Merve', 'javvaNUR');

/* Insert data into June table */
INSERT INTO haziran VALUES (10, 'Hasmayan', 'javaCAN');
INSERT INTO haziran VALUES (10, 'Kemal', 'javaCAN');
INSERT INTO haziran VALUES (20, 'Hesna', 'javaTAR');
INSERT INTO haziran VALUES (50, 'Esen', 'javvaNUR');
INSERT INTO haziran VALUES (20, 'Esmeyen', 'javaTAR');

SELECT * FROM mayis;
SELECT * FROM haziran;

/* -----------------------------------------------------------------------------
Task 01 -> Write a query that lists URUN_IDs of products sold in both May and June
with the same URUN_ID, and also lists the MUSTERI_ISIMs of customers who bought
these products in May.
-----------------------------------------------------------------------------*/        

SELECT urun_id, musteri_isim 
FROM mayis
WHERE EXISTS (
    SELECT urun_id 
    FROM haziran 
    WHERE mayis.urun_id = haziran.urun_id
);

/*
Alternative solution using IN:

SELECT urun_id, musteri_isim 
FROM mayis
WHERE urun_id IN (
    SELECT urun_id 
    FROM haziran 
    WHERE mayis.urun_id = haziran.urun_id
);
*/

/* -----------------------------------------------------------------------------
Task 02 -> Write a query that lists URUN_ISIMs of products sold in both months
and MUSTERI_ISIMs of customers who purchased these products in June.
-----------------------------------------------------------------------------*/

SELECT urun_id, musteri_isim 
FROM haziran AS h
WHERE EXISTS (
    SELECT urun_id 
    FROM mayis AS m 
    WHERE m.urun_id = h.urun_id
);

/* -----------------------------------------------------------------------------
Task 03 -> Write a query that lists products that were NOT commonly sold in both months,
including URUN_ISIMs and MUSTERI_ISIMs of customers who purchased these products in June.
-----------------------------------------------------------------------------*/ 

SELECT urun_id, musteri_isim 
FROM haziran AS h
WHERE NOT EXISTS (
    SELECT urun_id 
    FROM mayis AS m 
    WHERE m.urun_id = h.urun_id
);

/* -----------------------------------------------------------------------------
Task 04 -> Write a query that lists products that were NOT commonly sold in both months,
including URUN_ISIMs and MUSTERI_ISIMs of customers who purchased these products in May.
-----------------------------------------------------------------------------*/ 

SELECT urun_id, musteri_isim 
FROM mayis AS m
WHERE NOT EXISTS (
    SELECT urun_id 
    FROM haziran AS h 
    WHERE m.urun_id = h.urun_id
);