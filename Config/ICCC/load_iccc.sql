/*	This file is used to add data to the course enrollment data
	base for the Ivy Covered Community College (ICCC).

	Date created  : 94-12-04
	Date Modified : 95-07-21
			98-10-07	
                        2000-02-01    */
delete from COURSE_REGISTRATION;
delete from STUDENT;
delete from CLASS_SECTION;
delete from EXPERTISE;
delete from COURSE;
delete from FACULTY;
delete from ORGANIZATIONAL_UNIT;


insert into COURSE values (
'ACCT210', 'Introductory Accounting', 64, 4, null);

insert into COURSE values (
'ACCT240', 'Intermediate Accounting', 80, 5, 'ACCT210');

insert into COURSE values (
'MATH215', 'Calculus I', 80, 5, null);

insert into COURSE values (
'MATH235', 'Calculus II', 80, 5, 'MATH215');

insert into COURSE values (
'CMPP201', 'Introductory Programming', 160, 8, null);

insert into COURSE values (
'COMP202', 'Computer Fundamentals', 80, 5, null);

insert into COURSE values (
'CMPP230', 'Introduction to Fourth Generation Languages', 80, 5, 
		'CMPP201');

insert into COURSE values (
'CSYS325', 'Object Oriented Analysis', 64, 5, 'CMPP230');

insert into COURSE values (
'CSYS300', 'Information Systems I', 128, 8, 'CMPP230');

insert into COURSE values (
'CSYS350', 'Information Systems II', 176, 10, 'CSYS300');

insert into COURSE values (
'CSYS302', 'Technical Systems I', 128, 8, 'CMPP230');

insert into COURSE values (
'CSYS352', 'Technical Systems II', 176, 10, 'CSYS302');

insert into COURSE values (
'ENGL201', 'English Literature', 80, 5, null);

insert into COURSE values (
'ENGL240', 'English Composition', 80, 5, 'ENGL201');

insert into COURSE values (
'PHYS211', 'Heat and Thermodynamics', 64, 5, 'MATH235');

commit;

insert into ORGANIZATIONAL_UNIT values (
'Faculty', 'Faculty of Science', 100, '000012357', null);

insert into ORGANIZATIONAL_UNIT values (
'Department', 'Mathematics', 110, '002300137', 100);

insert into ORGANIZATIONAL_UNIT values (
'Department', 'Physics', 120, '000000001', 100);

insert into ORGANIZATIONAL_UNIT values (
'Department', 'Chemistry', 130, '000000002', 100);

insert into ORGANIZATIONAL_UNIT values (
'Department', 'Computing Science', 140, '000012345', 100);

insert into ORGANIZATIONAL_UNIT values (
'Section', 'Finite Mathematics', 111, '000018012', 110);

insert into ORGANIZATIONAL_UNIT values (
'Section', 'Calculus', 112, '000296257', 110);

insert into ORGANIZATIONAL_UNIT values (
'Section', 'Statistics', 113, '000000004', 110);

insert into ORGANIZATIONAL_UNIT values (
'Section', 'Programming', 141, '000130006', 140);

insert into ORGANIZATIONAL_UNIT values (
'Section', 'Systems', 142, '000000005', 140);

insert into ORGANIZATIONAL_UNIT values (
'Section', 'Fundamentals and Literacy', 143, '000000006', 140);

insert into ORGANIZATIONAL_UNIT values (
'Faculty', 'Faculty of Arts', 200, '000000010', null);

insert into ORGANIZATIONAL_UNIT values (
'Department', 'English', 210, '000220159', 200);

insert into ORGANIZATIONAL_UNIT values (
'Faculty', 'Faculty of Business', 300, '000000011', null);

insert into ORGANIZATIONAL_UNIT values (
'Department', 'Accounting', 310, '002300123', 300);

commit;

insert into FACULTY values (
'000000001', 'Curie', 'Marie', 
TO_DATE ('1-Jul-1980', 'dd-Mon-YYYY'), 
TO_DATE ('1-sep-2008', 'dd-Mon-YYYY'),
	49000, 100);

