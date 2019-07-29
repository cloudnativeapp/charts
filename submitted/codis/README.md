# [codis](https://github.com/CodisLabs/codis)

## 功能介绍

简单地说，codis 是一套应用于 Kubernetes 上面的 Redis 集群方案，通过 codis-proxy 隔离了后端的 Redis 分片；
通过冗余 + HA 的方式实现了高可用；
通过 codis-dashboard 实现了界面化管理 Redis 集群伸缩。

详细的介绍见：

[为什么大厂都喜欢用 Codis 来管理分布式集群？](https://juejin.im/post/5c132b076fb9a04a08218eef)

[tutorial_zh](https://github.com/zeusro/codis/blob/release3.2/doc/tutorial_zh.md)

只用到 Redis 简单指令

由于豌豆荚官方团队没有推送到 https://hub.docker.com/ ，[并且默认的Dockerfile](https://github.com/CodisLabs/codis/blob/release3.2/Dockerfile) 写法比较落后。

我 Fork 并修改了 `release3.2` 的分支，推送到[我自己的 hub.docker.com](https://hub.docker.com/r/zeusro/codis)。

大家也可自行编译。

## 注意事项

codis 依赖于 zookeeper,但这不是绝对的。

> [Codis 使用文档](https://github.com/CodisLabs/codis/blob/release3.2/doc/tutorial_zh.md)
>
> 元数据存储支持 etcd/zookeeper/filesystem。

默认的例子用了 zookeeper ，大家可自行实现其他方式。

## 安装使用

### helm v3

目前版本:

version.BuildInfo {
	Version: "v3.0.0-alpha.2",
	GitCommit: "97e7461e41455e58d89b4d7d192fed5352001d44",
	GitTreeState: "clean",
	GoVersion: "go1.12.7"
}

```
helm install codis-prod \
        ../codis \
        --set name=codis-prod 
```

输出:

```bash

NAME: codis-prod
LAST DEPLOYED: 2019-07-29 17:32:10.817148 +0800 CST m=+0.125977867
NAMESPACE: helmtest
STATUS: deployed

NOTES:
codis-dashboard URL 如下：
http://codis.example.com
```


```
NAME                               READY   STATUS    RESTARTS   AGE
pod/codis-dashboard-0              1/1     Running   2          2m52s
pod/codis-fe-687f859bd7-76fl9      1/1     Running   0          2m52s
pod/codis-fe-687f859bd7-7hv7p      1/1     Running   0          2m52s
pod/codis-prod-zookeeper-0         1/1     Running   0          2m52s
pod/codis-prod-zookeeper-1         1/1     Running   0          2m52s
pod/codis-prod-zookeeper-2         1/1     Running   0          2m52s
pod/codis-proxy-74d74bd8d6-78vgm   1/1     Running   0          2m52s
pod/codis-proxy-74d74bd8d6-bld7h   1/1     Running   0          2m52s
pod/codis-proxy-74d74bd8d6-bplc8   1/1     Running   0          2m52s
pod/codis-proxy-74d74bd8d6-pz57c   1/1     Running   0          2m52s
pod/codis-proxy-74d74bd8d6-wn6bl   1/1     Running   0          2m52s
pod/codis-server-0                 1/1     Running   2          2m52s
pod/codis-server-1                 1/1     Running   0          2m11s
pod/codis-server-2                 1/1     Running   0          2m2s
pod/codis-server-3                 1/1     Running   0          113s
pod/codis-server-4                 1/1     Running   0          108s
pod/codis-server-5                 1/1     Running   0          98s

NAME                                    TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                      AGE
service/codis-dashboard                 ClusterIP   172.30.11.42    <none>        18080/TCP                    2m52s
service/codis-fe                        ClusterIP   172.30.7.150    <none>        8080/TCP                     2m52s
service/codis-prod-zookeeper            ClusterIP   172.30.1.84     <none>        2181/TCP,2888/TCP,3888/TCP   2m52s
service/codis-prod-zookeeper-headless   ClusterIP   None            <none>        2181/TCP,2888/TCP,3888/TCP   2m52s
service/codis-proxy                     ClusterIP   172.30.15.187   <none>        18080/TCP                    2m52s
service/codis-server                    ClusterIP   172.30.3.154    <none>        6379/TCP                     2m52s

NAME                          DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/codis-fe      2         2         2            2           2m52s
deployment.apps/codis-proxy   5         5         5            5           2m52s

NAME                                     DESIRED   CURRENT   READY   AGE
replicaset.apps/codis-fe-687f859bd7      2         2         2       2m52s
replicaset.apps/codis-proxy-74d74bd8d6   5         5         5       2m52s

NAME                                    DESIRED   CURRENT   AGE
statefulset.apps/codis-dashboard        1         1         2m52s
statefulset.apps/codis-prod-zookeeper   3         3         2m52s
statefulset.apps/codis-server           6         6         2m52s
```