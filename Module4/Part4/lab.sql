/* Name: Nam Khanh Nguyen
*  Student ID: 000836881
*  Subject: CPRG 250
*  Lab: Module 4 Part 4
*/

-- Question 1
set echo on 
set linesize 132
set pagesize 66
--spool c:\cprg250\Module4\part_4\spool.txt
spool c:\Coding\Database\Module4\Part4\spool.txt

-- Question 2
column "Pub Date" format A20;
SELECT INITCAP(lname) "Surname", 
INITCAP(title) "Book Title", 
TO_CHAR(pubdate,'FMMonth DD, YYYY') "Pub Date", 
(retail - NVL(discount,0)) "Final Price" 
FROM books NATURAL JOIN bookauthor NATURAL JOIN author
ORDER BY title;

-- Question 3
column "Date Published" format A20;
column "Review Date" format A20;
SELECT INITCAP(title) "Book Title", pubdate "Date Published", 
ADD_MONTHS(pubdate, 6) "Review Date" 
FROM books 
ORDER BY title;

-- Question 4
SELECT INITCAP(title) "Book Title", 
TO_CHAR((retail - NVL(discount,0)), '9,990.00') "Price", 
TO_CHAR(cost, '9,990.00') "Cost", 
TO_CHAR((retail-cost)/cost*100, '9,990.00') "% Profit"
FROM books 
ORDER BY 4 DESC;

-- Question 5
SELECT INITCAP(title) "Book Title", 
TO_CHAR((retail-cost)/cost*100, '9,990.00') AS "Margin",
TO_CHAR(discount, '9,990.00') "Discount",
CASE WHEN discount IS NOT NULL THEN 'Discounter, will NOT be restrocked'
     WHEN TO_CHAR((retail-cost)/cost*100, '9,990.00') >= 60 THEN 'Very High Profit'
     WHEN TO_CHAR((retail-cost)/cost*100, '9,990.00') >= 30 THEN 'High Profit'
     WHEN TO_CHAR((retail-cost)/cost*100, '9,990.00') >= 0 THEN 'Loss Leader'
     END "Pricing Structure"
FROM books 
ORDER BY 1;

--create a file 
spool off


