/*============================= GROUP BY =====================================
    GROUP BY komutu bir SELECT ifadesinde satırları, sutunların değerlerine 
    göre özet olarak gruplamak için kullanılır. 
   
    GROUP BY komutu her grup başına bir satır return eder. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonları ile birlikte kullanılır.
==============================================================================*/ 
      use JavaCan;
    CREATE TABLE javaManav 
    (
        isim varchar(50), 
        urun_adi varchar(50), 
        urun_miktari int 
    );
	
      INSERT INTO javaManav VALUES( 'IrmIzan', 'Elma', 5);
    INSERT INTO javaManav VALUES( 'Ipek', 'Armut', 3);
    INSERT INTO javaManav VALUES( 'Haluk', 'Elma', 2);
    INSERT INTO javaManav VALUES( 'Haluk', 'Elma', 7);
    INSERT INTO javaManav VALUES( 'Haluk', 'Elma', 13);
    INSERT INTO javaManav VALUES( 'Irecep', 'Uzum', 4);
    INSERT INTO javaManav VALUES( 'Irecep', 'Uzum', 5);
    INSERT INTO javaManav VALUES( 'Irecep', 'Uzum', 23);
    INSERT INTO javaManav VALUES( 'IrmIzan', 'Armut', 2);
    INSERT INTO javaManav VALUES( 'Halime', 'Elma', 3);
    INSERT INTO javaManav VALUES( 'IrmIzan', 'Uzum', 4);
    INSERT INTO javaManav VALUES( 'Irecep', 'Armut', 2);
    INSERT INTO javaManav VALUES( 'Irecep', 'Elma', 3);
    INSERT INTO javaManav VALUES( 'Haluk', 'Uzum', 4);
    INSERT INTO javaManav VALUES( 'MIstaaa', null, 2);

    SELECT * FROM javaManav;
/* -----------------------------------------------------------------------------
  task01-> kisi ismine göre satılan toplam meyve miktarlarını listeleyen query create ediniz...
  yazınız.
------------------------------------------------------------------------------*/  

select isim, sum(urun_miktari) as toplam_urun 
from JavaManav
group by isim;

/* ----------------------------------------------------------------------------
  task02-> satılan meyve türüne (urun_adi) göre urun alan kişi sayısını 
  listeleyen query create ediniz... NULL olarak girilen meyveyi listelemesin.
-----------------------------------------------------------------------------*/ 
select urun_adi, count(isim) as toplam_kisi
from JavaManav
where urun_adi is not null
group by urun_adi;


/* ----------------------------------------------------------------------------
  task03-> satılan meyve türüne (urun_adi) için satılan (urun_miktari )MIN ve 
  MAX urun miktarlarini,urun_adi na göre sıralayarak  listeleyen query create ediniz...
-----------------------------------------------------------------------------*/ 

select urun_adi, min(urun_miktari) as min_urunler_miktari,
max(urun_miktari) as max_urun_miktari
from JavaManav
group by urun_adi;


/* ----------------------------------------------------------------------------
  task04->  kisi ismine ve urun adına göre satılan ürünlerin toplamını 
  gruplandıran ve isime göre ters sırasıda listeyen  listeleyen query create ediniz...
 -----------------------------------------------------------------------------*/ 
 select urun_adi, isim,
sum(urun_miktari) as sum_urun
from JavaManav
group by isim, urun_adi
order by isim desc; -- siralama deyince order by kullaniriz

/* ----------------------------------------------------------------------------
 task05-> kisi ismine ve urun adına göre (gruplayarak) satılan ürünlerin toplamını bulan ve
  ve bu toplam değeri 3 ve fazlası olan kayıtları toplam urun miktarlarina göre
  ters siralayarak  listeleyen query create ediniz...
 -----------------------------------------------------------------------------*/  
  
  select isim, urun_adi,
sum(urun_miktari) as sum_urun
from JavaManav
group by isim, urun_adi
having sum_urun>3
order by urun_miktari desc;
-- siralama
-- Group By
-- Having = gruptaki sart
-- Order by
 
 

/*
SQL HAVING Nedir? Kullanımı Nasıldır? Örneklerle Anlatım
WHERE komutu gruplama fonksiyonları ile kullanılmadığından aynı görevi yapan 
HAVING komutu GRUOP BY ile kullanılması için getirilmiştir. 
Sadece GROUP BY komutu ile kullanılır.
SELECT sütun_adi
FROM tablo_adi
WHERE koşul
GROUP BY sütun_adi
HAVING koşul
ORDER BY sütun_adi;
*/
 -- aggregate fonksiyonlari ile ilgili bir koşul koymak için
 -- GROUP BY dan sonra HAVING komutu kullanilir.


/* ----------------------------------------------------------------------------
  task06->  satılan urun_adi'na göre (gruplayarak) MAX urun sayılarını sıralayarak listeleyen 
   listeleyen query create ediniz.... NOT: Sorgu, sadece MAKS urun_miktari MIN urun_miktarına 
  eşit olmayan kayıtları listelemelidir.
 -----------------------------------------------------------------------------*/    

select urun_adi,min(urun_miktari) as min_miktar,
max(urun_miktari) as max_miktar
from javamanav
group by urun_adi
having not min_miktar=max_miktar
order by urun_adi;
