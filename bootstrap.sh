#!/bin/bash

minikube start

kubectl apply -k argocd

while test -z $(kubectl get -n argocd pod -o name); do
    echo -n "."
    sleep 1
done

kubectl wait -n argocd --all pod --for condition=ready

echo "---- ArgoCD Server ----"
minikube service -n argocd argocd-server --url
echo "Username: admin"
echo -n "Password: "
kubectl -n argocd get secret/argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
