#!/bin/bash

# From https://docs.openshift.com/container-platform/4.12/logging/cluster-logging-deploying.html

echo "#### 5.Install the Elasticsearch Operator by creating the following objects:"
echo "#### 5a. Create an OperatorGroup object for the Elasticsearch Operator:"
echo "#### 5b. Apply the OperatorGroup object by running the following command:"
cat <<EOF | oc apply -f -
apiVersion: operators.coreos.com/v1
kind: OperatorGroup
metadata:
  name: openshift-operators-redhat
  namespace: openshift-operators-redhat 
spec: {}
EOF