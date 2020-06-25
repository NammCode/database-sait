--build databases
@c:\cprg250\module6\JLDB_Build_5.sql

--settings for output
set echo on;
set linesize 132;
set pagesize 66;

--slide 9
INSERT INTO acctmanager 
   VALUES ('T500', 'Nick', 'Taylor', '10-JAN-19', 47000.00, 0, 'NE');
   
--slide 10
INSERT INTO acctmanager (amfirst, amlast, amid, amedate, amsal,amcomm)
   VALUES ('Mandy', 'Lopez', 'L501', '01-OCT-18', 42000.00, 10000);
commit;
select * from acctmanager; 

--sldie 11
INSERT INTO acctmanager (amfirst, amlast, amid, amedate, amsal, amcomm)
   VALUES ('Harvey', 'Wallbanger', 'W503', SYSDATE, 50000.00, 5000);
COMMIT;

--slide 13
INSERT INTO acctmanager (amfirst, amlast, amid, amedate, region)
   VALUES ('Sara', 'Harris', 'H504', default, 'C');
   
INSERT INTO acctmanager (amfirst, amlast, amid, amedate, region)
   VALUES ('Sara', 'Harris', 'H504', default, 'SE');
COMMIT;

--slide 15
desc acctbonus
insert into acctbonus(amid,amsal,region)
select amid,amsal,region
from acctmanager
where region is not NULL;

--slide 19
select * from acctmanager;

update acctmanager
set amcomm=1500.00,region='SW'
where amfirst='Mandy' and amlast='Lopez';

--slide 20
select * from acctmanager;

update acctmanager
set amsal=amsal*1.04;

select * from acctmanager;
commit;

--slide 21
select * from acctbonus;

--subsequery
select amid
from acctmanager
where amfirst='Nick' and amlast='Taylor';

delete acctbonus
where amid =
(select amid
  from acctmanager
   where amfirst='Nick' and amlast='Taylor');
   
--slide 22
select * from acctmanager;
DELETE acctmanager;
select * from acctmanager;
ROLLBACK;
select * from acctmanager;

delete from acctmanager 
where amfirst='Sara' and amlast='Harris'; 

--slide 26
drop table book2;

CREATE TABLE book2 as
SELECT * FROM books;
   
SELECT * FROM book2;


--slide 27
savepoint prices;
select * from book2;
update book2
set retail=10
where title like 'HANDCRANK%';

update book2
set retail=49.95
where title like 'PAINLESS%';

select * from book2;
savepoint categories;
update book2
set category='SELF-HELP'
where title like 'PAINLESS%';
select * from book2;
rollback to categories;

--slide 34
alter session set "_ORACLE_SCRIPT"=true;
Rem create John account and allow to him to select/update/delete rows-- 
connect sys as sysdba
alter session set "_ORACLE_SCRIPT"=true;
CREATE USER john
      IDENTIFIED BY password
      DEFAULT TABLESPACE users;

GRANT RESOURCE, CONNECT, CREATE VIEW TO john;

Rem create sara account and allow to her to select/update/delete rows—
CREATE USER sara
      IDENTIFIED BY password
      DEFAULT TABLESPACE users;
 
GRANT RESOURCE, CONNECT, CREATE VIEW TO sara;

-- cprg250
connect cprg250/password
create table book2 as select * from books;

Grant All privileges on book2 to john;
Grant All privileges on book2 to sara;

-- John
connect john/password

Rem lock the rows by puting a shared lock on the rows where category = 'COMPUTER'
Select title, retail
From cprg250.book2
where category = 'COMPUTER'
for update;

Rem update the price
update cprg250.book2
set retail = retail * 1.30
where category = 'COMPUTER';

select title, retail
from cprg250.book2
where category = 'COMPUTER';

Rem notice there is a 30% increase in prices.

-- Sara
Rem show that Sara does NOT see the changes made by John yet
select title, retail
from cprg250.book2
where category = 'COMPUTER';

Rem Sara tries to increase the price of Bodybuilding by 10%
Rem she is allowed to do this as ONLY the computer books rows are locked.

update cprg250.book2
set retail = retail * 1.10
where title LIKE 'BODYBUILD%';

select title, retail from cprg250.book2;

Rem they are updated
Rem does John see these updates? 

--John
select title, retail from cprg250.book2;

Rem he does not see these changes

-- Sara 
Rem she tries to update the prices of ALL books including the computer books by 6%
update cprg250.book2
set retail = retail * 1.06;

Rem she is not able to do and stay running as the table is locked out until John commits his changes

--John
commit;

Rem stop and show --Sara view
Rem once John commits her command runs
Commit;
Rem what does her data look like? Her data include the 30% markup and
Rem her 6% overall price increase

Rem what does John''s view look like?
Rem John view only includes the 30% increase on computer books but NOT 
Rem the 6% increase UNTIL Sara commits that

Commit;

Rem now all have the same view of data

Rem Imagine this happens on million of rows and 1000’s of users 
Rem every second like airline reservation, ensure the data consistency 
Rem every moment or every second is very important. 


