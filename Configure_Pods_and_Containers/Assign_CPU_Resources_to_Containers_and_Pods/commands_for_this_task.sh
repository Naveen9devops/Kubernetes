#!/bin/bash

kubectl version

kubectl get apiservices

kubectl create namespace cpu-example

cat <<EOT > cpu-request-limit.yaml
apiVersion: v1
kind: Pod
metadata:
  name: cpu-demo
  namespace: cpu-example
spec:
  containers:
  - name: cpu-demo-ctr
    image: vish/stress
    resources:
      limits:
        cpu: "1"
      requests:
        cpu: "0.5"
    args:
    - -cpus
    - "2"
EOT

kubectl create -f cpu-request-limit.yaml --namespace=cpu-example

kubectl get pod cpu-demo --output=yaml --namespace=cpu-example

kubectl top pod cpu-demo --namespace=cpu-example
