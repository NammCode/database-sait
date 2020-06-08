/* Name: Nam Khanh Nguyen
*  Student ID: 000836881
*  Subject: CPRG 250
*  Lab: Module 4 Part 5
*/

-- Question 1
set echo on 
set linesize 132
set pagesize 66
--spool c:\cprg250\Module4\part_5\spool.txt
spool c:\Coding\Database\Module4\Part5\spool.txt

-- Question 2
SELECT INITCAP(firstname) "First", INITCAP(lastname) "Last", o.order#, s.orderttl "Order Ttl" 
FROM customers c, orders o, 
(SELECT order#, SUM(paideach*quantity) orderttl FROM orders NATURAL JOIN orderitems
GROUP BY order#) s
WHERE c.customer# = o.customer#
AND o.order# = s.order#
ORDER BY 2, 1, 3;

-- Question 3
SELECT AVG(COUNT(*)) FROM author NATURAL JOIN bookauthor NATURAL JOIN books GROUP BY(lname, fname);

-- Question 4
SELECT INITCAP(category) "Category", COUNT(*) "Num of Books", 
TO_CHAR(AVG(retail), '$9,990.00') "Average" 
FROM books 
GROUP BY category
HAVING COUNT(*) >= 2
ORDER BY 1;

-- Question 5
SELECT INITCAP(fname) "First", INITCAP(lname) "Last", SUM (s.perBook * s.quantity) "# of Books"
FROM (SELECT fname, lname, quantity, COUNT(*) perBook
FROM author NATURAL JOIN bookauthor NATURAL JOIN books NATURAL JOIN orderitems
GROUP BY(fname, lname, quantity)) s
GROUP BY (fname, lname)
HAVING SUM (s.perBook * s.quantity) >= 10
ORDER BY 2, 1;

-- Question 6
-- My result don't have total in Value (have only 35 rows selected)
SELECT firstname, lastname, order#, SUM(paideach*quantity) orderttl 
FROM orders NATURAL JOIN orderitems NATURAL JOIN customers
GROUP BY ROLLUP ((firstname, lastname), order#);

-- Create file spool
spool off
