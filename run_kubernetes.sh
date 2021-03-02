#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="raghdam/capstoneproject"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run pod-capstone-project\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=8080 --labels app=pod-capstone-project


# Step 3:
# List kubernetes pods
kubectl get pods
# Step 4:
# Forward the container port to a host
kubectl port-forward pod-capstone-project 8080:8080

