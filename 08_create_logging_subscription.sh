#!/bin/bash

# From https://docs.openshift.com/container-platform/4.12/logging/cluster-logging-deploying.html

echo "#### 6c. Create a Subscription object to subscribe a namespace to the Red Hat OpenShift Logging Operator:"
echo "#### 6d. Apply the Subscription object by running the following command:"
cat <<EOF | oc apply -f -
apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  name: cluster-logging
  namespace: openshift-logging 
spec:
  channel: "stable" 
  name: cluster-logging
  source: redhat-operators 
  sourceNamespace: openshift-marketplace
EOF