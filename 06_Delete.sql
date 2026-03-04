/* ============================== DELETE ===================================  

DELETE FROM table_name;  
→ Deletes all records in the table.

DELETE FROM table_name WHERE column_name = value;  
→ Deletes specific records using filtering.

=========================================================================*/

CREATE TABLE ogrenciler
(
    id CHAR(3),
    isim VARCHAR(50),
    veli_isim VARCHAR(50),
    yazili_notu INT       
);

INSERT INTO ogrenciler VALUES(101, 'Haluk Bilgin', 'JavaCan',75);
INSERT INTO ogrenciler VALUES(102, 'Ipek Bilir', 'JavaNaz',85);
INSERT INTO ogrenciler VALUES(103, 'Harun Bil', 'JavaSu',85);
INSERT INTO ogrenciler VALUES(104, 'Hasan Bilmiş', 'JavaTar',95);
INSERT INTO ogrenciler VALUES(105, 'Halime Bilse', 'JavvaNur',83);
INSERT INTO ogrenciler VALUES(106, 'Haline Bak', 'JavaLar',99);
INSERT INTO ogrenciler VALUES(107, 'Hanimiş Bee', 'JavaHan',91);

SELECT * FROM ogrenciler;

/* 
DELETE FROM ogrenciler;  
→ Deletes all data in the table.

ROLLBACK can restore deleted data if transaction control is supported.
*/

/* =============================================================================
   Deleting records using filtering (WHERE clause)
=============================================================================== */

-- Task01 -> Delete student with id = 102

DELETE FROM ogrenciler WHERE id = 102;

-- Task02 -> Delete record where name is Haluk Bilgin

DELETE FROM ogrenciler WHERE isim = 'Haluk Bilgin';

-- Task03 -> Delete records where name is Halime Bilse or Hasan Bilmis

DELETE FROM ogrenciler 
WHERE isim = 'Halime Bilse' 
OR isim = 'Hasan Bilmis';

-- Task04 -> Delete record where name is Harun Bil and id is 105

DELETE FROM ogrenciler 
WHERE isim = 'Harun Bil' 
AND id = 105;

-- Task05 -> Delete records where id is greater than 103

DELETE FROM ogrenciler 
WHERE id > 103;

-- Task06 -> Delete records where id is 106, 107, or 104

DELETE FROM ogrenciler 
WHERE id IN (106, 107, 104);

-- Task07 -> Delete all records in the table

DELETE FROM ogrenciler;