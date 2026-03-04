/* ====================== SELECT - REGEXP ================================
   For more complex pattern matching queries, REGEXP_LIKE is used.

   -- 'c' → case-sensitive matching
   -- 'i' → case-insensitive matching (default is usually case-insensitive)

   Syntax:
   REGEXP_LIKE(column_name, 'pattern', 'c' or 'i')
========================================================================== */

USE javaCAN;

CREATE TABLE kelimeler
(
    id INT UNIQUE,
    kelime VARCHAR(50) NOT NULL,
    harf_sayisi INT
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

SELECT * FROM kelimeler;

/* Task 16:
List words containing 'ot' or 'at' (case-sensitive).
*/

SELECT * 
FROM kelimeler 
WHERE REGEXP_LIKE(kelime, 'at|ot', 'c');

/* Task 17:
List words containing 'ot' or 'at' (case-insensitive).
*/

SELECT * 
FROM kelimeler 
WHERE REGEXP_LIKE(kelime, 'at|ot', 'i');

/* Task 18:
List words starting with 'ho' or 'hi' (case-insensitive).
*/

SELECT * 
FROM kelimeler 
WHERE REGEXP_LIKE(kelime, '^ho|^hi', 'i');

/* Task 19:
List words ending with 't' or 'm' (case-insensitive).
*/

SELECT * 
FROM kelimeler 
WHERE REGEXP_LIKE(kelime, 't$|m$', 'i');

/* Task 20:
List 3-letter words starting with 'h' and ending with 't' (lowercase).
*/

SELECT * 
FROM kelimeler 
WHERE REGEXP_LIKE(kelime, '^h.t$', 'c');

SELECT * 
FROM kelimeler 
WHERE REGEXP_LIKE(kelime, '^h[a-z0-9]t$', 'c');

/* Task 21:
List 4-letter words starting with 'h' and ending with 't' (lowercase).
*/

SELECT * 
FROM kelimeler 
WHERE REGEXP_LIKE(kelime, '^h[a-z0-9]{2}t$', 'c');

/* Task 22:
List 3-letter words:
- First letter = h
- Second letter = a or i
- Third letter = t
*/

SELECT * 
FROM kelimeler 
WHERE REGEXP_LIKE(kelime, '^h[ai]t$', 'c');

/* Task 23:
List words containing m or i or e.
*/

SELECT * 
FROM kelimeler 
WHERE REGEXP_LIKE(kelime, '[mie]', 'i');

/* Task 24:
List words starting with a or s.
*/

SELECT * 
FROM kelimeler 
WHERE REGEXP_LIKE(kelime, '^[as]', 'i');

/* Task 25:
List words containing at least two consecutive 'o'.
*/

SELECT * 
FROM kelimeler 
WHERE REGEXP_LIKE(kelime, 'o{2}', 'i');

/* Task 26:
List words containing at least four consecutive 'o'.
*/

SELECT * 
FROM kelimeler 
WHERE REGEXP_LIKE(kelime, 'o{4}', 'i');

/* Task 27:
List 5-letter words:
- First letter = s or b
- Third letter = l
- Case-sensitive.
*/

SELECT * 
FROM kelimeler 
WHERE REGEXP_LIKE(kelime, '^[sb].[l].[a-z]$', 'c');