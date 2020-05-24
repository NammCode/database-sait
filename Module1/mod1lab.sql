rem lab0test.sql
set echo on
set verify on
set pagesize 66
set linesize 100
spool c:\cprg250\module1\lab0output.txt
rem Just Lee Database

rem show customers and books they have ordered
select firstname, lastname, title
from customers natural join orders
   natural join orderitems 
   natural join books
order by 2,1,3;
rem 
rem ICCC database
rem list of courses and instructors capable of teaching each course
select course_title, firstname, surname
from course join expertise using (course_code)
    join faculty using (employee_id)
order by 1,3,2;

rem 
rem WGB database
rem show customers and their transactions
select first_name, surname, account_type, transaction_type "Type", transaction_amount "Amount"
from wgb_customer join wgb_account using (customer_number)
 join wgb_transaction using (customer_number, account_type)
 order by 2,1,3;
spool off