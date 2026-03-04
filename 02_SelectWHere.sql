/******************************************************
              SELECT - WHERE FILTERING
 ******************************************************/

USE JavaCAN;

CREATE TABLE ogrenciler(
    id INT,
    isim VARCHAR(45),
    adres VARCHAR(100),
    sinav_notu INT
);

INSERT INTO ogrenciler VALUES(101,'Celine','Ankara',99);
INSERT INTO ogrenciler VALUES(102,'Murat','Bursa',88);
INSERT INTO ogrenciler VALUES(103,'Nur','Istanbul',77);
INSERT INTO ogrenciler VALUES(104,'Abdi','Kütahya',43);
INSERT INTO ogrenciler VALUES(105,'Mustafa','Kayseri',38);
INSERT INTO ogrenciler VALUES(107,'Haluk','Denizli',10);
INSERT INTO ogrenciler VALUES(107,'Aydin','Maraş',61);

SELECT * FROM ogrenciler;

/*
While retrieving data using SELECT statement,
WHERE clause is used for filtering records.

Syntax:
SELECT column1, column2 ... 
FROM table_name 
WHERE condition;
*/

-- Task01 -> List students whose exam score is greater than 80.

SELECT * FROM ogrenciler WHERE sinav_notu > 80;

/*
Task02 -> List name and address of students whose address is Ankara.
*/

SELECT * FROM ogrenciler WHERE adres = 'Ankara';

/*
Task03 -> List all information of students whose id is 104.
*/

SELECT * FROM ogrenciler WHERE id = 104;

/*********************************
             SELECT - BETWEEN
**********************************/

CREATE TABLE personel
(
    id CHAR(4),
    isim VARCHAR(50),
    maas INT
);

INSERT INTO personel VALUES('1001', 'Haluk Bilgin', 70000);
INSERT INTO personel VALUES('1002', 'Java Han', 85000);
INSERT INTO personel VALUES('1003', 'Java Han', 65000);
INSERT INTO personel VALUES('1004', 'Java Tar', 95000);
INSERT INTO personel VALUES('1005', 'Javva Nur', 80000);
INSERT INTO personel VALUES('1006', 'Java Naz', 100000);
INSERT INTO personel VALUES('1006', 'Java Su', 333000);
INSERT INTO personel VALUES('1006', 'Java Can', 222000);

SELECT * FROM personel;

/*
BETWEEN is used to filter data between two logical values.
Important trick → BETWEEN includes boundary values.
*/

/*********************************
             AND - OR
**********************************/

/*
AND operator:
Both conditions must be true to list the record.

OR operator:
At least one condition must be true to list the record.
*/

-- Task04 -> List personnel whose id is between 1002 and 1005.

SELECT * FROM personel WHERE id BETWEEN '1002' AND '1005';

-- Task05 -> List personnel whose name is between 'Java Tar' and 'Java Nur'.

SELECT * FROM personel WHERE isim BETWEEN 'Java Tar' AND 'Java Nur';

-- Task06 -> List personnel whose salary is 70000 OR name is Java Naz.

SELECT * FROM personel WHERE maas = 70000 OR isim = 'Java Naz';

/*********************************
                      IN
**********************************/

/*
IN operator allows multiple OR conditions to be written in a simpler way.

Syntax:
SELECT column1, column2 ...
FROM table_name
WHERE column_name IN (value1, value2);
*/

-- Task07 -> List personnel whose id is 1001, 1002, and 1004.

SELECT * FROM personel WHERE id IN('1001','1002','1004');

-- Task08 -> List personnel whose salary is 70000 or 100000.

SELECT * FROM personel WHERE maas IN(100000,70000);

-- Task08.5 -> List personnel whose salary is 70000 OR name is Javva Nur.

SELECT * FROM personel WHERE maas = 70000 OR isim = 'Javva Nur';

/*********************************
              SELECT - LIKE
**********************************/

/*
LIKE operator is used for pattern matching.

Patterns:
% -> Represents zero or more characters.
_ -> Represents a single character.
*/

-- Task09 -> List personnel whose name starts with J.

SELECT * FROM personel WHERE isim LIKE 'J%';

-- Task09.5 -> List personnel whose name starts with J and is 8 characters long.

SELECT * FROM personel WHERE isim LIKE 'J_______';

-- Task10 -> List personnel whose name ends with N.

SELECT * FROM personel WHERE isim LIKE '%N';

-- Task11 -> List personnel whose 3rd character is L.

SELECT * FROM personel WHERE isim LIKE '__L%';

-- Task12 -> List personnel whose 2nd character is A and contains C in other positions.

SELECT * FROM personel WHERE isim LIKE '_A%C%';

-- Task13 -> List personnel whose name does NOT contain A.

SELECT * FROM personel WHERE isim NOT LIKE '%A%';

-- Task14 -> List personnel whose salary has 6 digits.

SELECT * FROM personel WHERE maas LIKE '______';

-- Task15 -> List personnel whose name starts with J and 7th character is A.

SELECT * FROM personel WHERE isim LIKE 'J_____A%';