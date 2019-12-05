
##Before operator install
oc create secret docker-registry dv-pull-secret --docker-server=registry.redhat.io --docker-username=$MINISHIFT_USERNAME --docker-password=$MINISHIFT_PASSWORD --docker-email=$MINISHIFT_EMAIL

oc secrets link builder dv-pull-secret
oc secrets link builder dv-pull-secret --for=pull


##After operator install

oc secrets link dv-operator dv-pull-secret --for=pull

