# A Simple Teiid Client

## Prerequisites: run postgresql instructions

Runs a simple query against a JDBC or ODBC endpoints using a Spring JDBC template.  

Edit the src/main/resources/application.properties and/or one of the profile properties to match the username, password, and url of the Teiid instance you are testing against.


## Option 1
Expose JDBC and ODBC ports using oc port-forward

```
oc port-forward $(oc get pods -o=jsonpath='{.items[0].metadata.name}' -l app=rdbms-springboot) 35432 31000
```

Build and run against JDBC (31000) endpoint:

```
mvn -Dspring.profiles.active=teiid
```

Build and run against ODBC (35432) endpoint

```
mvn -Dspring.profiles.active=postgresql
```

## Option 2
Expose JDBC and ODBC ports using LoadBalancer service

Expose JDBC and ODBC
 
```
oc apply -f - << EOF
apiVersion: v1
kind: Service
metadata:
  name: rdbms-springboot-expose
spec:
  type: LoadBalancer
  ports:
  - name: teiid
    port: 31000  
  - name: pg
    port: 35432          
  selector:
    app: rdbms-springboot
EOF
```

Find the full path to the LoadBalancer 

```
oc get svc rdbms-springboot-expose -o=jsonpath='{..ingress[0].hostname}'
```

## Build and run:
Update the properties file with the above path and run the JDBC and/or ODBC clients
```
mvn -Dspring.profiles.active=teiid
mvn -Dspring.profiles.active=postgresql
```
