CREATE DATABASE sampledb;
go

USE sampledb;
go

CREATE TABLE CUSTOMER (
  ID int NOT NULL PRIMARY KEY,
  SSN char(25),
  NAME varchar(64),
);
go

CREATE TABLE ADDRESS (
  ID int NOT NULL PRIMARY KEY,
  STREET char(25),
  ZIP char(10),
  CUSTOMER_ID int FOREIGN KEY REFERENCES CUSTOMER(ID)
);
go

INSERT INTO CUSTOMER (ID,SSN,NAME) VALUES (10, 'CST01002','Joseph Smith');
INSERT INTO CUSTOMER (ID,SSN,NAME) VALUES (11, 'CST01003','Nicholas Ferguson');
INSERT INTO CUSTOMER (ID,SSN,NAME) VALUES (12, 'CST01004','Jane Aire');
INSERT INTO ADDRESS (ID, STREET, ZIP, CUSTOMER_ID) VALUES (10, 'Main St', '12345', 10);
go
