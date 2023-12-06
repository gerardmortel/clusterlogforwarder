#!/bin/bash

# From https://docs.openshift.com/container-platform/4.12/logging/log_collection_forwarding/log-forwarding.html

echo "#### Extra 1. Create a service account for the collector. If you want to write logs to storage that requires a token for"
echo "#### authentication, you must include a token in the service account."
oc create serviceaccount ${SERVICEACCOUNTNAME}
