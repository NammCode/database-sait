/*   This file creates the tables for the Walnut Grove Banking
      system.  It creates the basic tables without constraints.  

     Created:       9-Sep-96
     Written by:    J H Moore           */


DROP TABLE wgb_customer CASCADE CONSTRAINTS;
DROP TABLE wgb_account_type CASCADE CONSTRAINTS;
DROP TABLE wgb_account CASCADE CONSTRAINTS;
DROP TABLE wgb_transaction CASCADE CONSTRAINTS;
DROP TABLE wgb_assets CASCADE CONSTRAINTS;


CREATE TABLE wgb_customer (
customer_number         VARCHAR2 (7),
surname                 VARCHAR2 (25),
first_name              VARCHAR2 (20),
middle_name             VARCHAR2 (20),
address1                VARCHAR2 (20),
address2                VARCHAR2 (20),
city                    VARCHAR2 (25),
province                VARCHAR2 (2),
postal_code             VARCHAR2 (6),
area_code               NUMBER (3),
phone                   NUMBER (7),
date_entered            DATE);

CREATE TABLE wgb_account_type (
account_type                    NUMBER (2),
account_description             VARCHAR2 (35));


CREATE TABLE wgb_account (
customer_number         VARCHAR2 (7),
account_type            NUMBER (1),
date_created            DATE,
balance                 NUMBER (9,2));

CREATE TABLE wgb_transaction (
transaction_number      NUMBER,
customer_number         VARCHAR2 (7),
account_type            NUMBER (1),
transaction_amount      NUMBER (9,2),
transaction_type        VARCHAR2 (1),
transaction_date        DATE);

CREATE TABLE wgb_assets (
asset_type              NUMBER (1),
amount                  NUMBER (12,2));

