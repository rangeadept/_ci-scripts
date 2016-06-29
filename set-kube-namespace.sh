#!/bin/sh

set -e 

ns=$1

if [ -z "${ns}" ]; then
  echo "USAGE: set-kube-namespace.sh NAMESPACE"
  exit 1
fi

CONTEXT=$(kubectl config view | grep current-context | awk '{print $2}')
kubectl config set-context $CONTEXT --namespace="${ns}"
active=`kubectl config view | grep namespace: | awk '{print $2}'`
echo "Active namespace(context): ${active}"
