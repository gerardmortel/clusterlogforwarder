# Install an OpenShift Cluster Log Forwarder
[https://github.com/gerardmortel/clusterlogforwarder](https://github.com/gerardmortel/clusterlogforwarder)

# Resources used to create this
[Installing Logging via CLI](https://docs.openshift.com/container-platform/4.12/logging/cluster-logging-deploying.html)

# Purpose
The purpose of this repo is to install an OpenShift Cluster Log Forwarder

# Prerequisites
1. OpenShift 4.12+ cluster on Fyre
2. NFS Storage configured https://github.com/gerardmortel/nfs-storage-for-fyre
3. Entitlement key https://myibm.ibm.com/products-services/containerlibrary
4. kubectl 1.25+
5. ocp cli

# Instructions
1. ssh into the infrastructure node as root (e.g. ssh root@api.bravers.cp.fyre.ibm.com)
2. yum install -y unzip
3. cd
4. rm -rf clusterlogforwarder-main
5. rm -f main.zip
6. curl -L https://github.com/gerardmortel/clusterlogforwarder/archive/refs/heads/main.zip -o main.zip
7. unzip main.zip
8. rm -f main.zip
9. cd clusterlogforwarder-main
10. STOP! Put your values for ALL VARIABLES inside file 02_setup_env.sh
11. ./01_driver.sh | tee install1.log