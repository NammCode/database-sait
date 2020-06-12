/* Name: Nam Khanh Nguyen
*  Student ID: 000836881
*  Subject: CPRG 250
*  Lab: Assignment 1
*/

set echo on 
set linesize 132
set pagesize 66
spool c:\Coding\Database\Assignment1\spool.txt

-- Question 1
column "Address" format A20
SELECT customer_number "Cust #", 
account_type "Account Type", 
date_created "Date",
REPLACE(address1, 'Apt', 'Apartment') "Address"
FROM wgb_account NATURAL JOIN wgb_customer
WHERE date_created LIKE '%JUL%'
ORDER BY 1;

-- Question 2
SELECT INITCAP(first_name) "First", 
INITCAP(surname) "Last", 
phone, 
a.customer_number "Cust #", 
a.account_type "Type", 
balance "$" 
FROM wgb_customer c, wgb_account a, wgb_account_type t
WHERE c.customer_number = a.customer_number
AND a.account_type = t.account_type
AND t.account_description LIKE '%Chequing%'
ORDER BY 2, 1, 4, 5;

-- Question 3
SELECT INITCAP(first_name) "First", 
INITCAP(surname) "Last", 
phone, 
a.customer_number "Cust #", 
a.account_type "Type", 
balance "$" 
FROM wgb_customer c JOIN wgb_account a ON(c.customer_number = a.customer_number)
JOIN wgb_account_type t ON (a.account_type = t.account_type)
WHERE t.account_description LIKE '%Daily Interest Savings%'
ORDER BY 2, 1, 4, 5;

-- Question 4
SELECT INITCAP (first_name) "Name", INITCAP(account_description) "Description" , balance , transaction_date "Date" , LPAD(transaction_amount,9,'*') "Amount"
FROM wgb_transaction t, wgb_account_type a, wgb_customer c, wgb_account b
WHERE t.account_type = a.account_type
AND t.customer_number = c.customer_number
AND t.customer_number = b.customer_number
AND a.account_type = b.account_type
AND a.account_description LIKE '%Interest%'
ORDER BY 1 DESC, 4 ASC;

-- Question 5
column "Date" format A20
SELECT INITCAP(first_name) "First", 
INITCAP(surname) "Last", 
customer_number "Cust #", 
TO_CHAR(date_created, 'DD/MON/YY') "Date",
account_type "Type"
FROM wgb_customer c JOIN wgb_account a USING(customer_number)
JOIN wgb_account_type t USING (account_type)
ORDER BY 2, 1, 4, 5;

-- Question 6 
SELECT INITCAP(first_name) "First", 
INITCAP(surname) "Last", 
a.customer_number "Cust #", 
CASE a.account_type WHEN 1 THEN 'Chq'
					WHEN 2 THEN 'Daily Sav'
					WHEN 3 THEN 'Mthly Sav'
					WHEN 4 THEN 'RRSP'
					WHEN 5 THEN 'GIC'
					ELSE '' END "Type", 
TO_CHAR(balance, '$99,990.00') "Opening Bal" 
FROM wgb_customer c, wgb_account a, wgb_account_type t
WHERE c.customer_number = a.customer_number
AND a.account_type = t.account_type
ORDER BY 1 ASC, 4 DESC;

-- Upload
spool off