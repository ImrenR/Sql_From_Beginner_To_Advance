/*=============================== ALTER TABLE =========================================
ALTER TABLE is used to:

- Add columns
- Modify column definitions
- Drop columns
- Rename tables or columns
- Add constraints such as CHECK
===================================================================================*/

USE JavaCan;

/* ---------------- Table Creation ---------------- */

CREATE TABLE personel
(
    id INT PRIMARY KEY,
    isim VARCHAR(50),
    sehir VARCHAR(50),
    maas INT,
    sirket VARCHAR(20)
);

/* ---------------- Data Insertions ---------------- */

INSERT INTO personel VALUES(123456789, 'Haluk Bilgin', 'Istanbul', 50000, 'IBM');
INSERT INTO personel VALUES(234567890, 'Ipek Bilir', 'Istanbul', 25000, 'Google');
INSERT INTO personel VALUES(345678901, 'Harun Bilmiş', 'Ankara', 13000, 'IBM');
INSERT INTO personel VALUES(456789012, 'Harun Bilmiş', 'Izmir', 10000, 'Microsoft');
INSERT INTO personel VALUES(567890123, 'Harun Bilmiş', 'Ankara', 17000, 'Amazon');
INSERT INTO personel VALUES(456789013, 'Ipek Bilir', 'Ankara', 15000, 'Microsoft');
INSERT INTO personel VALUES(123456710, 'Halime Bak', 'Bursa', 25000, 'IBM');

SELECT * FROM personel;

/* ---------------- TASKS ---------------- */

/* Task01:
Add column ulke_isim with default value 'Turkiye'.
*/

ALTER TABLE personel
ADD ulke_isim VARCHAR(50) DEFAULT 'Turkiye';

/* Task02:
Add gender and yas columns.
*/

ALTER TABLE personel
ADD gender VARCHAR(20),
ADD yas INT;

/* Task02.5:
Add age column after isim column.
(MySQL supports AFTER keyword.)
*/

ALTER TABLE personel
ADD age INT AFTER isim;

/* Task02.75:
Add football_team column after isim with default value.
*/

ALTER TABLE personel
ADD football_team VARCHAR(20) DEFAULT 'takim' AFTER isim;

/* Task03:
Drop sirket column.
*/

ALTER TABLE personel
DROP COLUMN sirket;

/* Task04:
Rename column ulke_isim → ulke_adi.
*/

ALTER TABLE personel
RENAME COLUMN ulke_isim TO ulke_adi;

/* Task05:
Rename table personel → sefil_ameleler.
*/

ALTER TABLE personel
RENAME TO sefil_ameleler;

/* After table rename, use new table name */

/* Task06:
Add NOT NULL constraint to ulke_adi and change datatype to VARCHAR(30).
*/

ALTER TABLE sefil_ameleler
MODIFY ulke_adi VARCHAR(30) NOT NULL;

/* Task07:
Add CHECK constraint maas >= 9000.
*/

ALTER TABLE sefil_ameleler
ADD CONSTRAINT chk_maas CHECK (maas >= 9000);

SELECT * FROM sefil_ameleler;