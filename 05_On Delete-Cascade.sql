     
/*============================== ON DELETE CASCADE =============================
  Her defasında önce child tablodaki record silmek yerine doğrudan parent record silmek için
 ON DELETE CASCADE (kademeli silme)  komutu kullanılır.
 
  Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutunu yazmak gerekir
 
==============================================================================*/

CREATE TABLE ogrenciler
(
id CHAR(3) primary key,  
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
   
INSERT INTO ogrenciler VALUES(101, 'Haluk Bilgin', 'JavaCan',75);
INSERT INTO ogrenciler VALUES(102, 'Ipek Bilir', 'JavaNaz',85);
INSERT INTO ogrenciler VALUES(103, 'Harun Bil', 'JavaSu',85);
INSERT INTO ogrenciler VALUES(104, 'Hasan Bilmiş', 'JavaTar',95);
INSERT INTO ogrenciler VALUES(105, 'Halime Bilse', 'JavvaNur',99);

select * from ogrenciler;

CREATE TABLE notlar
( ogrenci_id char(3),
ders_adi varchar(30),
yazili_notu int,
);
INSERT INTO notlar VALUES ('101','kimya',75);
INSERT INTO notlar VALUES ('102', 'fizik',65);
INSERT INTO notlar VALUES ('103', 'tarih',90);
INSERT INTO notlar VALUES ('104', 'Matematik',90); 
