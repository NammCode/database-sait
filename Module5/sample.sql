-- slide 1: Module 5
-- slide 2: Reporting
-- slide 3: Reporting Tool
-- slide 4, 8: Types of Reporting 
-- Predefine user reports
-- Flexible user report

-- slide 9: Terminology 

-- slide 10: Basic reports (TTITLE, BTITLE, COLUMN, BREAK, COMPUTE)

/* 
Example 1: 
Cretate a report displaying the ISBN, title, cost, and retail price for
books with a retail price higher than $ 50.
You can create format model for data in the Cost and retail column 
to show two decimal places
*/
SET UNDERLINE OFF 
SET LINESIZE 75
SET PAGESIZE 15
TTITLE CENTER 'Books in Inventory' SKIP -
RIGHT 'Page: ' FORMAT 9 SQL.PNO SKIP 2
BTITLE CENTER 'End of Report' SKIP -
RIGHT 'Run By: ' FORMAT A10 SQL.USER
COLUMN isbn FORMAT A15 HEADING 'ISBN|**********'
COLUMN title FORMAT A35 HEADING 'Title|*****'
COLUMN cost FORMAT $999.99 HEADING 'Cost|******'
COLUMN retail FORMAT $999999999.99 HEADING 'Retail|Price|******'

SELECT isbn, title, cost, retail 
FROM books 
WHERE retail > 50
ORDER BY title;

/* 
Example 2
*/
SET VERIFY OFF
SET UNDERLINE OFF
SET FEEDBACK OFF
SET LINESIZE 30
SET PAGESIZE 25

TTITLE CENTER 'Amount Due Per Order' SKIP 2
BTITLE CENTER 'Run by: ' SQL.USER FORMAT A5
COLUMN total FORMAT 999.99
BREAK ON customer# SKIP 1

SELECT customer#, order#, SUM(paideach*quantity) total 
FROM orders NATURAL JOIN orderitems 
WHERE customer# < 1007
GROUP BY customer#, order#
ORDER BY 1;

CLEAR BREAK
CLEAR COLUMN