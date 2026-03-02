create database if not exists JavaCan; -- Db ilk kez create edilirken dublicate onune gecmek icin if not exist kullanilir
create database JavaCan; -- yeni bir haluk database create edildi
use JavaCan; -- mevcut db den haluk db ye gecis yapildi.
use imren;

-- single comment --> tek satir yorum

/* multpy line comment 
 */
 
 
 create table students(
 id varchar(4),
 name varchar(50),
 grade int,
 age int
 ); -- column sutun field basliklariin data type girisi yapildi.
 
 /******************************************************
              VERI (DATA-RECORD) GIRIS
 ******************************************************/
insert into students values('1001','haluk',77,23);
insert into students values('1002','tulin',88,15);
insert into students values('1003','erdem',95,11);
insert into students values('1002','mehmet',63,21);


 /******************************************************
             TABLODAN (DATA-RECORD) SORGULAMA
 ******************************************************/
 
 select * from students; -- student tabledaki tum record execute edildi.
 
  /******************************************************
            PARCALI (DATA-RECORD) GIRISI
 ******************************************************/
 
 insert into students(id,age)values('99',50);
  select * from students; -- student tabledaki tum record execute edildi.

   /******************************************************
            DB den TABLE SILME
 ******************************************************/
 
 drop table students; -- db den students table silinir
 
 
 
 
 