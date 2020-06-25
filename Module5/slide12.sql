-- Build a formatted book list with isbn, title, cost and retail price for all books 
-- whose retail price > a min amount.

SET ECHO OFF
-- don't show variable substitution
SET VERIFY OFF
-- don’t show ‘x rows selected’
SET FEEDBACK OFF
SET LINESIZE 80
SET PAGESIZE 66

CLEAR COLUMNS
CLEAR BREAKS

set underline off

COLUMN title FORMAT A35 HEADING 'Title|*****'
COLUMN cost FORMAT $999.99 HEADING 'Cost|****'
COLUMN retail FORMAT $999.99 HEADING 'Retail|Price|******'
COLUMN isbn FORMAT 9999999999999 HEADING 'ISBN|****'

ACCEPT price number prompt 'Enter the Minimum Price: '

select isbn, title, cost, retail
from books
where retail > &price
order by title;

set underline on