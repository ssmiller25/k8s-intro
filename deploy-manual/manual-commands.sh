#!/bin/sh

# Manual comamnds  to create a deployment.
#  Note: look in the /deploy directory for a better process for deployment,
#  but these commands work well for a quick deployment

kubectl create deployment k8s-intro --image ssmiller25/k8s-intro 
# Increase replica count
# kubectl scale deployment k8s-intro --replicas=3
kubectl expose deployment/k8s-intro --port 1948

