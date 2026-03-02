/* ======================== DELETE - TRUNCATE - DROP ============================   
   1-) TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamamını siler.
       Ancak, seçmeli silme yapilamaz. TRUNCATE TABLE where ...... OLMAZ
    
   2-) DELETE komutu beraberinde WHERE keyword kullanılabilir ama TRUNCATE ile kullanılmaz.
       Delete komutu ile silinen veriler ROLLBACK Komutu ile kolaylıkla geri getirilebilir.
  
   3-) TRUNCATE komutu tablo yapısını değiştirmeden, tablo içinde yer alan tüm verileri tek komutla silmenizi sağlar.
       TRUNCATE ile silinen veriler geri alınması daha zordur. Ancak Transaction yöntemi ile geri alınması mümkün olabilir.
    
   4-) DROP komutu da bir DDL komutudur. Ancak DROP veriler ile tabloyu da siler ROLLBACK çalişmaz. 
===================================================================================*/
use JavaCan;
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
START TRANSACTION;
savepoint geri_getir; -- tablodaki record u geri_getir kayit noktasina yedeklendi her insertten sonra record savepoint yedeklenmeli
INSERT INTO ogrenciler VALUES(108, 'Imren Bak', 'JavaLar',100);
INSERT INTO ogrenciler VALUES(109, 'Erdem Bee', 'JavaHan',101);
-- savepoint comutuyla tablodaki yanlislikla silinmeyle karsi korumaya alinir.
-- savepoiny sorunu icin sql editor -> sql execution-> auto committeki tiki kaldir..
-- ve bi tik tikliysa delete islemide olmaz 1046 hatasi verir
delete from ogrenciler;
rollback to geri_getir;

drop table ogrenciler; -- butun tabloyu siler rollback le geri getiremezsin delete ile arasindaki fark budur
truncate table ogrenciler; --  tikladik, save point dedik, ogrencileri select ettik truncate calismadi liste hala bos
