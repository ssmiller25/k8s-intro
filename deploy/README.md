# Example deployment leveraging kustomize

## Usage

TODO: Fill out

## Creation

* Run commands in ../deploy-manual
* Build out k8s configs:

```sh
kubectl get deployment k8s-intro -o yaml --export > deployment.yaml
kubectl get service k8s-intro -o yaml --export > service.yaml
kubectl get ingress k8s-intro-ingress -o yaml --export > k8s-intro-ingress.yaml
```
