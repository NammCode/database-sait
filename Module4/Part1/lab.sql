/* Name: Nam Khanh Nguyen
*  Student ID: 000836881
*  Subject: CPRG 250
*  Lab: Module 4 Part 1
*/

--task 1
set echo on 
set linesize 132
set pagesize 66
--spool c:\cprg250\Module4\part_1\labPart1.txt
spool C:\Coding\Database\Module4\Part1\spool.txt

--task 2
SELECT title
AS "Book Title"
FROM books;

--task 3
SELECT lastname || ', ' || firstname || ', ' || address || ', ' || city || ', ' || state || ', ' || zip 
AS "Customer Information" 
FROM customers;

--task 4
SELECT title, cost AS "Cost Price", retail AS "Retail Price", (retail-cost)/cost*100 AS "%Profit" 
FROM books;

--task5
SELECT UNIQUE Authorid FROM bookauthor;

--create a file 
spool off