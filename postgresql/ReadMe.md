Create a PostgreSQL database 
 
oc new-app \
  -e POSTGRESQL_USER=user \
  -e POSTGRESQL_PASSWORD=mypassword \
  -e POSTGRESQL_DATABASE=sampledb \
  postgresql:9.6

Once the PostgreSQL Pod is in Running Status, connect to it and run psql client

oc rsh $(oc get pods -o name -l app=postgresql)
psql -U user sampledb


Create a few tables and populate with data

CREATE TABLE CUSTOMER
(
   ID bigint,
   SSN char(25),
   NAME varchar(64),
   CONSTRAINT CUSTOMER_PK PRIMARY KEY(ID)
);
CREATE TABLE ADDRESS
(
   ID bigint,
   STREET char(25),
   ZIP char(10),
   CUSTOMER_ID bigint,
   CONSTRAINT ADDRESS_PK PRIMARY KEY(ID),
   CONSTRAINT CUSTOMER_FK FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER (ID)
);
INSERT INTO CUSTOMER (ID,SSN,NAME) VALUES (10, 'CST01002','Joseph Smith');
INSERT INTO CUSTOMER (ID,SSN,NAME) VALUES (11, 'CST01003','Nicholas Ferguson');
INSERT INTO CUSTOMER (ID,SSN,NAME) VALUES (12, 'CST01004','Jane Aire');
INSERT INTO ADDRESS (ID, STREET, ZIP, CUSTOMER_ID) VALUES (10, 'Main St', '12345', 10);
\q
exit




oc create secret docker-registry dv-pull-secret --docker-server=registry.redhat.io --docker-username=$MINISHIFT_USERNAME --docker-password=$MINISHIFT_PASSWORD --docker-email=$MINISHIFT_EMAIL

oc secrets link builder dv-pull-secret
oc secrets link builder dv-pull-secret --for=pull


After operator install

oc secrets link dv-operator dv-pull-secret --for=pull





oc create -f 



