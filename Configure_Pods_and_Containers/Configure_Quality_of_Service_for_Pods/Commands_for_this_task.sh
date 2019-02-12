kubectl version

echo $?

kubectl create namespace qos-example

echo "qos-example namespace created succesfully.!!!"

cat <<EOT > qos-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: qos-demo
  namespace: qos-example
spec:
  containers:
  - name: qos-demo-ctr
    image: nginx
    resources:
      limits:
        memory: "200Mi"
        cpu: "700m"
      requests:
        memory: "200Mi"
        cpu: "700m"
EOT

echo "yaml file created successfully"

kubectl create -f qos-pod.yaml --namespace=qos-example

kubectl get pod qos-demo --namespace=qos-example --output=yaml

cat <<EOT > qos-pod4.yaml
apiVersion: v1
kind: Pod
metadata:
  name: qos-demo-4
  namespace: qos-example
spec:
  containers:

  - name: qos-demo-4-ctr-1
    image: nginx
    resources:
      requests:
        memory: "200Mi"

  - name: qos-demo-4-ctr-2
    image: redis
EOT

echo "yaml file created successfully"

kubectl create -f qos-pod4.yaml --namespace=qos-example

kubectl get pod qos-demo-4 --namespace=qos-example --output=yaml
