/* 
Example 3
*/
SET ECHO OFF 

SPOOL c:\Coding\Database\Module5\sampleHTML.html
SET MARKUP HTML ON 
SELECT isbn, title, cost, retail 
FROM books 
WHERE retail > 50
ORDER BY title;

SET MARKUP HTML OFF
SPOOL OFF
SET ECHO ON