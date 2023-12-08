#!/bin/bash

# From https://docs.openshift.com/container-platform/4.12/logging/log_collection_forwarding/log-forwarding.html
https://docs.openshift.com/container-platform/4.12/logging/log_collection_forwarding/log-forwarding.html
echo "#### Extra 1. Create a service account for the collector. If you want to write logs to storage that requires a token for"
echo "#### authentication, you must include a token in the service account."
oc create serviceaccount ${SERVICEACCOUNTNAME} -n ${NS}

echo "#### 2. Bind the appropriate cluster roles to the service account:"
oc adm policy add-cluster-role-to-user \
collect-application-logs system:serviceaccount:${NS}:${SERVICEACCOUNTNAME}
