/* ===================== CONSTRAINTS =====================================
           
NOT NULL     - Prevents a column from containing NULL (empty) values.
UNIQUE       - Ensures all values in a column are distinct.
PRIMARY KEY  - Combines NOT NULL and UNIQUE constraints.
FOREIGN KEY  - References the PRIMARY KEY of another table to create relationships between tables.

========================================================================== */

USE javacan;

/* ---------------- Parent Table ---------------- */

CREATE TABLE calisanlar
(
    id CHAR(5) PRIMARY KEY,   -- PRIMARY KEY = NOT NULL + UNIQUE
    isim VARCHAR(50) UNIQUE,
    maas INT NOT NULL,
    ise_baslama DATE
);

/* ---------------- Data Insertions ---------------- */

INSERT INTO calisanlar VALUES('10002', 'Haluk Bilgin', 12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', NULL, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', NULL, 5000, '2018-04-14'); 
-- Multiple NULLs are allowed in UNIQUE columns

INSERT INTO calisanlar VALUES('10004', 'Ipek Bilir', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Harun Bil', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Halime Bilse', NULL, '2019-04-12'); 
-- NOT NULL constraint prevents this record

INSERT INTO calisanlar VALUES('10003', 'Merve Bilmiş', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'Merve Bilmiş', 5000, '2018-04-14'); 
-- Duplicate UNIQUE value may cause error

INSERT INTO calisanlar VALUES('10009', 'cem', 0, '2018-04-14'); 
-- Empty string '' should not be used for numeric columns

INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14'); 
-- Empty PK value is generally not recommended

INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); 
-- Duplicate primary key violation

INSERT INTO calisanlar VALUES(NULL, 'filiz', 12000, '2018-04-14'); 
-- Primary key cannot be NULL

SELECT * FROM calisanlar;

/* ---------------- Child Table (Foreign Key) ---------------- */

CREATE TABLE adresler
(
    adres_id CHAR(5),
    sokak VARCHAR(50),
    cadde VARCHAR(30),
    sehir VARCHAR(15),

    CONSTRAINT id_clsnlr 
    FOREIGN KEY(adres_id) 
    REFERENCES calisanlar(id)
);

/* ---------------- Data Insertions ---------------- */

INSERT INTO calisanlar VALUES('10002', 'Ayse Yılmaz', 12000, '2018-04-14');

INSERT INTO adresler VALUES('10004','Ebik Sok','34.Cad','IST');
INSERT INTO adresler VALUES('10003','Gabik Sok','6.Cad','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok','35.Cad','Izmir');

INSERT INTO adresler VALUES('10012','Ağa Sok','27.Cad','Antep'); 
-- Foreign key violation because parent table has no id 10012

INSERT INTO adresler VALUES(NULL,'Java Sok','65.Cad','Van'); 
-- Foreign key allows NULL values

INSERT INTO adresler VALUES(NULL,'Ağa Sok','46.Cad','Maraş');

SELECT * FROM adresler;
SELECT * FROM calisanlar;

/* Join two tables */

SELECT *
FROM calisanlar c
JOIN adresler a 
ON c.id = a.adres_id;

/*
Foreign key rule explanation:

Parent table cannot be deleted while child table exists.

DROP TABLE calisanlar; 
-- Will fail because of foreign key constraint.

Interview Insight:
Child table must be deleted first before deleting parent table.
*/

DROP TABLE adresler;
-- Child table can be deleted directly.

-- After deleting child table, parent table can also be dropped if needed.