# 1. Stop & delete Minikube
minikube stop
minikube delete

# 2. Restart fresh (tuned for CX43: 8 vCPU / 16 GB RAM)
minikube start \
  --cpus=4 \
  --memory=10g \
  --disk-size=80g \
  --driver=docker \
  --container-runtime=containerd
