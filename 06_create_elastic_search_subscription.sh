#!/bin/bash

# From https://docs.openshift.com/container-platform/4.12/logging/cluster-logging-deploying.html

echo "#### 5c. Create a Subscription object to subscribe a namespace to the Elasticsearch Operator:"
echo "#### 5d. Apply the Subscription object by running the following command:"
cat <<EOF | oc apply -f -
apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  name: elasticsearch-operator
  namespace: openshift-operators-redhat 
spec:
  channel: stable
  installPlanApproval: Automatic 
  source: redhat-operators 
  sourceNamespace: openshift-marketplace
  name: elasticsearch-operator
EOF