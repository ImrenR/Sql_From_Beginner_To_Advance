/* ====================== SELECT -  ================================
    Daha karmaşık pattern->kalip ile query için REGEXP_LIKE komut kullanilir..  
     -- 'c' => case-sentisitive demektir
     -- 'i' => incase-sentisitive demektir ve default olarak incase-sensitive aktiftir..
    Syntax ->     REGEXP_LIKE(sutun_adı, 'pattern[] ', 'c' ] )
========================================================================== */

use javaCAN;

CREATE TABLE kelimeler
(
id int UNIQUE,
kelime VARCHAR(50) NOT NULL,
harf_sayisi int
);
   
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);

	-- INSERT INTO kelimeler VALUES (1015, 'ebik gabik', 5);-- Error Code: 1062. Duplicate entry '1015' for key 'kelimeler.id'	
   
select * from kelimeler;
   
-- Task -> 16: İçerisinde 'ot' veya 'at' bulunan kelimeleri küçük harfe dikkat ederek listeleyen query create ediniz.
 select * from kelimeler where regexp_like(kelime, 'at|ot','c');-- VEYA için | da kullanilabilir c-> case:byk-kck harf duyarli
 
 -- Task -> 17  İçerisinde 'ot' veya 'at' bulunan kelimeleri büyük-küçük harf duyarsiz  listeleyen query create ediniz.

 select * from kelimeler where regexp_like(kelime, 'at|ot');-- VEYA için | da kullanilabilir c-> case:byk-kck harf duyarli
 select * from kelimeler where regexp_like(kelime, 'at|ot','i');-- VEYA için | da kullanilabilir i-> case:byk-kck harf duyarsiz

-- Task -> 18  'ho' veya 'hi' ile başlayan kelimeleri büyük-küçük harfe dikkat etmeksizin listeleyen query create ediniz.
 select * from kelimeler where regexp_like(kelime, '^ho|^hi');--  Baslangiç character için ^ kullanilir
 
 -- Task -> 19  Sonu 't' veya 'm' ile bitenleri büyük-küçük harfe dikkat etmeksizin listeleyen query create ediniz.

 select * from kelimeler where regexp_like(kelime, 't$|m$');--  Bitiş character için $ kullanilir
 
 -- Task -> 20  h ile başlayıp t ile biten 3 harfli kelimeleri (h ile t küçük harfli olanlari)  listeleyen query create ediniz.

 -- select * from kelimeler where kelime like ('h_t');--  like-> byk-kck duyar almaz
 select * from kelimeler where regexp_like(kelime, '^h_t$');--  Bitiş character için $ kullanilir
 select * from kelimeler where regexp_like(kelime, 'h[a-z:A-Z:0-9]t','c');-- [olabilicek character type]
 select * from kelimeler where regexp_like(kelime, 'h[a-z,A-Z]t','c');-- h9t gelmez
 
-- Task -> 21  h ile başlayıp t ile biten 4 harfli kelimeleri (h ile t küçük harfli olanlari) listeleyen query create ediniz.
 select * from kelimeler where regexp_like(kelime, 'h[a-z:A-Z:0-9][a-z:A-Z:0-9]t','c');-- [olabilicek character type]

-- Task -> 22  İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini listeleyen query create ediniz.

 select * from kelimeler where regexp_like(kelime, 'h[a|i]t');-- [olabilicek character type]
 select * from kelimeler where regexp_like(kelime, 'h[a_i]t');-- [olabilicek character type]

-- Task -> 23  İçinde m veya i veya e olan kelimelerin tüm bilgilerini listeleyen query create ediniz.

 select * from kelimeler where regexp_like(kelime, 'i|m|e');-- [olabilicek character type]
 select * from kelimeler where regexp_like(kelime, '[ime]');-- [] içinde birden çok character girilirse VEYA mantiği. ile filtreleme yapar


-- Task -> 24  a veya s ile başlayan kelimelerin tüm bilgilerini listeleyen query create ediniz.
 select * from kelimeler where regexp_like(kelime, '^[as]');-- [] içinde birden çok character girilirse VEYA mantiği. ile filtreleme yapar


-- Task -> 25  içerisinde en az 2 adet OO barıdıran kelimelerin tüm bilgilerini listeleyen query create ediniz.
 select * from kelimeler where regexp_like(kelime, '[o][o]');-- [] içinde birden çok character girilirse VEYA mantiği. ile filtreleme yapar
 select * from kelimeler where regexp_like(kelime, '[o]{2}');-- [istenen character]{istenen character adedi}  


-- Task -> 26  içerisinde en az 4 adet oooo barındıran kelimelerin tüm bilgilerini listeleyen query create ediniz.
 select * from kelimeler where regexp_like(kelime, '[o][o][o][o]');-- [] içinde birden çok character girilirse VEYA mantiği. ile filtreleme yapar
 select * from kelimeler where regexp_like(kelime, '[o]{4}');-- [istenen character]{istenen character adedi}  


-- Task -> 27  ilk harfi s veya b , 3. harfi l olan ve 5 harfli olan kelimelerin küçük harfe dikkat ederek listeleyen query create ediniz.
 select * from kelimeler where regexp_like(kelime, '^[s|b][a-z]l[a-z][a-z]','c');-- [] içinde birden çok character girilirse VEYA mantiği. ile filtreleme yapar



