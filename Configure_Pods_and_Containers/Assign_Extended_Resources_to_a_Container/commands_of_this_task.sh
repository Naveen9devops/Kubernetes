kubectl version

rm -f extended-resource-pod.yaml

cat <<EOT > extended-resource-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: extended-resource-demo
spec:
  containers:
  - name: extended-resource-demo-ctr
    image: nginx
    resources:
      requests:
        shris.local.com/dongle: 3
      limits:
        shris.local.com/dongle: 3
EOT

kubectl create -f extended-resource-pod.yaml

kubectl get pod extended-resource-demo

kubectl describe pod extended-resource-demo

rm-f extended-resource-pod2.yaml

cat <<EOT > extended-resource-pod2.yaml
apiVersion: v1
kind: Pod
metadata:
  name: extended-resource-demo-2
spec:
  containers:
  - name: extended-resource-demo-2-ctr
    image: nginx
    resources:
      requests:
        shris.local.com/dongle: 2
      limits:
        shris.local.com/dongle: 2
EOT

kubectl create -f  extended-resource-pod2.yaml

kubectl describe pod extended-resource-demo-2

kubectl get pod extended-resource-demo-2



