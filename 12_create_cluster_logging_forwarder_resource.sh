#!/bin/bash


cat <<EOF | oc apply -f -
apiVersion: logging.openshift.io/v1
kind: ClusterLogForwarder
metadata:
  name: odm-log-fwder
  namespace: ${NS}
spec:
  serviceAccountName: ${SERVICEACCOUNTNAME}
  pipelines:
    - inputRefs:
        - odm-logs
      outputRefs:
        - elasticsearch-external
      detectMultilineErrors: true
  inputs:
    - name: odm-logs
      application:
        namespaces:
          - odmprodhelm1
  outputs:
    - name: elasticsearch-external
      type: elasticsearch
      url: 

EOF