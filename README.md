

#Instructions

git clone https://github.com/ankur512512/ecosia.git

cd ecosia

minikube addons enable ingress

kubectl wait --for=condition=ready pod -n kube-system -l app.kubernetes.io/name=nginx-ingress-controller

docker build -t ecosia:latest docker/.

kubectl apply -f templates/

echo "`minikube ip`  local.ecosia.org" >> /etc/hosts

curl http://local.ecosia.org/tree