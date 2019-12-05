oc new-app mysql:5.7 --insecure-registry=true -e MYSQL_USER=user -e MYSQL_PASSWORD=mypassword -e MYSQL_DATABASE=sampledb

oc rsh $(oc get pods -o name -l app=mysql)
mysql -u user -pmypassword
use sampledb


 CREATE TABLE ORDERS
(
  id              INT unsigned NOT NULL AUTO_INCREMENT,
  name            VARCHAR(150) NOT NULL,
  ownerId           INT NOT NULL,
  PRIMARY KEY     (id)
);

INSERT INTO ORDERS ( name, ownerId) VALUES
  ( 'Sandy', 10),
  ( 'Cookie', 11),
  ( 'Charlie', 12);

 \quit

