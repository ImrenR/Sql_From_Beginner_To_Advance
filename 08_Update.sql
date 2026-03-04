/* ---------------- UPDATE - SET ----------------  

Syntax:
UPDATE table_name 
SET column1 = new_value1, column2 = new_value2 ...
WHERE condition;

If WHERE is not used → all records will be updated.

-------------------------------------------------- */

USE JavaCan;

/* ---------------- Parent Table ---------------- */

CREATE TABLE tedarikciler
(
    vergi_no INT PRIMARY KEY,
    firma_ismi VARCHAR(50),
    irtibat_ismi VARCHAR(50)
);

INSERT INTO tedarikciler VALUES (101, 'IBM', 'Java CAN');
INSERT INTO tedarikciler VALUES (102, 'Clarus', 'Ebik Gabik');
INSERT INTO tedarikciler VALUES (103, 'Google', 'Java NAZ');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Java SU');
INSERT INTO tedarikciler VALUES (105, 'Micro Soft', 'Javva NUR');

SELECT * FROM tedarikciler;

/* ---------------- Child Table ---------------- */

CREATE TABLE urunler
(
    ted_vergino INT, 
    urun_id INT, 
    urun_isim VARCHAR(50), 
    musteri_isim VARCHAR(50),

    CONSTRAINT fk_urunler 
    FOREIGN KEY(ted_vergino) 
    REFERENCES tedarikciler(vergi_no)
    ON DELETE CASCADE
);

INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Haluk Bilgin');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Ipek Bilir');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Harun Bil');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Hasan Bilmiş');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Halime Bak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Merve Bilmiş');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Gibi');
INSERT INTO urunler VALUES(106, 1007,'Phone', 'Cin Li');

SELECT * FROM tedarikciler;
SELECT * FROM urunler;

/* Join Example */

SELECT *
FROM tedarikciler t
JOIN urunler u 
ON t.vergi_no = u.ted_vergino;

/* ---------------- TASKS ---------------- */

/* Task01:
Update company name to 'Istanbul' where vergi_no = 102.
*/

UPDATE tedarikciler 
SET firma_ismi = 'Istanbul' 
WHERE vergi_no = 102;

/* Task02:
Update all firm names in tedarikciler table to 'Ankara'.
*/

UPDATE tedarikciler 
SET firma_ismi = 'Ankara';

/* Task03:
Update firm name to 'Gamze' and contact name to 'Okan'
where vergi_no = 101.
*/

UPDATE tedarikciler 
SET firma_ismi = 'Gamze',
    irtibat_ismi = 'Okan'
WHERE vergi_no = 101;

/* Task04:
Update contact name to 'Bill Gates'
where firma_ismi = 'Ankara'.
*/

UPDATE tedarikciler 
SET irtibat_ismi = 'Bill Gates' 
WHERE LOWER(firma_ismi) = 'ankara';

/* Task05:
Convert product name 'Phone' to 'Telefon'.
*/

UPDATE urunler 
SET urun_isim = 'Telefon'
WHERE urun_isim = 'Phone';

/* Task06:
Increase urun_id by 1 where urun_id > 1004.
*/

UPDATE urunler 
SET urun_id = urun_id + 1
WHERE urun_id > 1004;

SELECT * FROM urunler;

/* Task07:
Update urun_id by adding ted_vergino value.
*/

UPDATE urunler 
SET urun_id = urun_id + ted_vergino;

/* Task08:
Replace product name of Merve Bilmiş’s purchase with
the firm name where contact name is 'Halime Bak'.
*/

UPDATE urunler
SET urun_isim = (
    SELECT firma_ismi 
    FROM tedarikciler 
    WHERE irtibat_ismi = 'Halime Bak'
)
WHERE LOWER(musteri_isim) = 'merve bilmiş';

/* Task09:
Change customers buying 'Laptop' to contact name of firm 'Apple'.
*/

UPDATE urunler 
SET musteri_isim = (
    SELECT irtibat_ismi 
    FROM tedarikciler 
    WHERE LOWER(firma_ismi) = 'apple'
)
WHERE LOWER(urun_isim) = 'laptop';