insert into FACULTY values (
'000000002', 'Sienko', 'Michael', 
TO_DATE ('4-may-1975','dd-Mon-YYYY'), 
TO_DATE ('3-Aug-2006','dd-Mon-YYYY'),
	49500, 100);

insert into FACULTY values (
'000000003', 'Plane', 'Robert', 
TO_DATE ('8-Sep-1969', 'dd-Mon-YYYY'),
TO_DATE ('1-Aug-1997', 'dd-Mon-YYYY'),
	50000, 130);

insert into FACULTY values (
'000000004', 'Zuwaylif', 'Fadil', 
TO_DATE ('14-Feb-1966', 'dd-Mon-YYYY'),
TO_DATE ('15-Aug-2001','dd-Mon-YYYY'),
	49200, 110);

insert into FACULTY values (
'001132027', 'Hilbert', 'Harry', 
TO_DATE ('8-sep-1990', 'dd-Mon-YYYY'),
TO_DATE ('1-sep-2014','dd-Mon-YYYY'),
         47200, 110);

insert into FACULTY values (
'001132028', 'Rodrigues', 'Carlos', 
TO_DATE ('31-mar-1988','dd-Mon-YYYY'), 
TO_DATE ('1-jul-2013','dd-Mon-YYYY'),
         45000, 110);

insert into FACULTY values (
'001132029', 'James', 'Julie', 
TO_DATE ('17-mar-1970','dd-Mon-YYYY'), 
TO_DATE ('1-aug-2012','dd-Mon-YYYY'),
         45500, 120);

insert into FACULTY values (
'000000005', 'MacLeod', 'Edward', 
TO_DATE ('1-Jan-1980', 'dd-Mon-YYYY'),
TO_DATE ('5-Jul-2004','dd-Mon-YYYY'),
	49700, 140);

insert into FACULTY values (
'000000006', 'Fences', 'William', 
TO_DATE ('6-Apr-1988', 'dd-Mon-YYYY'),
TO_DATE ('6-Jul-2005','dd-Mon-YYYY'),
	50000, 140);

insert into FACULTY values (
'000000010', 'Jonas', 'Georgette', 
TO_DATE ('12-Nov-1965', 'dd-Mon-YYYY'),
TO_DATE ('17-Aug-1990','dd-Mon-YYYY'),
	52000, null);

insert into FACULTY values (
'000000011', 'James', 'Clifford', 
TO_DATE ('8-Sep-1969', 'dd-Mon-YYYY'),
TO_DATE ('1-Jun-1998','dd-Mon-YYYY'),
	52000, null);


insert into FACULTY values (
'000012345', 'Ullman', 'Joseph', 
TO_DATE ('3-dec-1980', 'dd-Mon-YYYY'),
TO_DATE ('1-sep-2001', 'dd-Mon-YYYY'),
	47000,100);

insert into FACULTY values (
'000012000', 'Taylor', 'Ted', 
TO_DATE ('31-dec-1990','dd-Mon-YYYY'), 
TO_DATE ('1-sep-2014', 'dd-Mon-YYYY'),30000,
	100);

insert into FACULTY values (
'000012346', 'Lee', 'Peter', 
TO_DATE ('23-apr-1992', 'dd-Mon-YYYY'),
TO_DATE ('30-aug-2015','dd-Mon-YYYY'), 41500,
	141);

insert into FACULTY values (
'000012357', 'Hopper', 'Grace', 
TO_DATE ('7-feb-1974', 'dd-Mon-YYYY'),
TO_DATE ('31-jul-1998', 'dd-Mon-YYYY'),47000,
	null);

insert into FACULTY values (
'000030002', 'Minsky', 'Marvin', 
TO_DATE ('9-mar-1982', 'dd-Mon-YYYY'),
TO_DATE ('15-aug-2010','dd-Mon-YYYY'), 42000,
	310);

insert into FACULTY values (
'000130006', 'Faure', 'Penelope', 
TO_DATE ('31-mar-1990', 'dd-Mon-YYYY'),
TO_DATE ('10-aug-2014', 'dd-Mon-YYYY'),47500,
	140);

