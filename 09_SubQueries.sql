/*============================= SUBQUERIES ====================================
A subquery is a query executed inside another query.

Syntax:
Main Query → (Subquery)

Subqueries are commonly used with:
- IN / EXISTS
- Aggregate functions
================================================================================*/

USE JavaCan;

/* ---------------- Tables ---------------- */

CREATE TABLE calisanlar 
(
    id INT, 
    isim VARCHAR(50), 
    sehir VARCHAR(50), 
    maas INT, 
    isyeri VARCHAR(20)
);

INSERT INTO calisanlar VALUES(123456789, 'Haluk Bilgin', 'Istanbul', 50000, 'IBM');
INSERT INTO calisanlar VALUES(234567890, 'Ipek Bilir', 'Istanbul', 25000, 'Google');
INSERT INTO calisanlar VALUES(345678901, 'Harun Bilmiş', 'Ankara', 13000, 'IBM');
INSERT INTO calisanlar VALUES(456789012, 'Harun Bilmiş', 'Izmir', 10000, 'Microsoft');
INSERT INTO calisanlar VALUES(567890123, 'Harun Bilmiş', 'Ankara', 17000, 'Amazon');
INSERT INTO calisanlar VALUES(456789012, 'Ipek Bilir', 'Ankara', 15000, 'Microsoft');
INSERT INTO calisanlar VALUES(123456710, 'Halime Bak', 'Bursa', 25000, 'IBM');

/* ---------------- Markalar Table ---------------- */

CREATE TABLE markalar
(
    marka_id INT, 
    marka_isim VARCHAR(20), 
    calisan_sayisi INT
);

INSERT INTO markalar VALUES(100, 'IBM', 12000);
INSERT INTO markalar VALUES(101, 'Microsoft', 18000);
INSERT INTO markalar VALUES(102, 'Amazon', 10000);
INSERT INTO markalar VALUES(103, 'Google', 21000);

SELECT * FROM calisanlar;
SELECT * FROM markalar;

/* ================= TASKS ================= */

/* Task01:
List names, workplace, and salary of employees working in brands
that have more than 15000 employees.
*/

SELECT isim, isyeri, maas 
FROM calisanlar
WHERE isyeri IN (
    SELECT marka_isim 
    FROM markalar 
    WHERE calisan_sayisi > 15000
);

/* Task02:
List name, salary, and city of employees working in brands
whose marka_id is greater than 101.
*/

SELECT isim, maas, sehir 
FROM calisanlar
WHERE isyeri IN (
    SELECT marka_isim 
    FROM markalar 
    WHERE marka_id > 101
);

/* Task03:
List marka_id and employee count of brands that have employees working in Ankara.
*/

SELECT marka_id, calisan_sayisi 
FROM markalar
WHERE marka_isim IN (
    SELECT isyeri 
    FROM calisanlar 
    WHERE sehir = 'Ankara'
);

/* ================= AGGREGATE FUNCTIONS IN SUBQUERIES ===========================
Aggregate functions (SUM, COUNT, MIN, MAX, AVG) can be used in subqueries.

Important rule:
The subquery must return a single value when used in SELECT list.
==============================================================================*/

/* Task04:
List each brand name, employee count, and total salary of employees working in that brand.
*/

SELECT 
    marka_isim,
    calisan_sayisi,
    (SELECT SUM(maas) 
     FROM calisanlar 
     WHERE marka_isim = isyeri) AS toplam_maas
FROM markalar;

/* Task05:
List each brand name, employee count, and average salary of employees working in that brand.
*/

SELECT 
    marka_isim,
    calisan_sayisi,
    (SELECT AVG(maas) 
     FROM calisanlar 
     WHERE marka_isim = isyeri) AS ortalama_maas
FROM markalar;

/* Task06:
List each brand name, employee count, and minimum & maximum salary of employees working in that brand.
*/

SELECT 
    marka_isim,
    calisan_sayisi,
    (SELECT MIN(maas) 
     FROM calisanlar 
     WHERE marka_isim = isyeri) AS min_maas,
    (SELECT MAX(maas) 
     FROM calisanlar 
     WHERE marka_isim = isyeri) AS max_maas
FROM markalar;