/* Name: Nam Khanh Nguyen
*  Student ID: 000836881
*  Subject: CPRG 250
*  Lab: Assignment 1
*/

set echo on 
set linesize 132
set pagesize 66
spool c:\Coding\Database\Module4\Ass1\spool.txt

-- Question 1
SELECT customer_number "Cust #" , account_type "Account Type" , date_created "Date" , REPLACE(Address1, 'Apt' , 'Apartment') "Address" 
FROM wgb_account NATURAL JOIN wgb_customer 
WHERE date_created LIKE '%JUL%' 
ORDER BY customer_number;

-- Question 2
SELECT INITCAP(first_name) "First" , INITCAP(surname) "Last" , phone "Phone" , a.customer_number "Cust#" , account_type "Type" , balance "$"  
FROM wgb_customer a , wgb_account b 
WHERE a.customer_number =b.customer_number 
AND  account_type = 1 
ORDER BY 2 , 1 , 4 , 5;


-- Question 3
SELECT INITCAP(first_name) "First" , INITCAP(surname) "Last" , phone "Phone" , a.customer_number "Cust#" , account_type "Type" , balance "$"  
FROM wgb_customer a JOIN wgb_account b ON(a.customer_number = b.customer_number) 
WHERE account_type = 2
ORDER BY 2 , 1 , 4 , 5;

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
SELECT first_name "First" , surname "Last" , customer_number "Cust #" , REPLACE(date_created , 'DD-MM-YY' , 'DD/MM/YY') "Date" , account_type "Type" 
FROM wgb_account JOIN wgb_customer USING(customer_number) 
ORDER BY 2 , 1 , 4 , 5;


-- Question 6 
SELECT first_name as "First",surname as "Last",customer_number as "Cust #", 
CASE WHEN account_type = 1 THEN 'Chq' 
     WHEN account_type = 2 THEN 'Daily Sav' 
	 WHEN account_type = 3 THEN 'Mthly Sav' 
	 WHEN account_type = 4 THEN 'RRSP' 
	 ELSE 'GIC' END as "Type", TO_CHAR(balance, '$99,990.99')"Opening Bal" 
FROM wgb_account_type JOIN wgb_account USING (account_type) 
JOIN wgb_customer USING (customer_number) 
ORDER by 1,4 DESC;

-- Upload
spool off