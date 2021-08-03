#!/bin/bash

echo -e "\n***Enabling ingress for minikube\n"

minikube addons enable ingress

echo -e "\n***Building the docker image locally\n"

docker build -t ecosia:latest docker/.

echo -e "\n***Applying kubernetes manifests from yaml files store in templates folder...\n"

kubectl apply -f templates/

sleep 7

POD=$(kubectl get pod -l app=flask -o jsonpath="{.items[0].metadata.name}")

echo -e "\n***Printing container logs showing server logs and local testing."
kubectl logs $POD 

echo -e "\n***Adding host file entry in /etc/hosts..."

echo "`minikube ip`  local.ecosia.org" | sudo tee -a /etc/hosts

echo -e "\n***Host entry added. Now testing to see if we get required response with this command -- curl http://local.ecosia.org/tree\n Here's the result: \n\n"

until [[ $(kubectl get ingress server-ingress -o jsonpath='{.status.loadBalancer.ingress[0].ip}') ]]
do
echo -e "\n Waiting for ingress resource to get ready..."
sleep 5
done

curl http://local.ecosia.org/tree

echo -e "\n\n"