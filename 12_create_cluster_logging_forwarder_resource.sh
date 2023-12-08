#!/bin/bash

echo "#### Create Cluster Log Forwarder resource"
cat <<EOF | oc apply -f -
apiVersion: logging.openshift.io/v1
kind: ClusterLogForwarder
metadata:
  name: odm-log-fwder
  namespace: ${NS}
spec:
  serviceAccountName: ${SERVICEACCOUNTNAME}
  outputs:
    - name: elasticsearch-external
      type: elasticsearch
      url: http://elasticsearch.openshift-logging.svc.cluster.local:9200
  inputs:
    - name: odm-logs
      application:
        namespaces:
          - odmprodhelm1
  pipelines:
    - name: infrastructure-logs
      inputRefs:
        - infrastructure
      outputRefs:
        - elasticsearch-external
        - default
      detectMultilineErrors: true
    - name: odm-app
      inputRefs:
        - odm-logs
      outputRefs:
        - elasticsearch-external
        - default
      detectMultilineErrors: true
EOF