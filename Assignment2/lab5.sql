/* Name: Nam Khanh Nguyen
*  Student ID: 000836881
*  Subject: CPRG 250
*  Lab: Assignment 2
*  Questions: 1 to 5
*/

set echo on; 
set linesize 132;
set pagesize 66;
spool c:\Coding\Database\Assignment2\spool5.txt

-- Question 1
COLUMN "Full Name" FORMAT A30;

SELECT first_name || ' ' || middle_name || ' ' || surname "Full name", 
balance, 
CASE WHEN balance = 0 THEN 'Zero balance'
	 WHEN balance >= 1 AND balance <= 1000 THEN 'Low Balance' || ' in ' || account_description
	 WHEN balance >= 1001 AND balance <= 5000 THEN 'Intermediate Balance' || ' in ' || account_description
	 WHEN balance >= 5000 THEN 'High Balance' || ' in ' || account_description
	 END "Balance Level"
FROM wgb_customer NATURAL JOIN wgb_account 
NATURAL JOIN wgb_account_type
ORDER BY first_name, middle_name, surname ASC, balance DESC;

CLEAR COLUMN;

-- Question 2
COLUMN account_type FORMAT 9 HEADING 'Acct|Type';
COLUMN balance FORMAT $99,999.00 HEADING 'Largest|Balance';

SELECT first_name "First",
surname "Last",
'(403) ' || '' || TO_CHAR(phone, '999,99,99') "Phone number",
customer_number "Acct #", 
account_type, 
balance 
FROM wgb_customer NATURAL JOIN wgb_account
NATURAL JOIN wgb_account_type
WHERE (account_type, balance) IN (SELECT account_type, 
								  MAX(balance) 
								  FROM wgb_account NATURAL JOIN wgb_account_type 
								  GROUP BY account_type)
ORDER BY account_type, first_name, surname;

CLEAR COLUMN;

-- Question 3
COLUMN account_type FORMAT 9 HEADING 'Acct|Type';
COLUMN balance FORMAT $99,999.00 HEADING 'Largest|Balance';

SELECT c.first_name "First",
c.surname "Last",
'(403) ' || '' || TO_CHAR(c.phone, '999,99,99') "Phone number",
c.customer_number "Acct #", 
a.account_type, 
a.balance 
FROM wgb_customer c, wgb_account a, wgb_account_type t
WHERE c.customer_number = a.customer_number
AND a.account_type = t.account_type
AND a.balance =  (SELECT MAX(balance) 
				  FROM wgb_account a2
				  WHERE a2.account_type = t.account_type)
ORDER BY a.account_type;

CLEAR COLUMN;

-- Question 4
COLUMN "Full name" FORMAT A20;
COLUMN "Full address" FORMAT A30;

SELECT UPPER(c.surname) || ', ' || c.first_name "Full name",
       c.address1 || ', ' || UPPER(c.city) || ', ' || c.province "Full address",
	   TO_CHAR(c.date_entered, 'MON/YY') "Date entered",
	   s.active "# of accounts",
	   ROWNUM "Position"
FROM wgb_customer c JOIN (SELECT customer_number, COUNT(*) active
						FROM wgb_transaction
						GROUP BY customer_number) s USING (customer_number)
ORDER BY s.active DESC
FETCH FIRST 2 ROWS ONLY; 

CLEAR COLUMN;

-- Question 5
COLUMN transaction_date FORMAT A12 HEADING 'Trans. date';
COLUMN "Total" FORMAT $9,999.00;

SELECT first_name "First name",
       surname "Last name",
	   transaction_date,
	   TO_CHAR(transaction_amount, '9,999.99') "Transaction amount",
	   SUM(transaction_amount) "Total"
FROM wgb_customer NATURAL JOIN wgb_transaction
WHERE address2 IS NULL
GROUP BY ROLLUP ((first_name, surname), transaction_date, transaction_amount)
ORDER BY first_name, transaction_date, transaction_amount;

CLEAR COLUMN;

-- Upload
spool off