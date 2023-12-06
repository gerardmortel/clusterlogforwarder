#!/bin/bash

# From https://docs.openshift.com/container-platform/4.12/logging/cluster-logging-deploying.html

echo "#### 7. Create a ClusterLogging custom resource (CR):"
echo "#### 8. Apply the ClusterLogging custom resource (CR) by running the following command:"
cat <<EOF | oc apply -f -
apiVersion: logging.openshift.io/v1
kind: ClusterLogging
metadata:
  name: instance 
  namespace: openshift-logging
spec:
  managementState: Managed  
  logStore:
    type: elasticsearch  
    retentionPolicy: 
      application:
        maxAge: 1d
      infra:
        maxAge: 7d
      audit:
        maxAge: 7d
    elasticsearch:
      nodeCount: 3 
      storage:
        storageClassName: ${STORAGECLASS} 
        size: 200G
      resources: 
        limits:
          memory: 16Gi
        requests:
          memory: 16Gi
      proxy: 
        resources:
          limits:
            memory: 256Mi
          requests:
             memory: 256Mi
      redundancyPolicy: SingleRedundancy
  visualization:
    type: kibana  
    kibana:
      replicas: 1
  collection:
    logs:
      type: fluentd  
      fluentd: {}
EOF