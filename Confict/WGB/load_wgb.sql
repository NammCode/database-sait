/*  This file is used to initialize the Walnut Grove Bank database
    in preparation for testing PL/SQL procedures.  There should be
    no errors encountered in the running of this file.        */


-- balance in wgb_account will be the balance at the  of the month
-- balance is NOT the sum of the transactions anymore
delete from WGB_ASSETS;
delete from WGB_TRANSACTION;
delete from WGB_ACCOUNT;
delete from WGB_CUSTOMER;
DELETE FROM wgb_account_type;

-- you can set a start date and all dates in the database will be based around that date (+ or - a specified number of days in the inserts)
define START_DATE  = '01-jan-19'

set echo off
set verify off
-- insert account type data 
INSERT INTO wgb_account_type VALUES (1, 'Chequing');
INSERT INTO wgb_account_type VALUES (2, 'Daily Interest Savings');
INSERT INTO wgb_account_type VALUES (3, 'Monthly Minimum Balance Savings');
INSERT INTO wgb_account_type VALUES (4, 'RRSP''s');
INSERT INTO wgb_account_type VALUES (5, 'GIC''s');

COMMIT;

-- rem load data for John
insert into WGB_CUSTOMER values (1112401, 'Synge', 'John', 'L.', 'Apt 201', '279 Humber Rd', 'Harrison', 'AB', 'T9A4X4', 403, '5210001', '04-Jan-19');

-- rem chequing account

insert into WGB_ACCOUNT values ('1112401', 1, '04-Jan-19', 6433.50);

insert into WGB_TRANSACTION values (1,'1112401', 1, 159.27, 'D', '01-Jan-19');

insert into WGB_TRANSACTION values (2,'1112401', 1, 425.76, 'D', TO_DATE('&&START_DATE')+1);

insert into WGB_TRANSACTION values (3,'1112401', 1, 226, 'D', TO_DATE('&&START_DATE')+1);

insert into WGB_TRANSACTION values (4,'1112401', 1, 40.00, 'C', TO_DATE('&&START_DATE')+5);

insert into WGB_TRANSACTION values (5,'1112401', 1, 1895, 'C', TO_DATE('&&START_DATE')+14);


-- rem daily interest savings account
-- rem create account 1/2 year before start date
insert into WGB_ACCOUNT values ('1112401', 2, TO_DATE('&&START_DATE')-180, 2999.76);

insert into WGB_TRANSACTION values (6,'1112401', 2, 60, 'C',  TO_DATE('&&START_DATE')+1);

insert into WGB_TRANSACTION values (7,'1112401', 2, 73, 'C', TO_DATE('&&START_DATE')+5);

insert into WGB_TRANSACTION values (8,'1112401', 2, 12.17, 'D', TO_DATE('&&START_DATE')+6);

insert into WGB_TRANSACTION values (9,'1112401', 2, 0.22, 'C', TO_DATE('&&START_DATE')+30);

--rem data from Allen
-- create account 1 year before start date
insert into WGB_CUSTOMER values (1113004,  'Griffith', 'Byron', 'Allen', '7 Back street', null,  'Walnut Grove', 'AB', 'T8B5A6', 403, '6332112', TO_DATE('&&START_DATE')-365);

-- rem open account a couple days after the customer info is input

insert into WGB_ACCOUNT (CUSTOMER_NUMBER, ACCOUNT_TYPE, DATE_CREATED, balance) values ('1113004', 3, TO_DATE('&&START_DATE')-364, 10000);

-- rem monthly CPP cheque, near end of month
insert into WGB_TRANSACTION values (10,'1112401', 2, 1065.00, 'C', TO_DATE('&&START_DATE')+30);
-- rem monthly pension
insert into WGB_TRANSACTION values (11,'1112401', 2, 565.00, 'C', TO_DATE('&&START_DATE')+30);

-- rem data from Henri
insert into WGB_CUSTOMER values (
  '1113501', 'Poincare', 'Henri', 'Dumont', 'Box 5', null, 
  'Eyebrow', 'SK', 'S7K7Y8', 306, '7274036', '01-sep-16');

-- rem chequing
insert into WGB_ACCOUNT values ('1113501', 1, '05-Sep-16', 565.23);

