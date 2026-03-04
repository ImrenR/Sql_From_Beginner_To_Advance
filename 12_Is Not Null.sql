/*===================== IS NULL, IS NOT NULL, COALESCE =======================
    IS NULL, ve IS NOT NULL, BOOLEAN operatörleridir. Bir ifadenin NULL olup 
    olmadığını kontrol ederler.  
    COALESCE (birleşmek) ise bir fonksiyondur ve içerisindeki parameterelerden NULL olmayan
    ilk ifadeyi döndürür. Eğer aldığı tüm ifadeler NULL ise NULL döndürürür.
    çoklu değişimde ve  WHERE column1 IS NULL or column2 IS NULL....; 
            gibi ifade yazmamak için. coalesce=birleşmek komut kullanır

    syntax->     sutun_adi = COALESCE(column,value)
    ==============================================================================*/
use JavaCan;
    CREATE TABLE insanlar 
    (
        ssn CHAR(9), -- Social Security Number
        isim VARCHAR(50), 
        adres VARCHAR(50) 
    );

    INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
    INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
    INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
    INSERT INTO insanlar VALUES('', 'Çin Li', 'Fizan');
    INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
    INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
    INSERT INTO insanlar (adres) VALUES('Sakarya');
    INSERT INTO insanlar (ssn) VALUES('999111222');
                
      SELECT * FROM insanlar;
    -- task01-> isim i null olanlari listeleyen query create ediniz...

SELECT 
    *
FROM
    insanlar
WHERE
    isim IS  NULL;
-- task02-> isim null olmayanlari listeleyen query create ediniz...

SELECT 
    *
FROM
    insanlar
WHERE
    isim IS NOT  NULL;

	-- task03-> isim 'i NULL olan kişilerin isim'ine NO NAME atayan query create ediniz.
    
    update insanlar
    set isim='No NAME'
    where isim is null;
    
    select * from insanlar;
    
    
    /* ----------------------------------------------------------------------------
 task04->   isim 'i NULL olanlara 'Henuz isim girilmedi'
           adres 'i NULL olanlara 'Henuz adres girilmedi'
           ssn 'i NULL olanlara ' no ssn' atayiniz..
           çoklu değişimde ve WHERE isim IS NULL or adres is null....;
           gibi ifade yazmamak için. coalesce=birleşmek
-----------------------------------------------------------------------------*/
 update insanlar
    set isim=null
    where isim= 'No Name'; -- task 4 icin tekrar eski haline cevirdik tabloyu
    
    select * from insanlar;
    
    
    update insanlar
    set 
    isim = coalesce(isim, 'Henuz isim girilmedi'),
    adres = coalesce(adres, 'Henuz adres girilmedi'),
    ssn = coalesce(ssn, 'no ssn'); -- coalesce null olanlari birlestirir, null olmayanlari dondururu