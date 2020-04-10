##Install DV UI in Fuse Online


```
oc login 

oc new-project dv-ui

oc apply -f operatorgroup.yml

oc apply -f subscription.yml

oc create secret docker-registry syndesis-pull-secret --docker-server=registry.redhat.io --docker-username=$MINISHIFT_USERNAME --docker-password=$MINISHIFT_PASSWORD --docker-email=$MINISHIFT_EMAIL

oc secrets link syndesis-operator syndesis-pull-secret --for=pull

oc apply -f syndesis.yml
```

###When installed, log in to Fuse Online and create a virtualizaion named 'dv-demo'

```
oc get route syndesis --template='{{ .spec.host }}'

oc get route dv-demo-odata --template='{{ .spec.host }}'

```