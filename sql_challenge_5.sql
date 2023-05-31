CREATE TABLE CUSTOMER(
    CUSTOMER_ID INT,
    CUSTOMER_NAME VARCHAR(50),
    GENDER VARCHAR(20),
    DOB DATE,
    AGE INT
);

INSERT INTO CUSTOMER (CUSTOMER_ID, CUSTOMER_NAME, GENDER, DOB, AGE )
VALUES(1, RAHUL, M, '2000-01-05', 22);
INSERT INTO CUSTOMER (CUSTOMER_ID, CUSTOMER_NAME, GENDER, DOB, AGE )
VALUES(2, SHIPA, F, '2004-04-05', 18);
INSERT INTO CUSTOMER (CUSTOMER_ID, CUSTOMER_NAME, GENDER, DOB, AGE )
VALUES(3, RAMESH, M, '2003-07-07', 19);
INSERT INTO CUSTOMER (CUSTOMER_ID, CUSTOMER_NAME, GENDER, DOB, AGE )
VALUES(4, KATINA, F, '2005-02-05', 17);
INSERT INTO CUSTOMER (CUSTOMER_ID, CUSTOMER_NAME, GENDER, DOB, AGE )
VALUES(5, ALIA, F, '1992-01-01', 30);
INSERT INTO CUSTOMER (CUSTOMER_ID, CUSTOMER_NAME, GENDER, DOB, AGE )
VALUES(6, ALI, M, NULL, NULL);

--WORKING WITH NULL VALUES IN SQL


SELECT * FROM CUSTOMER;
SELECT * FROM CUSTOMER WHERE DOB IS NULL;
SELECT * FROM CUSTOMER WHERE AGE IS NOT NULL;
SELECT *,COALESCE(AGE, 11) FROM CUSTOMER;
SELECT COUNT(CUSTOMER_NAME) FROM CUSTOMER;

-- HOW TO COUNT NULL VALUE.
SELECT COUNT(COALESCE(AGE,0)) FROM CUSTOMER;

--AVG() FUNCTION
SELECT AVG(AGE) FROM CUSTOMER;
SELECT AVG(COALESCE(AGE,0)) FROM CUSTOMER;