drop table class_section_updates;
drop table new_course_registrations;


create table class_section_updates
(TRANSACTION_TYPE                         VARCHAR2(1),
 COURSE_CODE                              VARCHAR2(9),
 SECTION_CODE                             VARCHAR2(3),
 SEMESTER                                 VARCHAR2(3),
 YEAR                                     VARCHAR2(4),
 INSTRUCTOR_ID                            VARCHAR2(9),
 CAPACITY                                 NUMBER(3),
 ENROLMENT                                NUMBER(3));

create table new_course_registrations
(STUDENT_ID                              VARCHAR2(9),
COURSE_CODE                              VARCHAR2(9),
SECTION                                  VARCHAR2(3),
SEMESTER                                 VARCHAR2(3),
YEAR                                     VARCHAR2(4),
GRADE                                    NUMBER(3));

insert into class_section_updates values
('I','ACCT210','1FB','1','2014','000030002','35',0);

insert into class_section_updates values
('I','ACCT260','1FC','1','2014','002300123','35',0);

insert into class_section_updates values
('I','ACCT210','1WA','2','2014','000030002','40',45);

insert into class_section_updates values
('D','ACCT210','1WC','2','2014','000030002','35',0);

insert into class_section_updates values
('X','ACCT210','1FB','1','2014','000030002','35',0);

insert into class_section_updates values
('D','MATH215','1FB','1','2014','002300137','30',0);

insert into class_section_updates values
('U','MATH215','1FC','1','2014','002300137',null,null);

insert into class_section_updates values
('U','MATH215','1FX','1','2013',null,'45',null);

insert into class_section_updates values
('U','MATH215','1WA','2','2014',null,null,10);

insert into class_section_updates values
('U','MATH215','1WB','2','2014','000296257','40',null);

insert into new_course_registrations values
('000600201','ENGL201','1WA','1','2014',70);

insert into new_course_registrations values
('000600201','MATH215','1FB','1','2014',80);

insert into new_course_registrations values
('000600201','ACCT210','1FC','1','2014',null);

insert into new_course_registrations values
('000600201','ACCT210','1WA','2','2014',null);

insert into new_course_registrations values
('000600201','CSYS325','2FB','2','2014',null);

insert into new_course_registrations values
('000600201','MATH235','1WA','2','2014',null);

insert into new_course_registrations values
('000666666','ACCT210','1FC','1','2014',null);

insert into new_course_registrations values
('000710000','CMPP201','1FA','2','2013',43);

insert into new_course_registrations values
('000710000','CMPP230','1FC','1','2014',null);

insert into new_course_registrations values
('000710000','MATH215','1FC','1','2013',null);

insert into new_course_registrations values
('000600201','CMPP201','1FC','1','2014',42);

COMMIT;
