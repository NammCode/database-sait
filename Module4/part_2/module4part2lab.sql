/*
Nam Khanh Nguyen
ID :- 000836881
*/

set echo on;
set linesize 132;
set pagesize 66;

spool c:/cprg250/module4/module4part2spool.txt;

-- Question 1
SELECT firstname , lastname 
FROM customers 
WHERE state ='CA' 
ORDER BY lastname , firstname ASC;

-- Question 2
SELECT title , category 
FROM books 
WHERE(retail-cost) < 15) 
ORDER BY category , title;

-- Question 3
SELECT title 
FROM books 
WHERE (discount > 3 AND category = 'COMPUTER');

-- Question 4
SELECT firstname, lastname, region 
FROM customers 
WHERE (region != 'N' AND region != 'NE' AND region != 'NW' ) 
ORDER BY lastname DESC, firstname ASC;

-- Question 5
SELECT firstname , lastname , region 
FROM customers 
WHERE region NOT IN ('N','NW','NE') 
ORDER BY lastname DESC , firstname ASC;

spool off;
