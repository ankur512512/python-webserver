#!/bin/bash

echo -e "\n\nEnabling ingress for minikube"

minikube addons enable ingress

echo -e "\nWaiting for ingress-controller to get ready..."

kubectl wait --for=condition=ready pod -n kube-system -l app.kubernetes.io/name=nginx-ingress-controller

echo -e "\nBuilding the docker image locally"

docker build -t ecosia:latest docker/.

echo -e "\nApplying kubernetes manifests from yaml files store in templates folder..."

kubectl apply -f templates/

sleep 4

POD=$(kubectl get pod -l app=flask -o jsonpath="{.items[0].metadata.name}")

echo -e "\nPrinting container logs showing server logs and local testing."
kubectl logs $POD 

echo -e "\nAdding host file entry in /etc/hosts..."

echo "`minikube ip`  local.ecosia.org" >> /etc/hosts

echo -e "\nHost entry added. Now testing to see if we get required response with curl command for url -- curl https://local.ecosia.org"

curl http://local.ecosia.org/tree