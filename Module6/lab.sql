/* Name: Nam Khanh Nguyen
*  Student ID: 000836881
*  Subject: CPRG 250
*  Lab: Module 6
*/

SET ECHO ON 

spool c:\Coding\Database\Module6\lab.txt

-- Question 1
INSERT INTO customers 
VALUES(1022,'Ton','Tran','P.O BOX 138','CALGARY','CA',32300,NULL,'SE','aaa@sait.net');

-- Question 2
INSERT INTO orders (order#,customer#,orderdate,shipdate,shipstreet,shipcity,shipstate,shipcost) 
VALUES (1022, 1022, SYSDATE, SYSDATE+4, '136 FRANNKLIN ROB', 'CALGARY', 'FL', 3);

-- Question 3
COMMIT;

-- Question 4
UPDATE books 
SET retail = retail * 0.9
WHERE category = (SELECT category 
				  FROM books 
				  WHERE ISBN = 4981341710);

-- Question 5
DELETE author 
WHERE authorid IN (SELECT authorid 
				   FROM author 
				   WHERE authorid NOT IN (SELECT authorid 
										  FROM bookauthor 
										  GROUP BY authorid));

SELECT * FROM author ORDER BY authorid;

ROLLBACK;

SELECT * FROM author ORDER BY authorid;

-- Create file spool
spool off