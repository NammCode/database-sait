/*	This file is used to add the referential constraints to
	the course enrollment data base for the 
	Ivy Covered Community College (ICCC).

	Date created  : 94-12-04
	Date Modified : 95-07-21
								*/

/*  Add the primary keys.                                      */

alter table COURSE add constraint PK_COURSE
	primary key (COURSE_CODE);

alter table ORGANIZATIONAL_UNIT add constraint PK_ORG_UNIT
	primary key (UNIT_NUMBER);

alter table FACULTY add constraint PK_FACULTY
	primary key (EMPLOYEE_ID);

alter table CLASS_SECTION add constraint PK_CLASS_SECTION
	primary key (COURSE_CODE, SECTION_CODE, SEMESTER,
			YEAR);

alter table CLASS_SECTION add constraint CAPACITY_LIMIT
	check (CAPACITY <= 100 and CAPACITY >= 0);

alter table STUDENT add constraint PK_STUDENT
      	primary key (STUDENT_ID);

alter table COURSE_REGISTRATION add constraint PK_COURSE_REG
	primary key (STUDENT_ID, COURSE_CODE, SECTION, SEMESTER,
		     YEAR);

alter table FACULTY add constraint FK_FACULTY_TO_ORG_UNIT
	foreign key (UNIT) references ORGANIZATIONAL_UNIT;

alter table CLASS_SECTION add constraint FK_CLASS_SECTION_TO_COURSE
	foreign key (COURSE_CODE) references COURSE;

alter table CLASS_SECTION add constraint FK_CLASS_SECTION_TO_FACULTY
	foreign key (INSTRUCTOR_ID) references FACULTY;

alter table COURSE_REGISTRATION add constraint 
	FK_COURSE_REG_TO_CLASS_SECTION
	foreign key (COURSE_CODE, SECTION, SEMESTER, YEAR)
	references CLASS_SECTION;

alter table COURSE_REGISTRATION add constraint
	FK_COURSE_REG_TO_STUDENT
	foreign key (STUDENT_ID) references STUDENT;

alter table EXPERTISE add constraint
	FK_EXPERTISE_TO_FACULTY
	foreign key (EMPLOYEE_ID) references FACULTY;

alter table EXPERTISE add constraint
	FK_EXPERTISE_TO_COURSE
	foreign key (COURSE_CODE) references COURSE;

alter table EXPERTISE add constraint
        PK_EXPERTISE
        primary key(course_code, employee_id);


alter table COURSE add constraint FK_COURSE_TO_COURSE
	foreign key (PREREQUISITE)
	references COURSE;

	

