-- slide 1, 2, 3
-- SUM, AVG, STDDEV, VARIANCE: Numeric values
-- MAX, MIN, COUNT: Numeric, Char and Data values

-- slide 5 - SUM Func
-- Calulates total amount stored in a numeric column for a group of rows
-- What is the total value of order# 1007?
SELECT SUM(quantity*paideach) "No. of Books" FROM orderitems WHERE order# = 1007;

-- slide 7 - AVG Func
-- Cal the average of numeric value in column
SELECT AVG(retail-cost) "Average Profit" FROM books WHERE category = 'COMPUTER';

-- slide 8 - COUNT Func
-- Count non-NULL values 
-- Count total records, including NULL

-- slide 9: How many diff book categories are there?
SELECT COUNT(DISTINCT category) "# of Categories" FROM books;
-- How many different author?
SELECT COUNT(DISTINCT authorid) FROM author NATURAL JOIN bookauthor;

-- slide 10: How many books have a discount?
SELECT COUNT(discount) FROM books;

-- slide 11: How many orders have not been shipped (no shipdate)?
SELECT COUNT(*) FROM orders WHERE shipdate IS NULL;

-- slide 12 - MAX Func
-- Return largest value
SELECT MAX(retail - cost) "Profit" FROM books;
-- Which book have max?
SELECT * FROM books WHERE retail-cost = (SELECT MAX(retail-cost) FROM books);

-- slide 13 - MIN Func
-- Finding the oldest book hehe
SELECT * FROM books WHERE pubdate = (SELECT MIN(pubdate) FROM books);

-- slide 14 - Datatypes
-- slide 15 - Grouping Data 
-- Used to group data, Must be used for any individual column in SELECT clause
-- Cannot reference column aliases

-- slide 16 - GROUP BY
SELECT category, AVG(retail-cost) "Ave Profitability", COUNT(*) "# of Books" 
FROM books GROUP BY category;

-- slide 17 - Common Error

-- slide 18 - HAVING
-- limits which group are included in the output
-- it's like WHERE clause for the group
SELECT category, AVG(retail-cost) "Ave Profitability" 
FROM books 
GROUP BY category 
HAVING AVG(retail-cost) > 15;

-- slide 20: 
SELECT category, COUNT(*) "# of Books" 
FROM books 
WHERE pubdate > '01-JAN-04' 
GROUP BY category
HAVING COUNT(*) > 2;

-- slide 21 - Nesting Functions
SELECT MAX(AVG(retail-cost))"Max Profit" FROM books GROUP BY category;

-- slide 22 - Statistical Group Functions

-- slide 23 - STDDEV Function 
SELECT category, AVG(retail), STDDEV(retail), COUNT(*) FROM books GROUP BY category;

-- slide 24

-- slide 28
-- Produce a report similar to the 1st pivot table

-- number of books per publisher
SELECT name, COUNT(*) FROM publisher NATURAL JOIN books GROUP BY name;
-- number of books per category
SELECT category, COUNT(*) FROM publisher NATURAL JOIN books GROUP BY category;
-- merge two of that one together
SELECT name, category, COUNT(*) "$ of Books"
FROM publisher NATURAL JOIN books 
GROUP BY name, category 
ORDER BY 1;

-- slide 30
SELECT name, category, COUNT(*) "$ of Books"
FROM publisher NATURAL JOIN books 
GROUP BY GROUPING SETS (name, category, (name, category), ())
ORDER BY 1, 2;

-- slide 33 - CUBE
SELECT name, category, COUNT(*) "$ of Books"
FROM publisher NATURAL JOIN books 
GROUP BY CUBE (name, category)
ORDER BY 1, 2;

-- slide 36 - ROLLUP 
SELECT name, category, COUNT(*) "$ of Books"
FROM publisher NATURAL JOIN books 
GROUP BY ROLLUP (name, category)
ORDER BY 1, 2;

-- slide 37
SELECT name, TO_CHAR(orderdate, 'MM-YYYY') "Month", category, COUNT(*) 
FROM publisher NATURAL JOIN books NATURAL JOIN orderitems NATURAL JOIN orders
GROUP BY ROLLUP (name, TO_CHAR(orderdate, 'MM-YYYY'), category) 
ORDER BY 1,2;





SELECT firstname, lastname, o.order#, s.orderttl "Value" FROM customers c, orders o, 
(SELECT order#, customer#, SUM(paideach*quantity) orderttl 
FROM orders NATURAL JOIN orderitems NATURAL JOIN customers
GROUP BY ROLLUP (order#, customer#)) s
WHERE c.customer# = o.customer#
AND o.order# = s.order#
GROUP BY ROLLUP (firstname, lastname, o.order#, s.orderttl)
ORDER BY 2, 1, 3;



SELECT order#, customer#, SUM(paideach*quantity) orderttl 
FROM orders NATURAL JOIN orderitems NATURAL JOIN customers
GROUP BY ROLLUP (order#, customer#);









