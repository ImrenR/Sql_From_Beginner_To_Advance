 
 /******************************************************
              SELECT - WHERE FILTRELEME
 ******************************************************/
 
use JavaCAN;
create table ogrenciler(
id int, isim varchar(45),
adres varchar(100),
sinav_notu int
);

insert into ogrenciler values(101,'Celine','Ankara',99);
insert into ogrenciler values(102,'Murat','BUrsa',88);
insert into ogrenciler values(103,'NUr','Istanbul',77);
insert into ogrenciler values(104,'Abdi','KÖtaya',43);
insert into ogrenciler values(105,'Mustafa','Gayseri',38);
insert into ogrenciler values(107,'Haluk','Denizli',10);
insert into ogrenciler values(107,'Aydin','MARAŞ',61);
select * from ogrenciler;

/*
Verileri SELECT komutu ile veritabanından çekerken filtreleme yapmak için
SELECT ile birlikte WHERE komutu kullanılır.
Syntax -> SELECT sutun1, sutun2 ....FROM tablo adı WHERE koşul ;
*/

-- Task01 -> Sınav notu 80'den büyük olan öğrencilerin bilgileri (hepsi * ile secilir)
-- listeleyen(SELECT - READ e karsilik gelir KULLAN) query create ediniz.

select * from OGrenciler where sinav_notu>80; -- Celine Murat execute edildi

--  Task02 -> Adresi(SART SUTUNU) Ankara olan öğrencilerin isim ve adres bilgilerini listeleyen query create ediniz.

select * from OGrenciler where adres='ankara'; -- celiene

-- Task03 -> id'si 104 olan öğrencilerin tüm bilgilerini listeleyen query create ediniz.

select * from Ogrenciler where id=104; -- abdi

/*********************************
             SELECT - BETWEEN
**********************************/
create table personel
(
id char(4),
isim varchar(50),
maas int
);


insert into personel values('1001', 'Haluk Bilgin', 70000);
insert into personel values('1002', 'Java Han', 85000);
insert into personel values('1003', 'Java Han', 65000);
insert into personel values('1004', 'Java Tar', 95000);
insert into personel values('1005', 'Javva Nur', 80000);
insert into personel values('1006', 'Java Naz', 100000);
insert into personel values('1006', 'Java Su', 333000);
insert into personel values('1006', 'Java Can', 222000);
 select * from personel;

-- BETWEEN 2 mantıksal ifade ile  belirtilen   veriler arasındaki dataları  listeler
-- ahan da TRICK -> BETWEEN de; belirttigini sınır degerleri de, listelemeye dahildir.

 
/*********************************
             AND - OR
**********************************/
/*
AND (ve): Belirtilen şartların her ikiside gerçekleşiyorsa o kayıt listelenir.
En az bir tanesi gerçekleşmez ise listelemez.kaynana gibi kötümser
 
SELECT * FROM matematik sinav1 > 50 AND sinav2 > 50
Hem sinav1 hemde sinav2 alanı, 50'de büyük olan kayıtları listeler.
 
OR (veya): Belirtilen şartlardan en az biri gerçekleşirse, kayıt listelenir. ANA gibi iyimser
 
SELECT * FROM matematik wehee sinav1 > 50 OR sinav2 > 50
Hem sinav1 veya sinav2 alanı, 50'de büyük olan kayıtları listeler.
*/


-- Task04 -> id'si 1002 ile 1005 arasında olan personel bilgilerini listeleyen query create ediniz.
select * from personel where id between '1002' and '1005';

-- Task05 -> Java Tar ile Java Nur arasındaki personel bilgilerini listeleyen query create ediniz..

select * from personel where isim between 'Java Tar' and 'Java Nur'; -- naturel order

-- Task06 -> Maaşı 70000 veya ismi Java Naz olan personeli listeleyen query create ediniz.

select * from personel where maas=70000 or isim='Java Naz';

/*********************************
                      IN
**********************************/
/*
IN: Birden fazla mantıksal ifade ile tanımlabilen durumları tek komutla
sorgu yazabilme imkanı verir.
 
 
Syntax->  SELECT sutun1, sutun2 ....
 FROM tablo_adı
 WHERE sutun_adı IN (deger1, deger2)
*/


-- Task07 -> id'si 1001,1002 ve 1004 olan prsonel bilgilerini listeleyen query create ediniz.

select * from personel where id IN('1001','1002','1004');
-- Task08 -> Maaşı sadece 70000 veya 100000 olan personeli listeleyen query create ediniz.

 select * from personel where maas IN(100000,70000);

-- Task08.5 -> Maaşı sadece 70000 veya ismi javva Nur olan personeli listeleyen query create ediniz. -> in ?

 select * from personel where maas=70000 or isim='Javva Nur';
-- farkli column -field icin where filtrelemede in yerine or kullanilir.



/*********************************
              SELECT - LIKE
**********************************/ 

/*
SELECT - LIKE
LIKE: Sorgulama yaparken belirli patternleri kullanabilmesini  sağlar

Syntax –> SELECT sutun1, sutun2, ...FROM tablo_adı WHERE sutunName LIKE pattern

PATTERN İÇİN
% -> 0 veya daha fazla karakteri belirtir.
_ -> Tek bir karakteri belirtir.  _ : karakter sayısı kadar kullanılır.
*/

-- Task09 -> İsmi J harfi ile başlayan personeli listeleyen query create ediniz.

select * from personel where isim like 'j%'; -- isim sutunundaki ilk karakter j olup sonrasinda sarti olmayan record filtreleme

-- Task09.5 -> İsmi J harfi ile başlayan 8 harfli personeli listeleyen query create ediniz.

select * from personel where isim like 'j_______'; -- isim sutunundaki ilk karakter j olup sonrasi 7 character record filtreleme

-- Task10 -> İsmi N harfi ile biten personeli listeleyen query create ediniz.

select * from personel where isim like '%N';
-- Task11 -> İsmi 3. harfi l olan personeli listeleyen query create ediniz.

select * from personel where isim like '__L%';

-- Task12 -> İsminin 2. harfi a olup diğer harflerinde c olan personel listeleyen query create ediniz.

select * from personel where isim like '_a%c%'; --  java can

-- Task13 -> İsminde A harfi olmayan personeli listeleyen query create ediniz.

select * from personel where isim not like '%a%';

-- Task14 -> Maaşı 6 haneli olan personeli listeleyen query create ediniz.

select * from personel where maas like '______';

-- Task15-> isim 1. harfi j ve 7. harfi A olan personeli listeleyen query create ediniz.

select * from personel where isim like 'j_____a%';
