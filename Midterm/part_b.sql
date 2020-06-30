/* Name: Nam Khanh Nguyen
*  Student ID: 000836881
*  Subject: CPRG 250
*  Lab: Midterm Part B
*/

-- Part 1
spool D:\Coding\Midterm\part_b.txt

set echo on 
set linesize 80
set pagesize 30

TTITLE CENTER 'Faculty - Expertise Level Report' SKIP 2;
BTITLE CENTER FORMAT A10 'RUN BY: ' SQL.USER;

BREAK ON "Level" SKIP 1 ON REPORT;

COLUMN "Level" HEADING 'Expertise Level';
COLUMN "id" HEADING 'Faculty ID';
COLUMN "unit" HEADING 'Unit';
COLUMN "fname" FORMAT A20 HEADING 'First Name';
COLUMN "sname" FORMAT A20 HEADING 'Last Name';

COMPUTE COUNT LABEL 'Expertise Total' OF "sname" ON "Level";
COMPUTE COUNT LABEL 'Grand Total' OF "sname" ON REPORT;

SELECT e.expertise_level "Level", 
f.employee_id "id", 
f.unit "unit", 
f.firstname "fname", 
f.surname "sname"
FROM faculty f, 
(SELECT employee_id, expertise_level 
 FROM expertise 
 GROUP BY employee_id, expertise_level) e
WHERE f.employee_id = e.employee_id
AND expertise_level >= 7
ORDER BY 1, 2, 3;



CLEAR COLUMN;

-- Create a file
SPOOL OFF
