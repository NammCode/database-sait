-- Module 6 Data Manipulation and Transaction Control 

-- slide 2: INSERT Command
-- Used to add rows to existing tables 
-- Identify the table in the INSERT INTO clause
-- Specify data in the VALUES clause 
-- Can only add one row at a time to a table

-- slide 3: INSERT Command Syntax
-- Enclose nonnumeric data in single qoutes

-- slide 4: Exploring Virtual Columns 

-- slide 6: Two version of INSERT

-- slide 7: Activating the DEFAULT option

-- slide 9: INSERT no column names
INSERT INTO acctmanager VALUES ('T500','Nick','Taylor','10-JAN-19',47000.00,0,'NE');

-- slide 10: INSERT using column names
INSERT INTO acctmanager (amfirst, amlast, amid, amedate, amsal, amcomm) 
VALUES ('Mandy','Lopez','L500','01-OCT-18',42000.00,10000);

-- slide 11: Using system values
-- Using the SYSDATE for the date
INSERT INTO acctmanager (amfirst, amlast, amid, amedate, amsal, amcomm) 
VALUES ('Harvey','Wallbanger','W503',SYSDATE,50000.00,5000);

-- slide 12: Constraint Violations
-- slide 13: Error
INSERT INTO acctmanager (amfirst, amlast, amid, amedate, region) 
VALUES ('Sara','Harris','H504',default,'C');
-- check constraint (ACCTMANAGER_REGION_CK) violated  
INSERT INTO acctmanager (amfirst, amlast, amid, amedate, region) 
VALUES ('Sara','Harris','H504',default,'SE');

-- slide 14, 15: INSERT data from an Existing table
desc acctbonus

-- subquery
SELECT amid, amsal, region 
FROM acctmanager 
WHERE region IS NOT NULL;

-- add data
INSERT INTO acctbonus (amid, amsal, region) 
SELECT amid, amsal, region 
FROM acctmanager 
WHERE region IS NOT NULL;

COMMIT

-- slide 16, 17, 18: Modifying Existing ROWS
-- Use UPDATE command

-- slide 19
SELECT * FROM acctmanager;

UPDATE acctmanager 
SET amcomm = 1500.00, region = 'SW'
WHERE amfirst = 'Mandy' AND amlast = 'Lopez';

COMMIT;

-- slide 20: UPDATE all rows
UPDATE acctmanager SET amsal = amsal * 1.04;
SELECT * FROM acctmanager;
COMMIT;

-- slide 21: DELETING rows
-- Delete Nick Taylor From acctbonus table
DELETE acctbonus 
WHERE amid = (SELECT amid
			  FROM acctmanager
			  WHERE amfirst = 'Nick'
			  AND amlast =  'Taylor');

-- slide 22: DELETE - omitting WHERE clause
-- remove all rows
-- we can ROLLBACK the change if we did not commit it
SELECT * FROM acctmanager;
DELETE acctmanager;

SELECT * FROM acctmanager;
ROLLBACK;

SELECT * FROM acctmanager;
COMMIT; 

SELECT * FROM acctmanager;

-- slide 23: Transaction Control Statement
-- A transaction is a set of related commands that must be done to accomplish a specific user action

-- slide 24: COMMIT command
-- Permanently updates table and allow other users to view changes
-- Explicit COMMIT occurs by COMMIT
-- Implicit COMMIT occurs by: Create, alter, drop, grant, revoke, ....

-- slide 25: ROLLBACK command
-- used to undo changes that have not been commited

-- slide 26: Create a copy table
CREATE TABLE book2 
AS SELECT * FROM books;

DROP TABLE book2;

-- slide 27: SAVEPOINT
SAVEPOINT prices;

UPDATE book2 
SET retail = 10 
WHERE title LIKE 'HANDCRANK%';

UPDATE book2 
SET retail = 49.95 
WHERE title LIKE 'PAINLESS%';

SAVEPOINT category;

UPDATE book2 
SET category = 'CHILDREN'
WHERE title LIKE 'PAINLESS%';

ROLLBACK TO category;
ROLLBACK TO prices;

-- slide 28: Managing Consistency
-- In order to maintain data consistency Oracle provides a series of locking mechanism
-- on individual rows and tables to prevent chaos and data corruption.

-- slide 31: Locking Demonstration

-- ADMIN
CONNECT sys as sysdba
SHOW USER
-- i don't know hehe
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
-- Create john1 user
CREATE USER john1
IDENTIFIED BY password
DEFAULT tablespace users;
GRANT RESOURCE, CONNECT, CREATE VIEW TO john1;
-- create sara1 user
CREATE USER sara1
IDENTIFIED BY password
DEFAULT tablespace users;
GRANT RESOURCE, CONNECT, CREATE VIEW TO sara1;

-- CPRRG250
CONNECT cprg250/password
SHOW USER
-- grant privileges to john and sara1
GRANT ALL PRIVILEGES ON book2 to john1;
GRANT ALL PRIVILEGES ON book2 to sara1;

-- JOHN1
SELECT title, retail 
FROM cprg250.book2 
WHERE category = 'COMPUTER' 
FOR UPDATE;

UPDATE cprg250.book2 
SET retail = retail * 1.3 
WHERE category = 'COMPUTER';

-- SARA1
SELECT title, retail
FROM cprg250.book2
WHERE category = 'COMPUTER';
