insert into FACULTY values (
'000220159', 'Winch', 'Graham', 
TO_DATE ('16-aug-1992', 'dd-Mon-YYYY'),
TO_DATE ('1-apr-2015','dd-Mon-YYYY'), 39000,
	200);

insert into FACULTY values (
'000012065', 'Boyce', 'Elaine', 
TO_DATE ('24-jan-1973','dd-Mon-YYYY'), 
TO_DATE ('1-sep-1998','dd-Mon-YYYY'), 43200,
	143);

insert into FACULTY values (
'002300123', 'Lee', 'Douglas', 
TO_DATE ('30-may-1961', 'dd-Mon-YYYY'),
TO_DATE ('1-sep-1993','dd-Mon-YYYY'), 48000,
	300);

insert into FACULTY values (
'002300137', 'Reid', 'David', 
TO_DATE ('3-sep-1979','dd-Mon-YYYY'),
TO_DATE ('28-aug-2005','dd-Mon-YYYY'), 46900,
	100);

insert into FACULTY values (
'000018012', 'Sparks', 'Christopher', 
TO_DATE ('7-dec-1971', 'dd-Mon-YYYY'),
TO_DATE ('15-aug-2000','dd-Mon-YYYY'), 46000,
	110);

insert into FACULTY values (
'000296257', 'Longley', 'Marcia', 
TO_DATE ('1-jun-1990', 'dd-Mon-YYYY'),
TO_DATE ('3-aug-2013', 'dd-Mon-YYYY'),46500,
	110);

commit;

insert into CLASS_SECTION values (
'ACCT210', '1FB', '1', '2014', '000030002', 35, 0);

insert into CLASS_SECTION values (
'ACCT210', '1FC', '1', '2014', '002300123', 35, 0);

insert into CLASS_SECTION values (
'ACCT210', '1WA', '2', '2014', '000030002', 40, 0);

insert into CLASS_SECTION values (
'ACCT210', '1WB', '2', '2014', '000030002', 35, 0);

insert into CLASS_SECTION values (
'MATH215', '1FB', '1', '2014', '002300137', 30, 0);

insert into CLASS_SECTION values (
'MATH215', '1FC', '1', '2014', '000018012', 25, 0);

insert into CLASS_SECTION values (
'MATH215', '1FB', '1', '2013', '002300137', 28, 0);

insert into CLASS_SECTION values (
'MATH215', '1WA', '2', '2014', '000296257', 35, 0);

insert into CLASS_SECTION values (
'MATH215', '1WB', '2', '2014', '000018012', 30, 0);

insert into CLASS_SECTION values (
'MATH235', '1FC', '2', '2014', '000296257', 35, 0);

insert into CLASS_SECTION values (
'CMPP230', '1FC', '1', '2014', '000130006', 40, 0);

insert into CLASS_SECTION values (
'CMPP230', '1FB', '1', '2014', '000130006', 40, 0);

insert into CLASS_SECTION values (
'CSYS325', '2FB', '2', '2014', '000012345', 10, 0);

insert into CLASS_SECTION values (
'CMPP201', '1FC', '1', '2014', '000012346', 40, 0);

insert into CLASS_SECTION values (
'PHYS211', '1FB', '2', '2013', '000000001', 20, 0);

insert into CLASS_SECTION values (
'ENGL201', '1WA', '1', '2014', '000220159', 30, 0);

insert into CLASS_SECTION values (
'MATH235', '1FA', '2', '2013', '000018012', 20, 0);

insert into CLASS_SECTION values (
'CMPP201', '1FA', '2', '2013', '000012346', 35, 0);

insert into CLASS_SECTION values (
'COMP202', '1FA', '2', '2013', '000000006', 35, 0);

insert into CLASS_SECTION values (
'MATH235', '1FA', '2', '2014', '002300137', 30, 0);

insert into CLASS_SECTION values (
'MATH235', '1FA', '1', '2014', '002300137', 30, 0);

commit;


