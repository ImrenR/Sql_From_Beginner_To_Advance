/* ============================== DELETE ===================================  

DELETE FROM tablo_adı;  Tablonun tüm içeriğini siler.
DELETE FROM tablo_adı WHERE sutun_adi = veri; Tabloda istediğiniz record veriyi siler.

=========================================================================*/

CREATE TABLE ogrenciler
(
id CHAR(3),
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int       
);
INSERT INTO ogrenciler VALUES(101, 'Haluk Bilgin', 'JavaCan',75);
INSERT INTO ogrenciler VALUES(102, 'Ipek Bilir', 'JavaNaz',85);
INSERT INTO ogrenciler VALUES(103, 'Harun Bil', 'JavaSu',85);
INSERT INTO ogrenciler VALUES(104, 'Hasan Bilmiş', 'JavaTar',95);
INSERT INTO ogrenciler VALUES(105, 'Halime Bilse', 'JavvaNur',83);
INSERT INTO ogrenciler VALUES(106, 'Haline Bak', 'JavaLar',99);
INSERT INTO ogrenciler VALUES(107, 'Hanimiş Bee', 'JavaHan',91);


select * from ogrenciler;

--   DELETE FROM ogrenciler;    -- Tüm verileri sil.
--   ROLLBACK TO ABC; -- Silinen Verileri geri getir.
--   SELECT * FROM ogrenciler;

/* =============================================================================
        Seçerek - filtreleyerek silmek için WHERE keyword kullanılir
===============================================================================*/

-- task01-> id'si 102 olan ogrenciyi delete eden query create ediniz...
delete from ogrenciler where id=102;

-- task02 -> Ismi haluk bilgin olan satiri delete eden query create ediniz 
delete from ogrenciler where isim='haluk bilgin';

-- task 03 -> ismi halime bilse veya hasan bilmis olan kayitlari delete eden query create ediniz 

delete from ogrenciler where isim= 'Halime Bilse' or isim='Hasan Bilmis';

-- task 04 -> Ismi Harun Bil ve is si 105 olan recordu delete eden query create ediniz

delete from ogrenciler where isim='Harun Bil' and id=105;

-- task 05-> id si 103 dan buyuk olan kayitlari delete eden query create ediniz
delete from ogrenciler where id>103 ;


-- task 06-> id si 106, 107 veya 104 olan kayitlari delete eden query create ediniz..

delete from ogrenciler where id in(106,107,104);


-- task 07 -> Tablodaki tum kayitlari delete eden query create ediniz..

delete from ogrenciler

