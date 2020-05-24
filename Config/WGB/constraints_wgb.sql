ALTER TABLE wgb_account_type
ADD CONSTRAINT pk_account_type PRIMARY KEY (account_type);

ALTER TABLE wgb_customer
ADD constraint PK_CUSTOMER primary key (CUSTOMER_NUMBER)
MODIFY surname NOT NULL
MODIFY first_name NOT NULL;

ALTER TABLE wgb_assets
MODIFY asset_type DEFAULT 1;

ALTER TABLE wgb_account
ADD CONSTRAINT fk_account_to_type FOREIGN KEY (account_type)
    REFERENCES wgb_account_type
ADD constraint PK_ACCOUNT primary key (CUSTOMER_NUMBER, ACCOUNT_TYPE)
ADD constraint FK_ACCOUNT_TO_CUSTOMER foreign key (CUSTOMER_NUMBER)
    references WGB_CUSTOMER;

ALTER TABLE wgb_transaction
ADD constraint PK_WGB_TRANSACTION primary key (transaction_number)
ADD constraint CHECK_TRANSACTION_TYPE check (TRANSACTION_TYPE in ('D', 'C'))
ADD constraint FK_TRANSACTION_TO_ACCOUNT foreign key (CUSTOMER_NUMBER, ACCOUNT_TYPE) 
    references WGB_ACCOUNT
MODIFY customer_number NOT NULL
MODIFY account_type NOT NULL;

