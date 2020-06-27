/* Name: Nam Khanh Nguyen
*  Student ID: 000836881
*  Subject: CPRG 250
*  Questions: 6
*/


spool c:\Coding\Database\Assignment2\spool6.txt

SET echo ON; 
SET linesize 110;
SET pagesize 50;

COLUMN "Name" FORMAT A20;
COLUMN "Cust#" FORMAT A15;
COLUMN "Account Desc" FORMAT A25;
COLUMN "Date" FORMAT A20;
COLUMN "Amount" FORMAT $99,999.00;

TTITLE CENTER 'Transaction Report' SKIP -
RIGHT 'Page: ' FORMAT 9 SQL.PNO SKIP 2
BTITLE CENTER 'For Internal Use Only'

BREAK ON "Name" SKIP 3 ON "Cust#" SKIP 2 ON "Account Desc" SKIP 1 ON report;

COMPUTE SUM LABEL 'Acct Ttl' of "Amount" on "Cust#";
COMPUTE SUM LABEL 'Cust Ttl' of "Amount" on "Name";
COMPUTE SUM LABEL 'Grand Total' of "Amount" on report;
COMPUTE MAX LABEL 'Ttl Transactions' of "Trans #" on report;

SELECT surname || ', ' || first_name "Name",
       customer_number || '-' || account_type "Cust#",
	   account_description "Account Desc",
	   TO_CHAR(transaction_date, 'MON/DD, YYYY') "Date",
	   transaction_number "Trans #",
	   CASE WHEN transaction_type = 'D' THEN 0 - transaction_amount
	        WHEN transaction_type = 'C' THEN transaction_amount
		    END  "Amount"
FROM wgb_customer NATURAL JOIN wgb_account
				  NATURAL JOIN wgb_account_type
				  NATURAL JOIN wgb_transaction
ORDER  BY 2, 3, 4;

CLEAR COLUMN;
CLEAR BREAK;

-- Upload
spool off