/* Name: Nam Khanh Nguyen
*  Student ID: 000836881
*  Subject: CPRG 250
*  Lab: Module 4 Part 6
*/

-- Question 0
set echo on 
set linesize 132
set pagesize 66
--spool c:\cprg250\Module4\part_6\spool.txt
spool c:\Coding\Database\Module4\Part6\spool.txt

-- Question 1
SELECT firstname, lastname 
FROM customers
WHERE state LIKE (SELECT state 
				  FROM customers 
				  WHERE firstname LIKE '%LEILA%' 
				  AND lastname LIKE '%SMITH%')
AND firstname NOT LIKE '%LEILA%'
AND lastname NOT LIKE '%SMITH%'
ORDER BY lastname, firstname;

-- Question 2
SELECT lastname, title, retail, 
(SELECT AVG(retail) FROM books) "Avg" 
FROM  customers NATURAL JOIN orders NATURAL JOIN orderitems NATURAL JOIN books 
GROUP BY (lastname, title, retail) 
HAVING retail > (SELECT AVG(retail) FROM books) 
ORDER BY 1, 2, 3;

-- Question 4a
SELECT INITCAP(fname) || ' ' || INITCAP(lname) "Author", 
INITCAP(title) "Last Book", 
pubdate "Date Pub" 
FROM author NATURAL JOIN bookauthor NATURAL JOIN books
WHERE (authorid, pubdate) IN (SELECT authorid, MAX(pubdate) 
							  FROM books NATURAL JOIN bookauthor 
							  GROUP BY authorid)
ORDER BY lname, fname, title;

-- Question 4b
SELECT INITCAP(fname) || ' ' || INITCAP(lname) "Author", 
INITCAP(title) "Last Book", 
pubdate "Date Pub" 
FROM books b JOIN bookauthor ba ON (b.isbn = ba.isbn)
JOIN author a ON (ba.authorid = a.authorid)
WHERE b.pubdate = (SELECT MAX(pubdate) 
				   FROM books bs NATURAL JOIN bookauthor bas 
				   WHERE bas.authorid = ba.authorid)
ORDER BY lname, fname, title;

-- Question 5
SELECT c.firstname, c.lastname, a.num 
FROM customers c,
(SELECT customer#, COUNT(order#) AS num
FROM orders 
GROUP BY customer# 
ORDER BY COUNT(order#) DESC) a
WHERE c.customer# = a.customer#
ORDER BY 3 DESC, 2, 1
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;

-- Question 6
SELECT customer#, order#, cal "Value of Largeset Order"
FROM (SELECT customer#, order#, 
	  SUM(quantity*paideach) cal
	  FROM orderitems NATURAL JOIN orders 
	  GROUP BY (customer#, order#))
WHERE (customer#, cal) IN (SELECT a.customer#,  
							MAX(a.cal) 
							FROM (SELECT customer#, order#, 
								  SUM(quantity*paideach) cal 
								  FROM orderitems NATURAL JOIN orders 
								  GROUP BY (customer#, order#)) a
							GROUP BY (a.customer#))
ORDER BY customer#;

-- Create file spool
spool off