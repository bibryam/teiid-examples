##Install DV Operator

```
oc login --token=t-XXX --server=YYY

oc delete project dv-demo

oc new-project dv-demo

oc apply -f operatorgroup.yml

oc apply -f subscription.yml

oc wait pod -l name=dv-operator --for condition=Ready --timeout=5m

```

##Before DV operator install

```
oc create secret docker-registry dv-pull-secret --docker-server=registry.redhat.io --docker-username=$MINISHIFT_USERNAME --docker-password=$MINISHIFT_PASSWORD --docker-email=$MINISHIFT_EMAIL

oc secrets link builder dv-pull-secret
oc secrets link builder dv-pull-secret --for=pull
oc secrets link dv-operator dv-pull-secret --for=pull
```

## Go to other folders to run some examples

```
oc apply -f vdb.yml
oc get vdb hello-world -o 'jsonpath={.status.phase}' 


```

## 7.6 bug workaround

```
oc delete is fuse-java-openshift 
oc import-image fuse7/fuse-java-openshift:1.6 --from=registry.redhat.io/fuse7/fuse-java-openshift --confirm
oc delete vdb hello-world
oc apply -f vdb.yml
```

###When installed, log in to Fuse Online and create a virtualizaion named 'dv-demo'

```

//oc wait pod -l app=hello-world --for condition=Ready --timeout=5m
//oc wait vdb hello-world -o 'jsonpath={.status.phase}' --for condition=Running --timeout=5m

oc get route hello-world --template='{{ .spec.host }}'

https:// + host + /odata/dispatch/NOTE?$top=2&$orderby=ID&$format=JSON

```

###Example
https://hello-world-dv-demo.apps.cluster-london-5c46.london-5c46.example.opentlc.com/odata/dispatch/NOTE?$top=2&$orderby=ID&$format=JSON
 