#!/bin/bash

echo "#### Running the driver file"
. ./02_setup_env.sh
./03_create_elastic_search_namespace.sh
./04_create_logging_namespace.sh
./05_install_elastic_search_operator.sh
./06_create_elastic_search_subscription.sh
./07_install_logging_operator.sh
./08_create_logging_subscription.sh
./09_create_cluster_logging_resource.sh
./10_create_cluster_logging_fowarder_namespace.sh
./11_create_service_account.sh
./12_create_cluster_logging_forwarder_resource.sh