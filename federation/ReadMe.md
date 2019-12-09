## Prerequisites: run mysql and postgresql instructions

## Create virtualization
```
oc create -f https://raw.githubusercontent.com/bibryam/teiid-examples/master/federation/mysql-postgresql-federation.yml
```

## View data

Assuming the following route is created:

https://mysql-postgresql-federation-dv-demo.apps.cluster-london-cd44.london-cd44.open.redhat.com/

Try out the queries:

```
https://mysql-postgresql-federation-dv.apps.cluster-london-966d.london-966d.open.redhat.com/odata/mysqlorders/ORDERS?$format=JSON

https://mysql-postgresql-federation-dv.apps.cluster-london-966d.london-966d.open.redhat.com/odata/postgresqlcustomers/CUSTOMER?$format=JSON

https://mysql-postgresql-federation-dv.apps.cluster-london-966d.london-966d.open.redhat.com/odata/portfoliofederation/MyOrders?$format=JSON

https://mysql-postgresql-federation-dv.apps.cluster-london-966d.london-966d.open.redhat.com/odata/portfoliofederation
/CustomerZip?$format=JSON

https://mysql-postgresql-federation-dv.apps.cluster-london-966d.london-966d.open.redhat.com/odata/portfoliofederation/CustomerOrders?$format=JSON
```


Or the following from CLI
```sh
curl -k https://mysql-postgresql-federation-dv-demo.apps.cluster-london-cd44.london-cd44.open.redhat.com/odata/portfoliofederation/CustomerOrders?$format=JSON | jq
```
