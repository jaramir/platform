#!/bin/bash

minikube start

kubectl apply -k argocd
