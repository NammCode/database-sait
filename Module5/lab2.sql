/* Name: Nam Khanh Nguyen
*  Student ID: 000836881
*  Subject: CPRG 250
*  Lab: Module 5
*/

spool c:\Coding\Database\Module5\lab2.txt
set ECHO on 
set LINESIZE 80
set PAGESIZE 40

CLEAR COLUMNS
CLEAR BREAKS

TTITLE CENTER 'Author / Title Information' SKIP -
CENTER 'Author Book Cost Evaluation' SKIP 2
BTITLE 'Internal Use Only'

BREAK ON name SKIP 1 on report
COMPUTE SUM LABEL 'Total Cost' of cost on name
COMPUTE SUM LABEL 'Grand Total Cost' of cost on report
COLUMN name HEADING 'Publisher|Name'
COLUMN id FORMAT 99 HEADING 'ID'
COLUMN title HEADING 'Book|Title'
COLUMN cost FORMAT $9999.00 HEADING 'Book|Cost'

SELECT INITCAP(p.name) name, p.pubid id, 
INITCAP(b.title) title, b.cost cost
FROM publisher p, books b 
WHERE p.pubid = b.pubid
ORDER BY 1, 3;

-- Create file spool
spool off