insert into STUDENT values (
'000612345', 'Adler', 'Philip', TO_DATE('28-feb-1980','DD-Mon-YYYY'), 'M',
	'Computer Technology');

insert into STUDENT values (
'000600189', 'Jenkins', 'Dorothy', TO_DATE('16-Aug-1992','DD-Mon-YYYY'), 'F', 
	'Power Engineering');

insert into STUDENT values (
'000600201', 'Caine', 'John',	TO_DATE('31-Mar-1995', 'DD-Mon-YYYY'),'M',
	'Computer Technology');

insert into STUDENT values (
'000600352', 'Lorieaux', 'Marie',TO_DATE('01-May-1996','DD-Mon-YYYY'), 'F',
	'Petroleum Engineering');

insert into STUDENT values (
'000509082', 'Hagenson', 'Nels', TO_DATE('30-May-1988','DD-Mon-YYYY'), 'M',
	'Petroleum Engineering');

insert into STUDENT values (
'000710000', 'Wells', 'George', TO_DATE('25-Dec-1990', 'DD-Mon-YYYY'),'M',
	'Computer Technology');

insert into STUDENT values (
'000427358', 'Wells', 'Georgette',TO_DATE('09-Mar-1994', 'DD-Mon-YYYY'),'F',
	'Computer Technology');

insert into STUDENT values (
'000811111', 'Ng', 'Ruth', 	TO_DATE('03-Jul-1997', 'DD-Mon-YYYY'),'F',
	'Business Administration');

insert into STUDENT values (
'001500026', 'Durbin', 'Deanna',TO_DATE('06-Jun-1991', 'DD-Mon-YYYY'),'F',
	'Business Administration');

insert into STUDENT values (
'002502060', 'Bryce', 'Robert',	TO_DATE('20-Sep-1987', 'DD-Mon-YYYY'),'M',
	'Business Administration');

commit;


insert into COURSE_REGISTRATION values (
'000612345', 'CMPP230', '1FC', '1', '2014', 82);

insert into COURSE_REGISTRATION values (
'000811111', 'CMPP230', '1FC', '1', '2014', 66);

insert into COURSE_REGISTRATION values (
'002502060', 'CMPP230', '1FC', '1', '2014', 66);

insert into COURSE_REGISTRATION values (
'000600189', 'PHYS211', '1FB', '2', '2013', 80);

insert into COURSE_REGISTRATION values (
'000600189', 'MATH235', '1FC', '2', '2014', '');

insert into COURSE_REGISTRATION values (
'000612345', 'CSYS325', '2FB', '2', '2014', '');

insert into COURSE_REGISTRATION values (
'000509082', 'PHYS211', '1FB', '2', '2013', 58);

insert into COURSE_REGISTRATION values (
'000811111', 'ACCT210', '1FC', '1', '2014', 93);

insert into COURSE_REGISTRATION values (
'000509082', 'MATH215', '1FB', '1', '2013', 49);

insert into COURSE_REGISTRATION values (
'000509082', 'MATH215', '1FB', '1', '2014', 45);

insert into COURSE_REGISTRATION values (
'001500026', 'ACCT210', '1FB', '1', '2014', 65);

insert into COURSE_REGISTRATION values (
'001500026', 'CMPP201', '1FC', '1', '2014', 66);

insert into COURSE_REGISTRATION values (
'001500026', 'CMPP230', '1FC', '1', '2014', 78);

insert into COURSE_REGISTRATION values (
'002502060', 'ENGL201', '1WA', '1', '2014', 41);

insert into COURSE_REGISTRATION values (
'002502060', 'ACCT210', '1FC', '1', '2014', 66);

insert into COURSE_REGISTRATION values (
'000427358', 'CMPP230', '1FC', '1', '2014', 69);

insert into COURSE_REGISTRATION values (
'000600352', 'MATH235', '1FC', '2', '2014', '');

insert into COURSE_REGISTRATION values (
'000600352', 'ENGL201', '1WA', '1', '2014', 87);
 
insert into COURSE_REGISTRATION values (
'000600352', 'PHYS211', '1FB', '2', '2013', 89);

