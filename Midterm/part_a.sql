/* Name: Nam Khanh Nguyen
*  Student ID: 000836881
*  Subject: CPRG 250
*  Lab: Midterm Part A
*/

-- Part 1
spool D:\Coding\Midterm\part_a.txt

set echo on 
set linesize 132
set pagesize 66

-- Part A
-- Question 1
SELECT MAX(capacity) AS "Highest No.of Students" 
FROM class_section;

-- Question 2
COLUMN "Name" FORMAT A20;
COLUMN "Seniority" FORMAT A20;

SELECT 
employee_id "EmpID", 
surname || ', ' || firstname "Name", 
TO_CHAR(seniority_date, 'Month DD,YYYY') "Seniority", 
unit 
FROM faculty
WHERE unit IS NOT NULL
ORDER BY 2 DESC;

CLEAR COLUMN;

-- Question 3
SELECT firstname,
surname,
TO_CHAR(birthdate, 'MON DD,YYYY') "Date"
FROM student
ORDER BY surname, firstname;

-- Question 4
SELECT TO_CHAR(AVG(grade), '99.99') "Average" 
FROM course_registration;

-- Question 5
SELECT firstname, surname, expertise_level 
FROM faculty NATURAL JOIN expertise 
WHERE expertise_level >= 2
ORDER BY firstname, surname;

-- Question 6
SELECT surname "Last", 
firstname "First", 
seniority_date "Seniority", 
unit,
salary "Salary"
FROM faculty 
WHERE (unit, salary) IN (SELECT unit, 
								MIN(salary) 
								FROM faculty 
								GROUP BY unit 
								HAVING unit IS NOT NULL)
ORDER BY salary DESC;

-- Question 7
COLUMN "Salary" FORMAT $99,999;

SELECT firstname "First Name",
surname "Last Name",
CASE WHEN unit IS NULL THEN 0
     WHEN unit IS NOT NULL THEN unit 
	 END "Unit",
salary "Salary"
FROM faculty 
WHERE salary > (SELECT AVG(salary) FROM faculty)
ORDER BY salary DESC;

CLEAR COLUMN;

-- Create a file
SPOOL OFF
