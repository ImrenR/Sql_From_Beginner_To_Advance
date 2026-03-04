/*============================= DISTINCT =====================================
    DISTINCT komutu bir SORGU ifadesinde benzer olan record filtrelemek
    için kullanılır. Dolayısıyla seçilen sutun yada sutunlar için benzersiz veri
    içeren record sorgulamayi sağlar.
    SYNTAX
    -------
    SELECT DISTINCT sutun_adi1, sutun_adi2, sutun_adi3
    FROM  tablo_adı;
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
    INSERT INTO javaManav VALUES( 'Irecep', 'Uzum', 4);
    INSERT INTO javaManav VALUES( 'IrmIzan', 'Armut', 2);
    INSERT INTO javaManav VALUES( 'Halime', 'Elma', 3);
    INSERT INTO javaManav VALUES( 'IrmIzan', 'Uzum', 4);
    INSERT INTO javaManav VALUES( 'Irecep', 'Armut', 2);
    INSERT INTO javaManav VALUES( 'Irecep', 'Elma', 3);
    INSERT INTO javaManav VALUES( 'Haluk', 'Uzum', 4);
    INSERT INTO javaManav VALUES( 'MIstaaa', null, 2);
    select * from javaManav;


/* ----------------------------------------------------------------------------
task01-> satılan kaç farklı meyve türu oldugunu listeleyen query create ediniz...
-----------------------------------------------------------------------------*/  

select count(distinct urun_adi) as urun_turu_adedi
from javanamav;
/* -----------------------------------------------------------------------------
    -- task02-> farkli  kisilerin sattiği farklı urunleri  listeleyen query create ediniz...
------------------------------------------------------------------------------*/
select distinct isim, urun_adi
from javamanav
where urun_adi is not null;


-- task02.5 ->   farklı urunleri satan farkli kisileri listeleyen query create ediniz...

      select distinct urun_adi,isim
from javamanav
where urun_adi is not null;
      
      
  /* ----------------------------------------------------------------------------
  task03->  satılan meyvelerin urun_miktarlarinin benzersiz  olanlarının  toplamlarini listeleyen query create ediniz...
-----------------------------------------------------------------------------*/  
          select urun_adi,sum(distinct urun_miktari) as toplam_urun_miktari
from javamanav
group by urun_adi;

      
