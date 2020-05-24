/* Name: Nam Khanh Nguyen
*  Student ID: 000836881
*  Subject: CPRG 250
*  Lab: Module 4 Part 3
*/

-- Task 1
set echo on 
set linesize 132
set pagesize 66
--spool c:\cprg250\Module4\part_3\labSpool.txt
spool C:\Coding\Database\Module4\Part3\spool.txt

-- Task 2a
SELECT firstname, lastname, o.order#, oi.item#, title, gift 
FROM customers c, orders o, orderitems oi, books b, promotion p 
WHERE c.customer# = o.customer# 
AND o.order# = oi.order# 
AND oi.isbn = b.isbn 
AND b.retail between p.minretail AND p.maxretail 
ORDER BY 2, 1, 3, 4;

-- Taks 2b
SELECT firstname, lastname, o.order#, oi.item#, title, gift 
FROM customers c JOIN orders o ON (c.customer# = o.customer#) 
JOIN orderitems oi ON (o.order# = oi.order#) 
JOIN books b ON (oi.isbn = b.isbn) 
JOIN promotion p ON (retail between minretail and maxretail) 
ORDER BY 2, 1, 3, 4;

-- Task 3a
SELECT UNIQUE firstname || ' ' || lastname AS "Customer Name", 
fname || ' ' || lname AS "Author Name" 
FROM customers c, orders o, orderitems oi, bookauthor ba, author a 
WHERE c.customer# = o.customer# 
AND o.order# = oi.order# 
AND oi.isbn = ba.isbn 
AND ba.authorid = a.authorid 
ORDER BY 1, 2;

-- Task 3b
SELECT UNIQUE firstname || ' ' || lastname AS "Customer Name", 
fname || ' ' || lname AS "Author Name" 
FROM customers NATURAL JOIN orders 
NATURAL JOIN orderitems 
NATURAL JOIN bookauthor 
NATURAL JOIN author 
ORDER BY 1, 2;

-- Task 3c
SELECT UNIQUE firstname || ' ' || lastname AS "Customer Name", 
fname || ' ' || lname AS "Author Name" 
FROM customers JOIN orders USING(customer#)
JOIN orderitems USING(order#)
JOIN bookauthor USING(isbn)
JOIN author USING(authorid)
ORDER BY 1, 2;

-- Task 3d
SELECT UNIQUE firstname || ' ' || lastname AS "Customer Name", 
fname || ' ' || lname AS "Author Name" 
FROM customers c JOIN orders o ON(c.customer# = o.customer#)
JOIN orderitems oi ON(o.order# = oi.order#)
JOIN bookauthor ba ON(oi.isbn = ba.isbn)
JOIN author a ON(ba.authorid = a.authorid)
ORDER BY 1, 2;

-- Task 4
SELECT fname, lname, title 
FROM author LEFT OUTER JOIN bookauthor USING(authorid) 
LEFT OUTER JOIN books USING (isbn) 
ORDER BY 2, 1, 3;

--create a file 
spool off