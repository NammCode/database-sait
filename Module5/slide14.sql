-- ordertotal – part of select statement
-- custTotal – SQL*PLUS compute based on ovalue computed when customer# changes (break)
-- grandTotal – SQL*PLUS compute based on ovale computed when report ends (break on report)

set echo off
set verify off
set feedback off
set linesize 80
set pagesize 66

clear columns
clear breaks

TTITLE CENTER 'Customer Orders Report' SKIP 2
BTITLE OFF
BREAK ON customer# SKIP 1 ON report
COMPUTE SUM LABEL 'Cust Ttl' of ovalue on customer#
COMPUTE SUM LABEL 'Store Ttl' of ovalue on report
COLUMN ovalue FORMAT $9,990.00 HEADING 'Order|Value'

SELECT customer#, order#, sum(paideach*quantity) ovalue
FROM customers JOIN orders USING (customer#)
  JOIN orderitems USING (order#)
GROUP BY customer#, order#
order by 1,2;


