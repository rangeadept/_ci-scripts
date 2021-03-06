#!/bin/bash

set -e 

: ${PROJECT_NAME:?"ERR: PROJECT_NAME environment var must be set!"}
: ${GCLOUD_SERVICE_KEY:?"ERR: GCLOUD_SERVICE_KEY environment var must be set!"}
: ${CLUSTER_NAME:?"ERR: CLUSTER_NAME environment var must be set!"}
: ${CLUSTER_ZONE:?"ERR: CLUSTER_ZONE environment var must be set!"}

echo "Updating gcloud components..."
sudo /opt/google-cloud-sdk/bin/gcloud --quiet components update
sudo /opt/google-cloud-sdk/bin/gcloud --quiet components update kubectl

echo "Authenticating gcloud/kubernetes session..."
echo $GCLOUD_SERVICE_KEY | base64 --decode -i > ${HOME}/account-auth.json
sudo /opt/google-cloud-sdk/bin/gcloud auth activate-service-account --key-file ${HOME}/account-auth.json
sudo /opt/google-cloud-sdk/bin/gcloud config set project $PROJECT_NAME
sudo /opt/google-cloud-sdk/bin/gcloud --quiet config set container/cluster $CLUSTER_NAME
sudo /opt/google-cloud-sdk/bin/gcloud config set compute/zone ${CLUSTER_ZONE}
sudo /opt/google-cloud-sdk/bin/gcloud --quiet container clusters get-credentials $CLUSTER_NAME
sudo chown -R ubuntu:ubuntu /home/ubuntu/.kube
sudo chown -R ubuntu:ubuntu /home/ubuntu/.config
