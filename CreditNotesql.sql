  CREATE TABLE TESTDB.KIZWA
   (	SLNO NUMBER NOT NULL ENABLE, 
	CREDIT_DATE DATE, 
	INVOICE_NO VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	CUST_NAME VARCHAR2(50 BYTE), 
	CUST_MOBILE NUMBER(10,0), 
	PRODUCT_AMOUNT NUMBER, 
	CREDIT_RECEIVE_DATE DATE, 
	CRN_AMOUNT" NUMBER, 
	BALANCE_AMOUNT NUMBER, 
	CLAIM VARCHAR2(20 BYTE), 
  CONSTRAINT "TABLE1_PK" PRIMARY KEY (SLNO) ;
 
