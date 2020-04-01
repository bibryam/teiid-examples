## Create a SQL Server database 
```
oc create -f https://raw.githubusercontent.com/bibryam/teiid-examples/master/sqlserver/deploy-sql-server.yml
```

## Create a few tables and populate with data
```
SQL_POD=$(oc get pods -l app=mssql -o jsonpath='{.items[0].metadata.name}')
oc cp sampledb.sql $SQL_POD:/tmp
oc exec $SQL_POD -- /opt/mssql-tools/bin/sqlcmd -U sa -P P@ssw0rd -i /tmp/sampledb.sql
oc exec $SQL_POD -- /opt/mssql-tools/bin/sqlcmd -U sa -P P@ssw0rd -d sampledb -Q 'select * from CUSTOMER, ADDRESS'
#oc exec $SQL_POD -- /opt/mssql-tools/bin/sqlcmd -U sa -P P@ssw0rd  -Q 'DROP DATABASE IF EXISTS sampledb'

```
## Create virtualization
```
oc create -f https://raw.githubusercontent.com/bibryam/teiid-examples/master/sqlserver/vdb.yml


oc get vdb rdbms-springboot-sqlserver -o yaml | grep phase


```

## Validate

https://foo.com/odata/portfolio/CustomerZip?$filter=startswith(name,%27Joseph%27)&$format=JSON

 
## SQL Server Resources

https://github.com/microsoft/sqlworkshops-sqlonopenshift/  
https://portworx.com/run-ha-sql-server-red-hat-openshift/  

