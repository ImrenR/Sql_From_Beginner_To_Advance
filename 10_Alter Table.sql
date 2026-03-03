/*=============================== ALTER TABLE =========================================
	   
	   ALTER TABLE tabloda ADD, CHANGE, MODIFY, veya DROP/DELETE COLUMNS gibi islemleri icin kullanılır.
	   ALTER TABLE ifadesi tablolari yeniden isimlendirmek (RENAME) icin de kullanılır.
	          constraint check -> Bir sütuna yerleştirilebilecek değer aralığını sınırlamak için kullanılır .
	===================================================================================*/

use JavaCan;
CREATE TABLE personel
(
           id int PRIMARY KEY,
           isim VARCHAR(50),
           sehir VARCHAR(50),
           maas int,
           sirket VARCHAR(20)
);
 
 
INSERT INTO personel VALUES(123456789, 'Haluk Bilgin', 'Istanbul', 50000, 'IBM');
INSERT INTO personel VALUES(234567890, 'Ipek Bilir', 'Istanbul', 25000, 'Google');
INSERT INTO personel VALUES(345678901, 'Harun Bilmiş', 'Ankara', 13000, 'IBM');
INSERT INTO personel VALUES(456789012, 'Harun Bilmiş', 'Izmir', 10000, 'Microsoft');
INSERT INTO personel VALUES(567890123, 'Harun Bilmiş', 'Ankara', 17000, 'Amazon');
INSERT INTO personel VALUES(456789013, 'Ipek Bilir', 'Ankara', 15000, 'Microsoft');
INSERT INTO personel VALUES(123456710, 'Halime Bak', 'Bursa', 25000, 'IBM');
 
 
   
select * from personel;

-- task01-> personel tablosuna ulke_isim adinda ve default degeri 'Turkiye' olan yeni bir sutun ekleyiniz.

alter table personel
add ulke_isim varchar(50) default 'Turkiye';

-- task02-> personel tablosuna cinsiyet Varchar(20) ve yas int data type yeni sutunlar ekleyiniz.

alter table personel
add (gender varchar(20), yas int) ;

-- task02.5-> personel tablosuna yas int data type yeni sutunu isim’den sonraya ekleyiniz.

alter table personel
add age int after isim ;

-- task02.75-> personel tablosuna fotball_team   data type Varchar(20) default 'mehter takimi' sutununu isimden sonraya  ekleyiniz

alter table personel
add football_team varchar(20) default 'takim' after isim ;


-- task03-> personel tablosundan sirket sutununu siliniz.
alter table personel
drop column sirket;

-- task04-> personel tablosundaki ulke_isim sutununun adini ulke_adi olarak degistiriniz.

alter table personel
rename column ulke_isim to ulke_adi;

select * from personel;
-- task05-> personel tablosunun adini sefil_ameleler olarak degistiriniz.
alter table personel
rename to sefil_ameleler;

select * from personel;

-- task06-> sefil_ameleler tablosundaki ulke_adi sutununa NOT NULL kisitlamasi ekleyiniz ve veri tipini VARCHAR(30) olarak değiştiriniz. 

alter table sefil_ameleler
modify ulke_adi varchar(30) not null;

select * from sefil_ameleler;

-- task07-> sefil_ameleler tablosuna  maas in 10000 den buyuk veya esit  olma kisitlamasi getiriniz.

alter table sefil_ameleler
add constraint check(maas>9000);

select * from sefil_ameleler;



