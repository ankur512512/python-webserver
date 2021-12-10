#!/bin/bash

eval $(minikube -p minikube docker-env) ## Setting environment to reuse docker daemon from Minikube if needed.

echo -e "\n***Enabling ingress for minikube\n"

minikube addons enable ingress

echo -e "\n***Sleeping for 10s so that ingress pods are ready by then..."

sleep 10

echo -e "\n***Building the docker image locally\n"

docker build -t ecosia:latest docker/.

echo -e "\n***Applying kubernetes manifests from yaml files store in templates folder...\n"

kubectl apply -f templates/

sleep 10

POD=$(kubectl get pod -l app=flask -o jsonpath="{.items[0].metadata.name}")

echo -e "\n***Printing container logs showing server logs and local testing."
kubectl logs $POD 

until [[ $(kubectl get ingress server-ingress -o jsonpath='{.status.loadBalancer.ingress[0].ip}') ]]
do
echo -e "\n Deployment completed. Sleeping for 10s until IP is assigned to ingress resource..."
sleep 10
done

kubectl get ingress -A

echo -e "\n***Adding host file entry in /etc/hosts..."

echo "`minikube ip`  local.ecosia.org" | sudo tee -a /etc/hosts

echo -e "\n***Host entry added. Now testing to see if we get required response with this command -- curl http://local.ecosia.org/tree\n Here's the result: \n\n"

curl http://local.ecosia.org/tree

echo -e "\n\n"
