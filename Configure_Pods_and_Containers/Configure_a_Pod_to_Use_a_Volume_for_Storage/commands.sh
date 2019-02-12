cat <<EOT > redis.yaml
apiVersion: v1
kind: Pod
metadata:
  name: redis
spec:
  containers:
  - name: redis
    image: redis
    volumeMounts:
    - name: redis-storage
      mountPath: /data/redis
  volumes:
  - name: redis-storage
    emptyDir: {}
EOT

kubectl create -f redis.yaml

kubectl get pod redis --watch

#kubectl exec -it redis -- /bin/bash

#root@redis:/data/redis# cd /data/redis/

#root@redis:/data/redis# echo Hello > test-file

#root@redis:/data/redis# apt-get update
#root@redis:/data/redis# apt-get install procps
#root@redis:/data/redis# ps aux
