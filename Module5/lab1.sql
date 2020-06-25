/* Name: Nam Khanh Nguyen
*  Student ID: 000836881
*  Subject: CPRG 250
*  Lab: Module 5
*/

spool c:\Coding\Database\Module5\lab1.txt
set ECHO on 
set LINESIZE 65
set PAGESIZE 45

CLEAR COLUMNS
CLEAR BREAKS

TTITLE CENTER 'Customer / Title Information' SKIP -
CENTER 'Customer Order Evaluation' SKIP 2
BTITLE 'Internal Use Only'

COLUMN INITCAP(title) HEADING 'Book|Title'
COLUMN INITCAP(lastname) HEADING 'Last|Name'
COLUMN INITCAP(firstname) HEADING 'First|Name'
COLUMN cost FORMAT $999.99 HEADING 'Book|Cost'
BREAK ON INITCAP(title)

SELECT INITCAP(title),
INITCAP(lastname), 
INITCAP(firstname), cost 
FROM customers NATURAL JOIN orders 
NATURAL JOIN orderitems 
NATURAL JOIN books 
ORDER BY 1, 2, 3;

-- Create file spool
spool off