#!/bin/bash
set -e

minikube image load copilot-agent-sample-runner:latest

NAMESPACE="arc-systems"
helm install arc \
    --namespace "${NAMESPACE}" \
    --create-namespace \
    oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set-controller

cd copilot-agent-sample-runner
./install.sh
cd ..
