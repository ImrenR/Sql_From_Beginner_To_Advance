create database if not exists imren; -- database manuel create etme => Dublicatei onlemek icin
create database lolo; -- database create etme
use JavaCan; -- Kullanmak istedigin database
use imren; -- mevcut db den baska bir db ye gecis yapmak
create table students( --  Tablo olusturduk
id varchar(4),
name varchar(50),
grade int,
age int
); -- column-sutunlar olusturuldu, data type girisi yapildi

/*********************************************************
            VERI (DATA-RECORD) GIRISI
**********************************************************/

insert into students values(null,'imren', -- students tablosuna veri girisi yapildi
99,33);
insert into students values('1001','tulin', -- students tablosuna veri girisi yapildi
94,32);
insert into students values('1002','erdem',99,23);
insert into students values('1003','ali', 89,23);
insert into students values('1002','memo',43);

/**********************************************************
			TABLODAN (DATA-RECORD) SORGULAMA
 **********************************************************/

select * from students; -- students table daki tum record execute edildi.  -- defalarca tiklanirsa dublicate yapar

/**********************************************************
			PARCALI (DATA-RECORD) GIRIS 
 **********************************************************/
 insert into students(id,ages)values('90',50);

/**********************************************************
			DB den TABLO SILME 
 **********************************************************/
drop table students; -- db den students tablosunu siler