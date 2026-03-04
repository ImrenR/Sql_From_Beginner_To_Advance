/*============================== ON DELETE CASCADE =============================
When deleting a parent record, instead of deleting child records first,
the **ON DELETE CASCADE** option allows automatic deletion of related child records.

This means:
Deleting a parent record will automatically delete dependent child records.

To use cascade deletion, add **ON DELETE CASCADE** at the end of the foreign key definition.
==============================================================================*/

CREATE TABLE ogrenciler
(
    id CHAR(3) PRIMARY KEY,  
    isim VARCHAR(50),
    veli_isim VARCHAR(50),
    yazili_notu INT
);

INSERT INTO ogrenciler VALUES(101, 'Haluk Bilgin', 'JavaCan',75);
INSERT INTO ogrenciler VALUES(102, 'Ipek Bilir', 'JavaNaz',85);
INSERT INTO ogrenciler VALUES(103, 'Harun Bil', 'JavaSu',85);
INSERT INTO ogrenciler VALUES(104, 'Hasan Bilmiş', 'JavaTar',95);
INSERT INTO ogrenciler VALUES(105, 'Halime Bilse', 'JavvaNur',99);

SELECT * FROM ogrenciler;

/* ---------------- Child Table ---------------- */

CREATE TABLE notlar
(
    ogrenci_id CHAR(3),
    ders_adi VARCHAR(30),
    yazili_notu INT
);

/* Data insertion */

INSERT INTO notlar VALUES ('101','Kimya',75);
INSERT INTO notlar VALUES ('102','Fizik',65);
INSERT INTO notlar VALUES ('103','Tarih',90);
INSERT INTO notlar VALUES ('104','Matematik',90);