insert into WGB_TRANSACTION values (12,'1113501', 1, 1100.00, 'D', TO_DATE('&&START_DATE')+1);
insert into WGB_TRANSACTION values (13,'1113501', 1, 115.00, 'D', TO_DATE('&&START_DATE')+10);
-- mid month cheque
insert into WGB_TRANSACTION values (14,'1113501', 1, 2000.00, 'C', TO_DATE('&&START_DATE')+14);
insert into WGB_TRANSACTION values (18,'1113501', 1, 40.00, 'D', TO_DATE('&&START_DATE')+14);

insert into WGB_TRANSACTION values (15,'1113501', 1, 135.28, 'D', TO_DATE('&&START_DATE')+21);
insert into WGB_TRANSACTION values (16,'1113501', 1, 1439.55, 'D', TO_DATE('&&START_DATE')+27);
-- monthly cheque
insert into WGB_TRANSACTION values (17,'1113501', 1, 135.28, 'C', TO_DATE('&&START_DATE')+28);


-- rem account create 1 year before start date
-- rem savings
insert into WGB_ACCOUNT values ('1113501', 2, TO_DATE('&&START_DATE')-365, 200);
-- rem tries to save $40/month, this has a matching debit in the chequing account
insert into WGB_TRANSACTION values (19,'1113501', 2, 40.00, 'C', TO_DATE('&&START_DATE')+14);

-- rem RRSP account opened 1/2 year before start date
insert into WGB_ACCOUNT (CUSTOMER_NUMBER, ACCOUNT_TYPE,	 DATE_CREATED, balance)	values ('1113501', 4, TO_DATE('&&START_DATE')-182, 2000);
-- rem RRSP contribution this month
insert into WGB_TRANSACTION values (20,'1113501', 4, 120.00, 'C', TO_DATE('&&START_DATE')+14);


-- rem data for Peter 
-- rem Peter's chequing account is dorment (no transactions, 0 balance)
-- rem account open 2 years before start date
insert into WGB_CUSTOMER values (
  '2566217', 'Chen', 'Peter', 'C.', '19 Redstone Path', null, 
  'Rosebud', 'AB', 'T6B0L1', 403, '6520128', TO_DATE('&&START_DATE')-(365*2));

insert into WGB_ACCOUNT values ('2566217', 1, TO_DATE('&&START_DATE')-(365*2), 0);

insert into WGB_ACCOUNT values ('2566217', 4, TO_DATE('&&START_DATE')-(365*2), 700);
-- rem opened a GIC account last year, add 1000 GIC now
insert into WGB_ACCOUNT values ('2566217', 5, TO_DATE('&&START_DATE')-365, 5000);
insert into WGB_TRANSACTION values (25,'2566217', 5, 1000.00, 'C', TO_DATE('&&START_DATE')+1);
-- deposit money to RRSP ever week he gets paid
insert into WGB_TRANSACTION values (21,'2566217', 4, 60.00, 'C', TO_DATE('&&START_DATE')+1);
insert into WGB_TRANSACTION values (22,'2566217', 4, 60.00, 'C', TO_DATE('&&START_DATE')+8);
insert into WGB_TRANSACTION values (23,'2566217', 4, 60.00, 'C', TO_DATE('&&START_DATE')+15);
insert into WGB_TRANSACTION values (24,'2566217', 4, 60.00, 'C', TO_DATE('&&START_DATE')+22);

-- rem data from Patricia
-- rem just created her account and deposited some money but no transactions yet
insert into WGB_CUSTOMER values (
  '9871332', 'Lee', 'Patricia', null, '6 Front Street', null, 
  'Walnut Grove', 'AB', 'T8B5A8', 403, '6332112', TO_DATE('&&START_DATE'));
insert into WGB_ACCOUNT values ('9871332', 1, TO_DATE('&&START_DATE'), 500);


commit;
insert into WGB_ASSETS (amount) values ( 0);

update WGB_ASSETS
set AMOUNT = (
	select sum (BALANCE) from WGB_ACCOUNT);

select * from WGB_ASSETS;

set echo off

column surname format a20
column first_name format a20
set linesize 65

set heading off
select 'Customers' from dual;
set heading on

select customer_number, surname, first_name, date_entered
from wgb_customer
order by customer_number;

set heading off
select 'Accounts' from dual;
set heading on
select * from wgb_account
order by customer_number, account_type;

set heading off
set linesize 100
select 'Transactions' from dual;
set heading on

select * from wgb_transaction
order by customer_number, account_type;


clear columns






