#!/bin/sh

# Manual comamnds  to create a deployment.
#  Note: look in the /deploy directory for a better process for deployment,
#  but these commands work well for a quick deployment

kubectl create deployment present --image quay.io/ssmiller25/present
# Increase replica count
# kubectl scale deployment present --replicas=3
kubectl expose deployment/present --port 1948
kubectl apply -f ingress.yaml

