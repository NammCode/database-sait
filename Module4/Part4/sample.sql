-- slide 3: Single Row Function
-- Show the first name and lastname of all customers
-- Capitaliuze the first character of the first name and lastname
-- sort by lastname and first name
SELECT initcap(firstname) "First Name", initcap(lastname) "Last Name" 
FROM customers 
ORDER BY 2,1;

-- slide 4: Group Row Function
-- What is the average retail price of all books?
SELECT AVG(retail) "Average Price" 
FROM books;

-- slide 5: 
-- Case: upper, lower, initcap
-- Character manuipulation: substr, instr, length, lpad/rpad, ltrim/rtrim, REPLACE, TRANSLATE, CONCAT
-- Numeric Functions: ROUND, TRUNC, MOD, ABS, POWER
-- Date Func: MONTHS_BETWEEN, ADD_MONTHS, NEXT_DAY, LAST_DAY, TO_DATE, ROUND, TRUNC, CURRENT_DATE
-- Regular: 


-- slide 7: LOWER func
-- Find all customers whose lastname matches 'smith'
SELECT firstname, lastname 
FROM customers 
WHERE LOWER(lastname)='smith';

-- slide 9: INITCAP func
-- Show all customer name and thier address
-- Captulization first letter
SELECT INITCAP(firstname) "First Name", 
INITCAP(lastname) "Last Name", 
INITCAP(address) "Address" 
FROM customers;

-- slide 11, 12: SUBSTR func
SELECT firstname, lastname, state, substr(zip,1,3) "Sectional Center", zip 
FROM customers 
WHERE state IN('CA', 'FL') 
ORDER BY state, zip;

-- slide 13: INSTR(a, b) Func
-- return starting position of b in a
-- Unlike Java, the first character is at position 1

-- slide 13: Nesting Func
-- Display all books and the year they were published
-- Get the position of first dash
SELECT title, INSTR(pubdate, '-') FROM books;
-- Get the position of second dash
SELECT title, INSTR(pubdate, '-', INSTR(pubdate, '-') +1) FROM books;
-- Get the year
SELECT title, 
SUBSTR(pubdate, INSTR(pubdate, '-', INSTR(pubdate, '-') +1)+1, 2) "Year" 
FROM books;

-- slide 16: LENGTH func
-- Display all publisher names and thier length
SELECT name, length(name) FROM publisher;

-- slide 17: LPAD & RPAD func
-- display all customers, pad the first name and lastname with '*' to ad width of 10 character
SELECT LPAD(firstname, 10, '*') "First Name", 
RPAD(lastname, 10, '*') "Last Name" 
FROM customers;

-- slide 18
-- Show the title and how expensice a book is based on the table
column "Price" format A20
SELECT title, RPAD('Price: ', retail/10 + 7 + 1, '$') "Price" FROM books;

-- slide 19: LTRIM, RTRIM
-- Used to remove a specific string of character
-- Display all box # of all address that have a P.O. Box in the address. Include the last name, city and PO box# in the report.
-- Trim off the words P.O.Bo
SELECT lastname, LTRIM(address, 'P.O. BOX') "Box #", city 
FROM customers 
WHERE address LIKE '%P.O%BOX%';

-- slide 20: REPLACE func
-- Substitutes a string with another specified string 
-- Use 'Post Office Box #'
SELECT lastname, REPLACE(address, 'P.O. BOX', 'POST OFFICE BOX#') "Address", city 
FROM customers 
WHERE address LIKE '%P.O%BOX%';

-- slide 21: TRANSLATE func
-- Translate one character in a string with another character throughout the string
-- Display the book titles and publication date in the format DD/MM/YY
 SELECT title, TRANSLATE(pubdate, '-', '/') "Pub Date" FROM books;

