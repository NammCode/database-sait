-- slide 2: Subqueries and thier uses

-- slide 3: Type of subqueries
-- Single-row Subquery
-- Multiple-row Subquery
-- Multiple-column Subquery
-- Correlated Subquery
-- Uncorrelated Subquery

-- slide 4: Single-Row Subqueries, return 1 results
-- (>, <, =, <=, >=)

-- slide 5: in WHERE clause 
-- Used for comparison against individual data
SELECT title, retail 
FROM books 
WHERE retail > (SELECT retail 
				FROM books 
				WHERE title LIKE '%DATABASE IMPLEMENTATION%') 
ORDER BY title;

-- slide 6, 7: in HAVING clause
-- Required when returned value is compared to grouped data 
SELECT category, AVG(retail - cost) 
FROM books 
HAVING AVG(retail - cost) > (SELECT AVG(retail - cost) 
					  FROM books 
					  WHERE category LIKE '%LITE%')
GROUP BY (category)
ORDER BY 1;

-- slide 8: in SELECT clause
-- Replicates subquery value for each row displayed
SELECT category, 
MAX(retail) "Category Max", 
(SELECT MAX(retail) FROM books) "Bookstore Max" 
FROM books 
GROUP BY category;

-- slide 9: in other clauses
-- step 1
SELECT AVG(avgPerCat) 
FROM (SELECT AVG(retail) as avgPerCat 
	  FROM books 
	  GROUP BY category);

-- step 2
SELECT category, 
AVG(retail) "Average Per Category",
(SELECT AVG(AVG(retail))
 FROM books 
 GROUP BY category) "Avg of All Category",
AVG(retail) - (SELECT AVG(AVG(retail))
			   FROM books 
		       GROUP BY category) "Above/Below Avg"
FROM books
GROUP BY category;

-- slide 10: Multiple-Row Subqueries, return more than 1 results
-- Used moss in WHERE and HAVING clause
-- (IN, ANY, ALL, EXISTS)

-- slide 11: ANY & ALL Operators
-- >ANY, >ALL, <ANY, <ALL

-- slide 12, 13: in WHERE clause
-- step 1
SELECT category, 
MAX(retail) 
FROM books 
GROUP BY category;

-- step 2
SELECT title, category, retail
FROM books
WHERE (category, retail) IN (SELECT category,
							 MAX(retail) 
							 FROM books
							 GROUP BY category)
ORDER BY title;
						   
-- slide 14: Another Example
-- step 1
SELECT retail FROM books WHERE category = 'COMPUTER';

-- step 2
SELECT title, category, retail
FROM books
WHERE retail <ANY (SELECT retail 
				   FROM books
				   WHERE category = 'COMPUTER')
ORDER BY title;

-- slide 15: in HAVING clause
-- step 1
SELECT order#, 
SUM(paideach*quantity) 
FROM orderitems NATURAL JOIN orders 
NATURAL JOIN customers 
WHERE state = 'FL' GROUP BY order#;

-- step 2
SELECT order#, 
SUM(paideach*quantity) 
FROM orderitems 
GROUP BY order# 
HAVING SUM(paideach*quantity) > ALL(SELECT SUM(paideach*quantity) 
									FROM orderitems NATURAL JOIN orders 
									NATURAL JOIN customers 
									WHERE state = 'FL' GROUP BY order#)
ORDER BY 1;

-- slide 16: Multiple-Column Subqueries
-- Return more than one column in results
-- Can return more than one row 
-- Column list on the left side of operator must be in parentheses
-- Use the IN operator for WHERE and HAVING clauses

-- slide 17, 18: in FROM 
-- step 1
SELECT category, 
AVG(retail) 
FROM books 
GROUP BY category;

-- step 2
SELECT b.title, b.retail, AVG.category 
FROM books b,(SELECT category,
			  AVG(retail) AS catAverage
			  FROM books
			  GROUP BY category) avg 
WHERE b.category = avg.category
AND b.retail > avg.catAverage
ORDER BY 3, 1;

-- slide 19: in WHERE clause
-- Returns multiple column for evaluation
SELECT title, category, retail
FROM books
WHERE (category, retail) IN (SELECT category,
							 MIN(retail) 
							 FROM books
							 GROUP BY category)
ORDER BY title;

-- slide 20: NULL values
-- When a subquery might return NULL values, use NVL function
SELECT customer# 
FROM customers 
WHERE referred = 
(SELECT referred 
 FROM customers 
 WHERE customer# = &&customerNumm) 
AND customer# != &&customerNumm;

-- slide 21: None value

-- slide 22:
SELECT customer# 
FROM customers 
WHERE NVL(referred, 0) = 
(SELECT NVL(referred, 0) 
 FROM customers 
 WHERE customer# = 1005) 
AND customer# != 1005;

-- slide 23, 24, 25: Uncorrelated Subqueries

-- slide 26, 27:
SELECT name, title, retail 
FROM publisher NATURAL JOIN books 
WHERE (pubid, retail) IN (SELECT pubid, 
						  MAX(retail) 
						  FROM books 
						  GROUP BY pubid)
ORDER BY 1;

-- slide 28: same Correlated Sub
SELECT p.name, b.title, b.retail 
FROM books b, publisher p 
WHERE b.pubid = p.pubid 
AND b.retail = (SELECT MAX(retail) 
				FROM books bi
				WHERE b.pubid = bi.pubid)
ORDER BY 2, 1;

-- slide 29, 30: Nested Subqueries

-- slide 31: 
-- step 1
SELECT order# 
FROM orderitems 
GROUP BY order# 
HAVING COUNT(*) = (SELECT MAX(COUNT(*)) 
				   FROM orderitems 
				   GROUP BY order#);

-- step 2
SELECT firstname, lastname 
FROM customers NATURAL JOIN orders
WHERE order# IN (SELECT order# 
				 FROM orderitems 
				 GROUP BY order# 
				 HAVING COUNT(*) = (SELECT MAX(COUNT(*)) 
									FROM orderitems 
									GROUP BY order#));

-- slide 32: Inline View
-- Top to Down table

-- step 1
SELECT title, retail-cost profit 
FROM books 
ORDER BY profit desc;

-- step 2
SELECT title, profit, ROWNUM 
FROM (SELECT title, retail-cost profit 
	  FROM books 
	  ORDER BY profit desc)
WHERE ROWNUM <= 5;

-- slide 38
SELECT firstname, lastname, order# 
FROM customers NATURAL JOIN orders 
ORDER BY 2, 1, 3 
FETCH FIRST 5 ROWS ONLY;

-- same
SELECT firstname, lastname, order# 
FROM customers NATURAL JOIN orders 
ORDER BY 2, 1, 3 
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY;