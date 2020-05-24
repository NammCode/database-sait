-- configuration file 
set echo on 
set linesize 132
set pagesize 66

-- slide 7
SELECT title, retail 
FROM books 
WHERE retail BETWEEN 20 AND 30;

-- slide 8, 9 
-- IN returns records that match a value in a specified list
-- List must be in parentheses
SELECT title, category 
FROM books 
WHERE category IN ('CHILDREN', 'FAMILY LIFE', 'COOKING')
ORDER BY category, title;

-- slide 10, 11
-- LIKE performs pattern searches
-- _ for exactly one character ('P____' same with 'P%')
-- % represents any number of characters
SELECT firstname, lastname 
FROM customers 
WHERE lastname LIKE 'P%' 
ORDER BY lastname ASC;

-- slide 12
-- sample: 21-JAN-05
-- result: '%JA%' same with '___JA%'
SELECT title, pubdate 
FROM books 
WHERE pubdate 
LIKE '%JA%';

-- show customer number begin with 10 followed by any character and ends with 9
SELECT customer#, lastname 
FROM customers
WHERE customer# 
LIKE '10%9';

-- slide 14
SELECT title 
FROM books 
WHERE category='COMPUTER' AND pubid = 2 
ORDER BY title;












