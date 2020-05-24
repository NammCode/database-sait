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
-- Tradional Join using =
-- NATURAL JOIN based on common columns















