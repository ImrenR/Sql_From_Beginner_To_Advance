use javacan;
create table personel (
musteri_no int,
ad VARCHAR(22),

soyad VARCHAR(25),
sehir varchar(45),
cinsiyet varchar(15),
puan int
);
INSERT INTO personel VALUES(111,'Haluk', 'Bilgin','Istanbul','erkek',63);
INSERT INTO personel VALUES(222,'Ipek', 'bilir','Istanbul','kadin',99);
INSERT INTO personel VALUES(333,'Harun','Bilmiş','Izmir','erkek',43);
INSERT INTO personel VALUES(444, 'Çin','Li','Fizan','erkek',11);
INSERT INTO personel VALUES(555, 'Tatarrr','IrmIzan','Alcadraz','erkek',41);

select * from personel;

-- ****************************************  concat ********************************************************

 -- SYNTAX-> concat('character', column,...);
--  column record'larini girilen value ile birleştirip yeni bir column'da return eder... 

-- task01-> ad ve soyadi record'larini 'Adiniz Soyadiniz : Haluk Bilgin ' şeklinde listeleyen query create ediniz...
 select concat('Adiniz Soyadiniz : ', ad,' ',soyad) as ad_soyad from personel;
 
 
-- ***************************************  length ********************************************************

-- SYNTAX-> length(column,);
-- column daki record'larin karakter sayisini(uzunluk) yeni bir column'da return eder.

-- task02-> ad ve soyad record'larinin  karakter sayisini listeleyen query create ediniz...
select ad, length(ad) as ad_uzunluk, soyad, length(soyad) as soyad_uzunluk from personel;
 
 
-- ****************************************  left-right ********************************************************

-- SYNTAX-> left-right(column,karakter_sayisi);
-- column daki record'larin sol-sağ Dan girilen karakter sayisine göre parcasini yeni bir column'da return eder.

-- task03-> ad ve soyad record'larinin  ilk karakterini  listeleyen query create ediniz...

select ad, left(ad,1) as ad_ilkharf, soyad, left(soyad,1) as soyad_ilkharf from personel;


-- task03.5-> ad ve soyad record'larinin  son karakterini  listeleyen query create ediniz...
select ad,right(ad,1) as ad_ilkharf, soyad, right(soyad,1) as soyad_ilkharf from personel;


-- task04-> ad ve soyad record'larinin  ilk harflerini A.B şeklinde   listeleyen query create ediniz...

select ad,soyad, concat(left(ad,1),'.',left(soyad,1)) as bas_harf from personel;

-- task05-> ad ve soyad 4 den buyuk harfli record'larinin 1.3 ve 5. harflerini(MORIS -> MRS) listeleyen query create ediniz...


select ad,soyad, concat(left(ad,1),'.',left(soyad,1)) as bas_harf from personel;



-- ****************************************  substring ********************************************************

-- SYNTAX-> substr(column,a);-> column record unun  a. characterden (dahil)itibaren tüm characterleri return eder
-- column daki record'larin girilen değere göre bir paracasini yeni bir column'da return eder.

-- task06-> ad  ilk 2 harfi hariç tum karakterleri listeleyen query create ediniz...

 



 
-- task07-> ad  ilk 2 harfinden sonraki 2 karakteri listeleyen query create ediniz...
 

 

-- ****************************************** replace  ******************************************************

-- SYNTAX-> replaca(column,old_value,new_value);
-- column daki record'larin old_value,new_value olarak atayarak yeni bir column'da return eder.


-- task08-> ad   record'larinin e harfini * ile ve soyad record'larinin i harfini * ile değiştirip listeleyen query create ediniz...
 

-- task09-> ad ve soyad  record'larinin son ilk harfi hariç kalan harfleri *** ile değiştirip listeleyen query create ediniz...







-- ******************************************  repeat  *************************************************************************

-- SYNTAX-> repeat('yeni character',character_sayısi)
-- column daki record'lari girilen yeni karakteri istenen sayi kadar  yeni bir column'da return eder.
 
-- task10-> ad ve soyad  record'larinin ilk harfleri hariç tum harflerini * ile değiştirip listeleyen query create ediniz...
 
   
 
 -- *******************************  lower upper  *****************************************************

-- SYNTAX-> lower/upper(column);
-- column daki record'lari BUYUK-KUCUK harf ile yeni bir column'da return eder.




