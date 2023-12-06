#!/bin/bash

# From https://docs.openshift.com/container-platform/4.12/logging/cluster-logging-deploying.html

echo "#### 1. Create a Namespace object for the Elasticsearch Operator:"
echo "#### 2. Apply the Namespace object by running the following command:"
cat <<EOF | oc apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: openshift-operators-redhat 
  annotations:
    openshift.io/node-selector: ""
  labels:
    openshift.io/cluster-monitoring: "true" 
EOF

echo "3. #### Create a Namespace object for the Red Hat OpenShift Logging Operator:"
echo "4. #### Apply the Namespace object by running the following command:"
cat <<EOF | oc apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: openshift-logging
  annotations:
    openshift.io/node-selector: ""
  labels:
    openshift.io/cluster-monitoring: "true"
EOF

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

echo "#### 6c. Create a Subscription object to subscribe a namespace to the Red Hat OpenShift Logging Operator:"
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