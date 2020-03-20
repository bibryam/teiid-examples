## Create a PostgreSQL database 
```
oc create -f https://raw.githubusercontent.com/bibryam/teiid-examples/master/sqlserver/deploy-sql-server.yml
```
## Once the PostgreSQL Pod is in Running Status, connect to it and run psql client
```
oc get pods -l app=mssql -o wide --watch
oc rsh $(oc get pods -o name -l app=mssql)

```
## Create a few tables and populate with data
```
SQL_POD=$(oc get pods -l app=mssql -o jsonpath='{.items[0].metadata.name}')
#oc cp sampledb.sql $SQL_POD:/tmp
oc cp https://raw.githubusercontent.com/bibryam/teiid-examples/master/sqlserver/sampledb.sql
oc exec $SQL_POD -- /opt/mssql-tools/bin/sqlcmd -U sa -P P@ssw0rd -i /tmp/sampledb.sql
oc exec $SQL_POD -- /opt/mssql-tools/bin/sqlcmd -U sa -P P@ssw0rd -d sampledb -Q 'select * from CUSTOMER'
oc exec $SQL_POD -- /opt/mssql-tools/bin/sqlcmd -U sa -P P@ssw0rd -d sampledb -Q 'select * from ADDRESS'

#oc exec $SQL_POD -- /opt/mssql-tools/bin/sqlcmd -U sa -P P@ssw0rd  -Q 'DROP DATABASE IF EXISTS sampledb'

```
## Create virtualization
```
oc create -f https://raw.githubusercontent.com/bibryam/teiid-examples/master/sqlserver/vdb.yml
```
 
## Resources

https://github.com/microsoft/sqlworkshops-sqlonopenshift/  
https://portworx.com/run-ha-sql-server-red-hat-openshift/  
