#!/bin/bash

kubectl version

minikube addons enable metrics-server

kubectl get api services

kubectl create namespace mem-example
i
cat <<EOT > memory-request-limit.yaml
apiVersion: v1
kind: Pod
metadata:
  name: memory-demo
  namespace: mem-example
spec:
  containers:
  - name: memory-demo-ctr
    image: polinux/stress
    resources:
      limits:
        memory: "200Mi"
      requests:
        memory: "100Mi"
    command: ["stress"]
    args: ["--vm", "1", "--vm-bytes", "150M", "--vm-hang", "1"]
EOT

kubectl create -f memory-request-limit.yaml --namespace=mem-example

kubectl get pod memory-demo --namespace=mem-example

kubectl get pod memory-demo --output=yaml --namespace=mem-example

kubectl top pod memory-demo --namespace=mem-example
