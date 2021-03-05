#!/bin/bash
apt-get update -y
apt-get install python3 -y
apt-get install python3-pip -y
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl 
mv ./kubectl /usr/local/bin/kubectl
apt-get update -y &&  sudo apt-get install -y docker.io
docker version 
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && mv minikube /usr/local/bin/
apt install conntrack -y
minikube start --driver=none
minikube status
kubectl create deployment hello-world --image=raghdam/capstoneproject
kubectl expose deployment hello-world --port=8080 --target-port=8080 --type=NodePort  --overrides '{ "apiVersion": "v1","spec":{"ports":[{"port":8080,"protocol":"TCP","targetPort":8080,"nodePort":30031}]}}'
