/*============================= SUBQUERIES ====================================
 SORGU içinde çalişan SORGUYA SUBQUERY (ALT SORGU) denilir.
================================================================================*/

use JavaCan;
CREATE TABLE calisanlar 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);

INSERT INTO calisanlar VALUES(123456789, 'Haluk Bilgin', 'Istanbul', 50000, 'IBM');
INSERT INTO calisanlar VALUES(234567890, 'Ipek Bilir', 'Istanbul', 25000, 'Google');
INSERT INTO calisanlar VALUES(345678901, 'Harun Bilmiş', 'Ankara', 13000, 'IBM');
INSERT INTO calisanlar VALUES(456789012, 'Harun Bilmiş', 'Izmir', 10000, 'Microsoft');
INSERT INTO calisanlar VALUES(567890123, 'Harun Bilmiş', 'Ankara', 17000, 'Amazon');
INSERT INTO calisanlar VALUES(456789012, 'Ipek Bilir', 'Ankara', 15000, 'Microsoft');
INSERT INTO calisanlar VALUES(123456710, 'Halime Bak', 'Bursa', 25000, 'IBM');
    
CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);
    
INSERT INTO markalar VALUES(100, 'IBM', 12000);
INSERT INTO markalar VALUES(101, 'Microsoft', 18000);
INSERT INTO markalar VALUES(102, 'Amazon', 10000);
INSERT INTO markalar VALUES(103, 'Google', 21000);
    
SELECT * from calisanlar;
SELECT * from markalar;
    

-- task01-> calisan sayisi 15.000’den cok olan  markada calisanlarin 
-- isimlerini isyeri ve maaşlarini listeleyen query create ediniz...

select isim,isyeri,maas from calisanlar
where isyeri in(select marka_isim from markalar where calisan_sayisi > 15000);



-- task02-> marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyen query create ediniz...

select isim,sehir,maas from calisanlar
where isyeri in(select marka_isim from markalar where marka_id > 101);

-- task03-> Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyen query create ediniz...

select marka_id,calisan_sayisi from markalar
where marka_isim in(select isyeri from calisanlar where sehir= 'Ankara');

-- task04-> Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyen query create ediniz...



-- task05-> Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin ortalama maaşini listeleyen query create ediniz...



-- task06-> Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen query create ediniz...



-- task07-> Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen query create ediniz...