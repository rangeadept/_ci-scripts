#!/bin/sh

# Assumes standard config pattern (TODO doc)
# Assumes running in deployment root
# Requires PROJECT_NAME, CIRCLE_SHA1, APP_NAME env variables to be set.

set -e

ns=$1

if [ -z "${ns}" ]; then
  exit 1
fi

envsubst < kubernetes/deployment.yaml.tmpl > k8-deployment.yaml
envsubst < kubernetes/service.yaml.tmpl > k8-service.yaml
sudo /opt/google-cloud-sdk/bin/gcloud docker push gcr.io/${PROJECT_NAME}/${APP_NAME}
_ci-scripts/set-kube-namespace.sh $ns
kubectl apply -f ./k8-service.yaml
cat ./k8-deployment.yaml
kubectl apply -f ./k8-deployment.yaml
