/* ======================== DELETE - TRUNCATE - DROP ============================   

1-) **TRUNCATE** deletes all records from a table like DELETE without WHERE clause.
    - Conditional deletion is not allowed.

2-) **DELETE** can be used with WHERE clause for selective deletion.
    - Data deleted with DELETE can be restored using ROLLBACK if transaction control is supported.

3-) **TRUNCATE** removes all records but keeps table structure.
    - Data recovery after TRUNCATE is difficult but may be possible depending on transaction settings.

4-) **DROP** is a DDL command.
    - DROP deletes both table structure and data.
    - ROLLBACK usually does not work after DROP.

===================================================================================*/

USE JavaCan;

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

/* ---------------- Transaction Control ---------------- */

START TRANSACTION;

SAVEPOINT geri_getir;
-- Data is backed up at this savepoint for recovery.

INSERT INTO ogrenciler VALUES(108, 'Imren Bak', 'JavaLar',100);
INSERT INTO ogrenciler VALUES(109, 'Erdem Bee', 'JavaHan',101);

-- Protects data from accidental deletion using savepoints.

DELETE FROM ogrenciler;

ROLLBACK TO geri_getir;
-- Restores data to the savepoint.

-- Note:
-- If auto-commit is enabled in SQL editor settings, transaction rollback may not work.

DROP TABLE ogrenciler;
-- Drops the entire table structure and data; rollback is not possible.

TRUNCATE TABLE ogrenciler;
-- Removes all records but keeps table structure.
-- Usually faster than DELETE.