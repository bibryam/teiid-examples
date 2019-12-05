##Prerequisites: run mysql and postgresql

## Create virtualization

oc create -f https://raw.githubusercontent.com/bibryam/teiid-examples/master/federation/mysql-postgresql-federation.yml


## View data
https://mysql-postgresql-federation-dv.apps.cluster-london-966d.london-966d.open.redhat.com/odata/mysqlorders/ORDERS?$format=JSON
https://mysql-postgresql-federation-dv.apps.cluster-london-966d.london-966d.open.redhat.com/odata/postgresqlcustomers/CUSTOMER?$format=JSON


https://mysql-postgresql-federation-dv.apps.cluster-london-966d.london-966d.open.redhat.com/odata/portfoliofederation/MyOrders?$format=JSON
https://mysql-postgresql-federation-dv.apps.cluster-london-966d.london-966d.open.redhat.com/odata/portfoliofederation/CustomerZip?$format=JSON
https://mysql-postgresql-federation-dv.apps.cluster-london-966d.london-966d.open.redhat.com/odata/portfoliofederation/CustomerOrders?$format=JSON