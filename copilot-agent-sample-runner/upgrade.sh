INSTALLATION_NAME="arc-runner-set-copilot-coding-agent"
NAMESPACE="arc-runners"
helm upgrade --install "${INSTALLATION_NAME}" \
    --namespace "${NAMESPACE}" \
    --create-namespace \
    --values values.yaml \
    oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set
