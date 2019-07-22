# Redis-Operator
A redis-operator based on operator-sdk, it provides high availability redis with sentinel automatic failover on Kubernetes.

## Deploy

### Deploy Redis-Operator

```sh
$ helm package .
$ helm install example redis-operator-1.0.0.tgz
```

### Deploy sample redis cluster

```sh
$ kubectl apply -f https://raw.githubusercontent.com/kube-incubator/redis-operator/master/deploy/samples/basic.yaml
```

```sh
$ kubectl get pod
NAME                                   READY   STATUS    RESTARTS   AGE
bc-redis-example-0                     1/1     Running   0          2m15s
bc-redis-example-1                     1/1     Running   0          93s
bc-redis-example-2                     1/1     Running   0          58s
bc-sentinel-example-6587886489-72zmr   1/1     Running   0          2m16s
bc-sentinel-example-6587886489-d2nlb   1/1     Running   0          2m16s
bc-sentinel-example-6587886489-wmfs7   1/1     Running   0          2m16s
redis-operator-799b6fdff-9q2w5         1/1     Running   0          2m27s
```

### Connect to the redis cluster

```sh
$ kubectl exec -it $(kubectl get pod -l sentinel=example -o jsonpath='{.items[0].metadata.name}') -- redis-cli -p 26379 SENTINEL get-master-addr-by-name master
1) "172.17.0.8"
2) "6379"
```

```sh
$ kubectl exec -it $(kubectl get pod -l sentinel=example -o jsonpath='{.items[0].metadata.name}') -- redis-cli -h 172.17.0.8 -p 6379 SET hello world!
OK
$ kubectl exec -it $(kubectl get pod -l sentinel=example -o jsonpath='{.items[0].metadata.name}') -- redis-cli -h 172.17.0.8 -p 6379 GET hello
"world!"
```