insert into COURSE_REGISTRATION values (
'000612345', 'MATH215', '1FB', '1', '2014', 68);

insert into COURSE_REGISTRATION values (
'000612345', 'PHYS211', '1FB', '2', '2013', 71);

insert into COURSE_REGISTRATION values (
'000811111', 'CMPP201', '1FC', '1', '2014', 78);

insert into COURSE_REGISTRATION values (
'000427358', 'CMPP201', '1FC', '1', '2014', 63);

insert into COURSE_REGISTRATION values (
'000427358', 'MATH215', '1FB', '1', '2013', 82);

insert into COURSE_REGISTRATION values (
'000427358', 'MATH235', '1FA', 2, '2013', 71);

insert into COURSE_REGISTRATION values (
'000427358', 'PHYS211', '1FB', '2', '2013', 65);

insert into COURSE_REGISTRATION values (
'000427358', 'COMP202', '1FA', '2', '2013', 92);

insert into COURSE_REGISTRATION values (
'002502060', 'MATH235', '1FC', '2', '2014',42);

insert into COURSE_REGISTRATION values (
'000612345', 'MATH235', '1FA', '2', '2013', 40);

insert into COURSE_REGISTRATION values (
'000612345', 'MATH235', '1FC', '2', '2014', 35);

insert into COURSE_REGISTRATION values (
'000612345', 'MATH235', '1FA', '1', '2014', 40);

insert into COURSE_REGISTRATION values (
'001500026', 'PHYS211', '1FB', '2', '2013', 48);

insert into COURSE_REGISTRATION values (
'001500026', 'MATH215', '1FB', '1', '2013', 32);

insert into COURSE_REGISTRATION values (
'001500026', 'MATH215', '1FB', '1', '2014', 38);

insert into COURSE_REGISTRATION values (
'000811111', 'MATH235', '1FA', '2', '2013', 41);

insert into COURSE_REGISTRATION values (
'000811111', 'MATH235', '1FA', '2', '2014', 45);

commit;

insert into EXPERTISE values (
'000030002', 'ACCT210', 9);

insert into EXPERTISE values (
'002300123', 'ACCT210', 7);

insert into EXPERTISE values (
'000018012', 'MATH215', 8);

insert into EXPERTISE values (
'000018012', 'MATH235', 8);

insert into EXPERTISE values (
'000018012', 'PHYS211', 7);

insert into EXPERTISE values (
'000018012', 'ENGL201', 6);

insert into EXPERTISE values (
'002300137', 'MATH235', 7);

insert into EXPERTISE values (
'002300137', 'MATH215', 7);

insert into EXPERTISE values (
'000296257', 'MATH215', 7);

insert into EXPERTISE values (
'000296257', 'MATH235', 8);

insert into EXPERTISE values (
'000296257', 'PHYS211', 7);

insert into EXPERTISE values (
'000130006', 'CMPP230', 7);

insert into EXPERTISE values (
'000012345', 'CSYS325', 8);

insert into EXPERTISE values (
'000012346', 'CMPP201', 8);

insert into EXPERTISE values (
'000030002', 'ENGL201', 5);

insert into EXPERTISE values (
'000000001', 'PHYS211', 10);

insert into EXPERTISE values (
'000000011', 'ACCT240', 3);

insert into EXPERTISE values (
'000000011', 'ACCT210', 2);

insert into EXPERTISE values (
'000000006', 'COMP202', 10);

insert into EXPERTISE values (
'000130006', 'CSYS325', 7);

insert into EXPERTISE values (
'000130006', 'CSYS300', 8);

insert into EXPERTISE values (
'000130006', 'CSYS350', 7);

insert into EXPERTISE values (
'000130006', 'CSYS302', 8);

insert into EXPERTISE values (
'000000005', 'CSYS300', 3);


commit;

update CLASS_SECTION A
set ENROLMENT = (select count(*) 
		  from COURSE_REGISTRATION
		  where COURSE_CODE = A.COURSE_CODE and
			SECTION = A.SECTION_CODE and
			SEMESTER = A.SEMESTER and
			YEAR = A.YEAR);

commit;


