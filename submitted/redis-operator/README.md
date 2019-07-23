# Redis-Operator
A redis-operator based on operator-sdk, it provides high availability redis with sentinel automatic failover on Kubernetes.

[![asciicast](https://asciinema.org/a/yStFhgzs51E19zOHzOIOQSMUj.svg)](https://asciinema.org/a/yStFhgzs51E19zOHzOIOQSMUj)

GitHub: [https://github.com/kube-incubator/redis-operator](https://github.com/kube-incubator/redis-operator)

## How to use it

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
NAME                                       READY   STATUS    RESTARTS   AGE
bc-redis-example-0                         1/1     Running   0          2m15s
bc-redis-example-1                         1/1     Running   0          93s
bc-redis-example-2                         1/1     Running   0          58s
bc-sentinel-example-6587886489-72zmr       1/1     Running   0          2m16s
bc-sentinel-example-6587886489-d2nlb       1/1     Running   0          2m16s
bc-sentinel-example-6587886489-wmfs7       1/1     Running   0          2m16s
example-redis-operator-54bfbd6cdd-lvttx    1/1     Running   0          2m27s
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

### Get Sentinel Service Endpoint

```sh
$ kubectl get svc -l sentinel=example
NAME                  TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)     AGE
bc-sentinel-example   ClusterIP   10.106.24.84   <none>        26379/TCP   2m16s
```
