/* ===================== CONSTRAINTS - KISITLAMALAR  =====================================
           
    NOT NULL		- Bir Sütunun  NULL içermemesini yani boş olmamasını sağlar.
    UNIQUE		- Bir sütundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar.  
    PRIMARY KEY	- Bir sütünün NULL içermemesini ve sütundaki verilerin  BENZERSİZ olmasını sağlar. (NOT NULL ve UNIQUE)
    FOREIGN KEY	- Başka bir tablodaki Primary Key’i referans göstermek için kullanılır.
                  Böylelikle, tablolar arasında ilişki kurulmuş olur.  foreign ve primary ile tablolar birbirine bağlamadan da, id leri ayni olan  satirlarda işlem yap diyebiliriz, böylelikle ayni field verilebilir, parent child ilişkisi olmamiş olur
========================================================================================*/

 use javacan;
 
 CREATE TABLE calisanlar -- parent table
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE,
maas int NOT NULL,
ise_baslama DATE
);

--                              id PK   isim  U.        maas NN  ise_baslama
INSERT INTO calisanlar VALUES('10002', ' Haluk Bilgin' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', null, 5000, '2018-04-14'); -- 2. null deger unique karakteri bozmaz
INSERT INTO calisanlar VALUES('10004', 'Ipek Bilir', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Harun Bil', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Halime Bilse', NULL, '2019-04-12'); -- maas null olamaz
INSERT INTO calisanlar VALUES('10003', 'Merve Bilmiş', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'Merve Bilmiş', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); -- maas record char degil int olmali '' olamaz
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14'); 
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); -- '' dublicate create edemez
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- unique character null kabul etmez

select * from calisanlar;
     
    
    
    
-- KISITLAMALAR (  FOREIGN KEY)
     
CREATE TABLE adresler -- child table
(
adres_id CHAR(5),    
sokak VARCHAR(50),
cadde VARCHAR(30),
sehir VARCHAR(15),
--          name.    FK.      column.             parentTable   PK       column
CONSTRAINT id_clsnlr FOREIGN KEY(adres_id)        REFERENCES calisanlar (id)  -- parent table ile iliski id ile kuruldu foreign key ile

);

INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); 

 
INSERT INTO adresler VALUES('10004','Ebik Sok', '34.Cad.','IST');
INSERT INTO adresler VALUES('10003', 'Gabik Sok', '6.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '35.Cad.','Izmir');
INSERT INTO adresler VALUES('10012','Ağa Sok', '27.Cad.','Antep'); -- Parent table da olmayan anahtar 10012 nin bir karsiligi yok diye tabloda gorulmedi
INSERT INTO adresler VALUES(NULL,'Java Sok', '65.Cad.','Van'); -- Fk ye null record girilebilir
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '46.Cad.','Maraş');

select * from adresler;
select * from calisanlar;

select * from calisanlar,adresler where calisanlar.id=adresler.adres_id ; -- iki tabloyu bu sekilde birlestirilebiliriz
-- babanin actigi cocukta id ile esit olanlari getir ! bu kodu calistiran nedir ? CONSTRAINT id_clsnlr FOREIGN KEY(adres_id)        REFERENCES calisanlar (id)  -- buradaki satirdir 

drop table calisanlar; -- silinemez!! - kisitlamasi var der-- babayi silinemezsin cunku cocukla iliskili cocugu havada birakamazsin
/*
CONSTRAINT id_clsnlr FOREIGN KEY(adres_id)        REFERENCES calisanlar (id) 
child table silinmeden parent table silinemez- Interview sorusu
*/


drop table adresler; -- bunu dogrudan silebilirsin bu child tabledir
/*
simdi yukari gidip calisanlari yani parent table i silebilirsin
*/





