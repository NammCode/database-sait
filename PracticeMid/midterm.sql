/* Name: Nam Khanh Nguyen
*  Student ID: 000836881
*  Subject: CPRG 250
*  Lab: Practice Midterm
*/

-- Part 1
start C:\Coding\Database\Config\ICCC\create_iccc.sql
start C:\Coding\Database\Config\ICCC\constraints_iccc.sql
start C:\Coding\Database\Config\ICCC\load_iccc.sql
start C:\Coding\Database\Config\ICCC\updates_iccc.sql

spool c:\Coding\Database\PracticeMid\midterm.txt
-- Part 2.1
set echo on 
set linesize 132
set pagesize 66
CLEAR COLUMN 
CLEAR BREAK
CLEAR title

-- Part 2.1
DESCRIBE course;
SELECT * FROM course;

DESCRIBE expertise;
SELECT * FROM expertise;

DESCRIBE faculty;
SELECT * FROM faculty;

DESCRIBE class_section;
SELECT * FROM class_section;

DESCRIBE course_registration;
SELECT * FROM course_registration;

DESCRIBE student;
SELECT * FROM student;

-- Part 3
SELECT course_title, credits, firstname, surname 
FROM course NATURAL JOIN expertise NATURAL JOIN faculty 
WHERE course_code LIKE 'CSYS%';

-- Part 4
SELECT course_title 
FROM COURSE 
WHERE prerequisite 
IS NOT NULL;

-- Part 5
SELECT TO_CHAR(AVG(grade), '99.99') 
FROM course_registration;

-- Part 5.2
SELECT SUM(salary) 
FROM faculty 
GROUP BY unit 
HAVING SUM(salary) > 50000;

-- Part 6
SELECT firstname, surname, grade, grade.avg
FROM course_registration NATURAL JOIN student, 
(SELECT TO_CHAR(AVG(grade), '99.99') avg
				FROM course_registration) grade
WHERE grade < grade.avg;

-- Part 7
SET LINESIZE 55;
TTITLE CENTER 'Class Capacity Report' SKIP 2

BREAK ON course_code SKIP 1
BREAK ON course_code SKIP 1 on report
COMPUTE SUM LABEL 'Course Cap' of SUM(capacity)  on course_code
COMPUTE SUM LABEL 'Grand Cap.' of SUM(capacity)  on report

COLUMN course_code HEADING 'Course|Code'
COLUMN semester FORMAT A10 HEADING 'Semester'
COLUMN SUM(capacity)  HEADING 'Capacity|Calue'


SELECT course_code, semester, SUM(capacity) 
FROM class_section 
GROUP BY (course_code, semester)
HAVING SUM(capacity) >= 75
ORDER BY course_code;

-- Create a file
SPOOL OFF