-- slide 22: CONCAT func
-- Used to concatenate two character strings.
-- Same func as '||'
-- Display the customer first name, last name and customer number
SELECT firstname, lastname, CONCAT('ID#', customer#) "Customer #" FROM customers;

-- slide 24: ROUND func
SELECT title, ROUND(retail*1.05,2) "Price W GST" FROM books;

-- slide 25: TRUNC func
-- Used to truncate a numeric value to a specific position
SELECT title, TRUNC(cost,1) FROM books;


-- slide 26: MOD func
-- Returns the reminder from a division
SELECT TRUNC(23/4) "Full boxes", MOD(23,4) "Modulus" FROM dual;

-- slide 27: ABS func
-- ABS returns the absolute value of a numeric expresion
-- the diff between the cost price and retail price of each book
SELECT title, ABS(cost - retail) "Different" FROM books;

-- slide 28: Date Func
SELECT order#, orderdate, shipdate, (shipdate - orderdate) "Days till ship" FROM orders;

-- slide 29: MONTHS_BETWEEN func
-- Determine the number of months between two dates
SELECT order#, orderdate, title, pubdate, 
TRUNC(MONTHS_BETWEEN(orderdate, pubdate)/12, 2) "Years between" 
FROM orders NATURAL JOIN orderitems NATURAL JOIN books;

-- slide 30: ADD_MONTHS Func
-- Adds a specified number of months to a date
SELECT title, pubdate, name, 
ADD_MONTHS(pubdate, 60) "Renegotiated Date" 
FROM books NATURAL JOIN publisher;

-- slide 31: NEXT_DAY Func
-- Determines the next occurrence of a day of the week after a given date
SELECT order#, customer#, orderdate, 
NEXT_DAY(orderdate, 'MONDAY') "Ship Date" 
FROM orders 
WHERE order# = 1018;

-- slide 32: TO_DATE func
-- Convert various date format to the internal format used by Oracle (DD-MON-YY)
SELECT order#, shipdate FROM orders WHERE shipdate > TO_DATE('&shipDate','fmMONTH dd,yyyy');

-- slide 34: ROUND func
-- ROUND can also be used to round dates
SELECT title, pubdate, ROUND(pubdate,'MONTH') "Rounded Pub Date" FROM books;

-- slide 35: TRUNC func
SELECT title, pubdate, TRUNC(pubdate, 'YY') FROM books;

-- slide 36: TO_CHAR, Format model elements
-- slide 37: Other Function: NVL, NVL2, TO_CHAR, DECODE, SOUNDEX

-- slide 38: NVL Func
-- Substitutes a value for a NULL value
SELECT title, retail, discount, (retail - NVL(discount, 0)) "New Price" FROM books;

-- slide 39: Allows different actions based on whether a value is NULL or not
SELECT order#, orderdate, shipdate, NVL2(shipdate, 'Shipped', 'Not Shipped') "Status" FROM orders;

-- slide 40 - 41: NULLIF FUNCTION
-- NULLIF compare expr1 and expr2. If they are equal, return the null. 
-- If they are not equal,  then the function returns expr1.
SELECT order#, item#, title, retail, paideach, 
NULLIF(paideach, retail) "Discounted Price" 
FROM orders NATURAL JOIN orderitems NATURAL JOIN books;

-- slide 41 - 42: TO_CHAR func
-- Convert Dates and numbers to ad formatted character string
SELECT order#, orderdate, TO_CHAR(shipdate, 'fmMONTH DD, YYYY') "Ship Date" FROM orders;

-- slide 43: TO_CHAR format number
-- TO_CHAR format output strings; however, it is more common to use SQL*PLUS SET COLUMN
SELECT title, retail, TO_CHAR(retail*1.05, '$9,990.00') "Price W GST" FROM books;

-- slide 44: DECODE Func
-- Determines action based upon values in a list  

-- slide 45: Tax rates solved with decode
-- Show each customer name and thier applicable tax rate (CA 6.5%, FL 7%, NJ 7%, TX6.25%)
SELECT firstname, lastname, state, 
DECODE(state, 'CA', 6.5, 'FL', 7, 'NJ', 7, 'TX', 6.25, 0) "Tax" 
FROM customers;

-- slide 46: CASE Expression (Exact match, Relational)
-- CASE colName WHEN value1 THEN return1
--				WHEN value2 THEN return2
--				ELSE returnDefault END

-- CASE WHEN expr1 THEN return1
--		WHEN expr2 THEN return2
--		ELSE returnDefault END

-- slide 47: Exact match CASE example
SELECT firstname, lastname, state, 
CASE state WHEN 'CA' THEN 6.5 
		   WHEN 'FL' THEN 7 
		   WHEN 'NJ' THEN 7 
		   WHEN 'TX' THEN 6.25 
		   ELSE 0 END "Sales Tax Rate" 
FROM customers;

-- slide  48: Relational CASE example
SELECT firstname, lastname, state, 
CASE WHEN state='CA' THEN 6.5 
	 WHEN state IN('FL', 'NJ') THEN 7 
     WHEN state='TX' THEN 6.25 
	 ELSE 0 END "Sales Tax Rate" 
FROM customers;

-- slide 49
-- Greatest & LEAST
-- Show some the lesser of retail and paideach
SELECT title, retail, paideach, least(paideach, retail) 
FROM books 
NATURAL JOIN orderitems;

-- slide 50
-- Show the titles, retail, and update cost price for all books
SELECT title, retail, cost, GREATEST(cost, 25) "Lastest Update" FROM books ORDER BY 1;
  
-- slide 51
-- SOUNDEX FUNCTION: Returns the phonetic representation of words
-- Find all names that sound like Becka
SELECT firstname, lastname, soundex(firstname) FROM customers 
WHERE soundex(firstname) = soundex('&soundex');

-- slide 52
-- TO_NUMBER Function
SELECT title, 
TO_NUMBER(TO_CHAR(sysdate,'yyyy')) - TO_NUMBER(TO_CHAR(pubdate,'yyyy')) "Years Old" 
FROM books 
WHERE category = 'COMPUTER';

-- slide 53
SELECT TO_CHAR(sysdate, 'fmMonth DD,YYYY,hh:mi.ss AM') "System time" FROM dual;
SELECT * FROM dual;












































