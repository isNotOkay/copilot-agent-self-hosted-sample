# 1. Stop & delete Minikube
minikube stop
minikube delete

# 2. Restart fresh (your beast mode)
minikube start \
  --cpus=32 \
  --memory=64g \
  --disk-size=500g \
  --driver=docker \
  --container-runtime=containerd

# 3. Re-enable GPU
minikube addons enable nvidia-device-plugin
