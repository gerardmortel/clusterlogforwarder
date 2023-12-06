#!/bin/bash

# From https://docs.openshift.com/container-platform/4.12/logging/cluster-logging-deploying.html

echo "#### 6. Install the Red Hat OpenShift Logging Operator by creating the following objects:"
echo "#### 6a. Create an OperatorGroup object for the Red Hat OpenShift Logging Operator:"
echo "#### 6b. Apply the OperatorGroup object by running the following command:"
cat <<EOF | oc apply -f -
apiVersion: operators.coreos.com/v1
kind: OperatorGroup
metadata:
  name: cluster-logging
  namespace: openshift-logging 
spec:
  targetNamespaces:
  - openshift-logging 
EOF