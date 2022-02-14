-- 1 CREATE REQUIRD TABLES 
CREATE TABLE Supplier(
	SUPP_ID INT PRIMARY KEY,
    SUPP_NAME VARCHAR(50),
    SUPP_CITY VARCHAR(50),
    SUPP_PHONE VARCHAR(20)
);

CREATE TABLE CUSTOMER(
	CUS_ID INT PRIMARY KEY,
    CUS_NAME VARCHAR(50),
	CUS_PHONE VARCHAR(20),
    CUS_CITY VARCHAR(50),
    CUS_GENDER VARCHAR(1)
);

CREATE TABLE CATEGORY(
	CAT_ID INT PRIMARY KEY,
    CAT_NAME VARCHAR(50)
);

CREATE TABLE PRODUCT(
	PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(50),
    PRO_DESC VARCHAR(50),
    CAT_ID INT,
    FOREIGN KEY (CAT_ID) REFERENCES CATEGORY(CAT_ID)
);

CREATE TABLE PRODUCTDETAILS(
	PROD_ID INT PRIMARY KEY,
    PRO_ID INT, FOREIGN KEY (PROD_ID) REFERENCES PRODUCT(PRO_ID),
    SUPP_ID INT, FOREIGN KEY (SUPP_ID) REFERENCES SUPPLIER(SUPP_ID),
    PRICE FLOAT
);

CREATE TABLE ORDERS(
	ORD_ID INT PRIMARY KEY,
    ORD_AMOUNT INT,
    ORD_DATE DATE,
    CUS_ID INT, FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER(CUS_ID),
    PROD_ID INT, FOREIGN KEY (PROD_ID) REFERENCES PRODUCTDETAILS(PROD_ID)
);

CREATE TABLE RATINGS (
	RAT_ID INT PRIMARY KEY,
    CUS_ID INT, FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER(CUS_ID),
    SUPP_ID INT, FOREIGN KEY (SUPP_ID) REFERENCES SUPPLIER(SUPP_ID),
    RAT_RATSTARS INT
);

-- 2 INSERT DATA INTO GIVEN TABLES 
INSERT INTO SUPPLIER (SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
VALUES (1, "Rajesh Retails", "Delhi", "1234567890"),
(2, "Appario Ltd", "Mumbai", "2589631470"),
(3, "Knome products", "Banglore", "9785462315"),
(4, "Bansal Retails", "Kochi" , "8975463285"),
(5, "Mittal Ltd", "Lucknow", "7898456532");


INSERT INTO CUSTOMER(CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)
VALUES (1, "AAKASH", "9999999999", "DELHI", "M"),
(2, "AMAN", "9785463215", "NOIDA", "M"),
(3, "NEHA", "9999999999", "MUMBAI", "F"),
(4, "MEGHA", "9994562399", "KOLKATA", "F"),
(5,	"PULKIT", "7895999999", "LUCKNOW", "M");

INSERT INTO CATEGORY(CAT_ID,CAT_NAME)
VALUES (1, "BOOKS"),
(2, "GAMES"),
(3, "GROCERIES"),
(4, "ELECTRONICS"),
(5, "CLOTHES");

INSERT INTO PRODUCT(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)
VALUES (1, "GTA V", "DFJDJFDJFDJFDJFJF", 2),
(2, "TSHIRT", "DFDFJDFJDKFD", 5),
(3, "ROG LAPTOP", "DFNTTNTNTERND", 4),
(4, "OATS", "REURENTBTOTH", 3),
(5, "HARRY POTTER", "NBEMCTHTJTH", 1);

INSERT INTO PRODUCTDETAILS(PROD_ID,PRO_ID,SUPP_ID,PRICE)
VALUES (1, 1, 2, 1500),
(2, 3, 5, 30000),
(3, 5, 1, 3000),
(4, 2, 3, 2500),
(5, 4, 1, 1000);

INSERT INTO ORDERS (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PROD_ID)
VALUES (20, 1500, "2021-10-12", 3, 5),
(25, 30500, "2021-09-16", 5, 2),
(26, 2000, "2021-10-05", 1, 1),
(30, 3500, "2021-08-16", 4, 3),
(50, 2000, "2021-10-06", 2, 1);

INSERT INTO RATINGS
VALUES (1, 2, 2, 4),
(2, 3 , 4, 3),
(3, 5, 1, 5),
(4, 1, 3, 2),
(5, 4, 5, 4);


SELECT CUSTOMER.CUS_GENDER, COUNT(*) AS COUNT
FROM CUSTOMER 
INNER JOIN ORDERS ON CUSTOMER.CUS_ID = ORDERS.CUS_ID
WHERE ORD_AMOUNT >= 3000
GROUP BY CUSTOMER.CUS_GENDER;




SELECT CUS_NAME , CUS_GENDER FROM CUSTOMER WHERE  CUS_NAME LIKE "A%" OR CUS_NAME LIKE "%A";





