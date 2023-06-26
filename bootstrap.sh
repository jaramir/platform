#!/bin/bash

minikube start --addons=ingress,ingress-dns

kubectl apply -k argocd

# The second time CRD will be present
kubectl apply -k argocd

echo "domain test
nameserver `minikube ip`" > /etc/resolver/test
