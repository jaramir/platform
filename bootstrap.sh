#!/bin/bash -xe

minikube start --addons=metrics-server,dashboard

kubectl apply -k argocd

echo "---- ArgoCD UI ----"
minikube service -n argocd argocd-server --url
echo "Username: admin"
echo "Password: $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)"

kubectl -n argocd delete secret argocd-initial-admin-secret