#!/bin/bash

minikube start

kubectl apply -k argocd

# The second time CRD will be present
kubectl apply -k argocd
