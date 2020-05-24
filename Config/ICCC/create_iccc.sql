/*	This file is used to build the course enrolment data
base for the Ivy Covered Community College (ICCC).
	
Created by    : Jack Moore
Date created  : 94-12-04
Date Modified : 99-09-11 - by Jack Moore


Hereafter this version will be known as V1. 
All previous versions
will be known collectively as V0.


Note changed spelling of ENROLMENT in CLASS_SECTION table.

								*/



/*	Clear the data base of existing tables			*/



drop table COURSE cascade constraints;

drop table ORGANIZATIONAL_UNIT cascade constraints;

drop table FACULTY cascade constraints;

drop table CLASS_SECTION cascade constraints;

drop table STUDENT cascade constraints;

drop table COURSE_REGISTRATION cascade constraints;

drop table EXPERTISE cascade constraints;



/*	Build the tables complete without constraints.		*/




create table COURSE (
COURSE_CODE		varchar2 (9),
COURSE_TITLE		varchar2 (50),
HOURS			number (3),
CREDITS			number (3),
PREREQUISITE		varchar2 (9));


create table ORGANIZATIONAL_UNIT (
UNIT_TYPE		varchar2 (15),
UNIT_NAME		varchar2 (25),
UNIT_NUMBER		number (3),
UNIT_SUPERVISOR		varchar2 (9),
SUPERIOR_UNIT		number (3));


create table FACULTY (
EMPLOYEE_ID		varchar2 (9),
SURNAME 		varchar2 (30),
FIRSTNAME		varchar2 (30),
BIRTHDATE		date,
SENIORITY_DATE		date,
SALARY			number (8,2),
UNIT			number (3));


create table CLASS_SECTION (
COURSE_CODE		varchar2 (9),
SECTION_CODE		varchar2 (3),
SEMESTER		varchar2 (3),
YEAR			varchar2 (4),
INSTRUCTOR_ID		varchar2 (9),
CAPACITY		number (3),
ENROLMENT		number (3));


create table STUDENT (
STUDENT_ID		varchar2 (9),
SURNAME			varchar2 (30),
FIRSTNAME		varchar2 (30),
BIRTHDATE		date,
GENDER			varchar2 (1),
PROGRAM_OF_STUDIES	varchar2 (25));


create table COURSE_REGISTRATION (
STUDENT_ID		varchar2 (9),
COURSE_CODE		varchar2 (9),
SECTION			varchar2 (3),
SEMESTER		varchar2 (3),
YEAR			varchar2 (4),
GRADE			number (3));


create table EXPERTISE (
EMPLOYEE_ID		varchar2 (9),
COURSE_CODE		varchar2 (9),
EXPERTISE_LEVEL		number (3));


