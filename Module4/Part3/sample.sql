-- slide 4: Cartesian Join
-- There are 14 books, 5 publisher
-- So we have 70 rows
SELECT name, title 
FROM books CROSS JOIN publisher;

SELECT name, title
FROM books, publisher;

-- slide 6: Equality Join
-- There are 14 title/ 14 pubid 
-- We have 14 rows wit 14 pubname
SELECT name, title 
FROM books, publisher 
WHERE publisher.pubid = books.pubid 
ORDER BY name, title;

-- slide 8: Join and other conditions
SELECT name, title, retail 
FROM books, publisher 
WHERE publisher.pubid = books.pubid AND retail >= 50 
ORDER BY 1, 2;

-- slide 10: Using aliases
SELECT name, title, retail 
FROM books b, publisher p
WHERE b.pubid = p.pubid AND retail >= 50 
ORDER BY 1, 2;

-- slide 12: Joining multiple table
-- n tables requires (n - 1) join
SELECT firstname, lastname, title 
FROM customers c, orders o, orderitems oi, books b
WHERE c.customer# = o.customer#
AND o.order# = oi.order#
AND oi.isbn = b.isbn
ORDER BY 2, 3;

-- slide 13
-- customer ==> orders ==> orderitems ==> books ==> publisher
-- books ==> bookauthor ==> author
SELECT title, lname, fname, firstname, lastname 
FROM customers c, orders o, orderitems oi, books b, publisher p, bookauthor ba, author a 
WHERE c.customer# = o.customer# 
AND o.order# = oi.order# 
AND oi.isbn = b.isbn 
AND b.pubid = p.pubid 
AND b.isbn = ba.isbn 
AND ba.authorid = a.authorid 
ORDER BY 4, 3, 1;

-- slide 14
-- same with equality join
-- If 2 tables have the same name in common columns
SELECT name, title
FROM publisher NATURAL JOIN books
ORDER BY 1, 2;

-- slide 15
SELECT name, pubid, title
FROM publisher NATURAL JOIN books
ORDER BY 1,3;

-- slide 16: JOIN ... USING
-- This is the safest and most common syntax for JOIN if the linking columns have  the same name
SELECT name, title, order# 
FROM publisher JOIN books USING (pubid) 
JOIN orderitems USING (isbn) 
ORDER BY 1,2,3;

-- same with
SELECT name, title, order# 
FROM publisher p, books b, orderitems oi 
WHERE p.pubid = b.pubid AND b.isbn = oi.isbn 
ORDER BY 1,2,3;

-- slide 17: JOIN ... ON
-- If columns name are diff or if you have more complex connections
SELECT name, title, order# 
FROM publisher p JOIN books b ON (p.pubid = b.pubid) 
JOIN orderitems oi ON (b.isbn = oi.isbn) 
ORDER BY 1,2,3;

-- slide 18: Overview
-- Tradional Join using = operator
-- NATURAL JOIN based on common columns
-- JOIN .. USING when have column in common.
-- JOIN .. ON when different name

-- slide 19 - 20: Self-Join
-- Used to link a table itself 
-- Traditional JOIN  or JOIN .. ON
-- slide 21: List all customers reffered by Leila (1003) and Meshia (1006)
SELECT c.firstname "Customer", rb.firstname "Ref by"
FROM customers c, customers rb 
WHERE c.referred = rb.customer# 
AND rb.customer# IN (1003, 1006)
ORDER BY 1,2;

-- slide 22: List all customers who have reffered other customers.
SELECT c.lastname || ' ' || c.firstname "Customer Name", rb.lastname "Refer to" 
FROM customers c, customers rb 
WHERE c.customer# = rb.referred
ORDER BY 1, 2;

-- slide 23: Can  use JOIN .. ON for itself JOIN.
SELECT c.lastname || ' ' || c.firstname "Customer Name", rb.lastname "Refer to" 
FROM customers c JOIN customers rb 
ON (c.customer# = rb.referred)
ORDER BY 1, 2;

-- slide 26 outer Join, Tradional Method
-- Show customers and all thier order. Include customers with no orders.
-- o.customer#(+) means generate a null value row to match customers that have no orders
SELECT firstname, order# 
FROM customers c, orders o 
WHERE c.customer# = o.customer#(+)
ORDER BY 1,2;

-- slide 27
SELECT firstname, order#
FROM customers LEFT OUTER JOIN orders USING (customer#)
ORDER BY 1, 2;
  
-- slide 29
-- Includes row on BOTH sides that do not have a matching inner join connections.
-- Show all customers and books. Include customers that have not ordered any books
-- and books that have not been ordered by any customer.
SELECT firstname, lastname, title 
FROM customers FULL OUTER JOIN orders USING (customer#) 
FULL OUTER JOIN orderitems USING (order#) 
FULL OUTER JOIN books USING (isbn) 
ORDER BY 1, 2;

-- slide 30 - 32: Non-Equality Joins
-- In WHERE clause, use any comparison operator other than the equal sign.
-- The gift associated with a book will be based on the book's price
SELECT title, retail, gift 
FROM books b, promotion p 
WHERE b.retail BETWEEN p.minretail AND p.maxretail;

-- slide 33:
-- In FROM clause, use JOIN .. ON keywords with a non-equivalent condition.
SELECT title, retail, gift 
FROM books b JOIN promotion p 
ON (b.retail BETWEEN p.minretail AND p.maxretail);

-- slide 34 - 35: UNION
-- Used to combine the result of two or more SELECT statements
SELECT 'Author: ' || fname || ' ' || lname "Author Name and Contact" 
FROM author 
UNION 
SELECT 'Publisher: ' || contact || ' - Company: ' || name 
FROM publisher;

-- slide 36: INTERSECT (giao nhau) 
-- Returns only the rows included in the result of both queries
SELECT customer# FROM customers 
INTERSECT 
SELECT customer# FROM orders;

-- slide 37: MINUS
-- Subtracts the second query's results if they're also returned in the first query's results
-- Find all customers that do not have an order
-- set (ALL customers) - set (Customers with orders) ==> set (customers without orders)
SELECT customer# FROM customers 
MINUS 
SELECT customer# FROM orders;


















