# Crawlab

[Crawlab](https://github.com/tikazyq/crawlab)是一个基于Golang的分布式爬虫管理平台，支持Python、NodeJS、Go、Java、PHP等多种编程语言以及多种爬虫框架。

## Installing the Chart

Crawlab依赖mongodb和redis，这两个应用的chart可以在阿里云的[App Hub](https://developer.aliyun.com/hub/)下载。

1. helm repo中添加阿里云App Hub：

```bash
$ helm repo add apphub https://apphub.aliyuncs.com/
```

2. 更新crawlab的chart依赖，或者手动将依赖下载到`crawlab/charts/`：

```bash
$ helm dependency update crawlab
```

3. 安装此chart，release名称设置为`my-crawlab`：

```bash
$ helm install --name my-crawlab crawlab
```

这条命令会以默认的配置将Crawlab部署到Kubernetes集群。[configuration](#configuration) 一节列出了安装时可以配置的参数。


## Verifying the deployment

1. 查看部署的资源是否ready：
```bash
# kubectl get po
NAME                                  READY     STATUS    RESTARTS   AGE
my-crawlab-master-5c6fcf9db9-8sp44    1/1       Running   0          9m
my-crawlab-mongodb-7766d6b5d6-2pjp9   1/1       Running   0          9m
my-crawlab-redis-master-0             1/1       Running   0          9m
my-crawlab-redis-slave-0              1/1       Running   0          9m
my-crawlab-redis-slave-1              1/1       Running   0          8m
my-crawlab-worker-8577f97df7-6vchs    1/1       Running   0          9m
my-crawlab-worker-8577f97df7-8nlr2    1/1       Running   2          9m
# kubectl get svc
NAME                        TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)             AGE
kubernetes                  ClusterIP   172.19.0.1      <none>        443/TCP             1d
my-crawlab                  ClusterIP   172.19.15.192   <none>        8080/TCP,8000/TCP   9m
my-crawlab-mongodb          ClusterIP   172.19.11.127   <none>        27017/TCP           9m
my-crawlab-redis-headless   ClusterIP   None            <none>        6379/TCP            9m
my-crawlab-redis-master     ClusterIP   172.19.14.73    <none>        6379/TCP            9m
my-crawlab-redis-slave      ClusterIP   172.19.15.125   <none>        6379/TCP            9m
# kubectl get ing
NAME         HOSTS                                                          ADDRESS   PORTS     AGE
my-crawlab   frontend.crawlab-example.local,backend.crawlab-example.local             80        9m
```

2. 浏览器访问`http://frontend.crawlab-example.local:32080`，进入Crawlab的登录界面，初始的用户名/密码是`admin/admin`。登录后，可以查看到当前有两个工作节点，并可以运行爬虫任务。


## Uninstalling the Chart

卸载此次部署：

```bash
$ helm delete my-crawlab
```

## Configuration

下表列出了Crawlab chart主要的配置参数含义及默认值。

|         Parameter                       |             Description                                           |           Default                          |
|-----------------------------------------|-------------------------------------------------------------------|--------------------------------------------|
| `image.repository`                      | Crawlab的镜像地址                                                   | `docker.io/tikazyq/crawlab`                |
| `image.tag`                             | Crawlab的镜像tag                                                   | `latest`                                   |
| `image.pullPolicy`                      | Crawlab的镜像拉取策略                                                | `IfNotPresent`                             |
| `replicaCount.masterCount`              | Crawlab的master节点数量                                             | `1`                                        |
| `replicaCount.workerCount`              | Crawlab的worker节点数量，增加worker节点数量来水平扩展Crawlab的处理能力    | `2`                                        |
| `service.type`                          | Kubernetes Service type，`ClusterIP`和`NodePort`都经过测试           | `ClusterIP`                                |
| `service.frontendPort`                  | Crawlab前端的service端口                                            | `8080`                                     |
| `service.backendPort`                   | Crawlab后端的service端口                                            | `8000`                                     |
| `service.nodeIp`                        | 当serivce类型为`NodePort`时，用户访问Crawlab时用的IP                   | `nil`                                      |
| `service.frontendNodePort`              | 当serivce类型为`NodePort`时，用户访问Crawlab时前端的节点端口            | `nil`                                       |
| `service.backendNodePort`               | C当serivce类型为`NodePort`时，用户访问Crawlab时后端的节点端口           | `nil`                                       |
| `ingress.enabled`                       | 启用ingress                                                        | `true`                                     |
| `ingress.ingressNodePort`               | ingress暴露在外的nodePort，用于Crawlab前端页面配置后端服务的对外地址      | `32080`                                    |
| `ingress.annotations`                   | ingress的annotations                                               | `{}`                                       |
| `ingress.hosts.frontendHost`            | Crawlab前端的ingress host                                           | `frontend.crawlab-example.local`           |
| `ingress.hosts.backendHost`             | Crawlab后端的ingress host                                           | `backend.crawlab-example.local`            |
| `resources`                             | Pod resources                                                      | {}                                         |
| `nodeSelector`                          | Node labels for pod assignment                                     | {}                                         |
| `tolerations`                           | Toleration labels for pod assignment                               | []                                         |
| `affinity`                              | Affinity for pod assignment                                        | {}                                         |
| `mongodb.usePassword`                   | mongodb启用密码认证                                                  | `true`                                     |
| `mongodb.mongodbRootPassword`           | mongodb的管理员密码                                                  | `random alphanumeric string (10)`          |
| `mongodb.mongodbUsername`               | 新建mongodb用户，用于Crawlab                                         | `nil`                                      |
| `mongodb.mongodbPassword`               | 新建mongodb用户的密码                                                | `random alphanumeric string (10)`          |
| `mongodb.mongodbDatabase`               | 新建mongodb数据库，用于Crawlab                                        | `nil`                                     |
| `mongodb.service.port`                  | mongodb的service端口                                                | `1`                                        |
| `mongodb.persistence.enabled`           | 启用永久存储                                                         | `false`                                    |
| `redis.usePassword`                     | 启用redis密码认证                                                    | `true`                                     |
| `redis.password`                        | redis的认证密码                                                      | `random alphanumeric string (10)`         |
| `redis.master.service.port`             | redis master的service端口                                           | `6379`                                     |
| `redis.master.persistence.enabled`      | redis master启用永久存储                                             | `false`                                    |
| `redis.slave.persistence.enabled`       | redis slave启用永久存储                                              | `false`                                    |


## Replication

Crawlab是一个分布式框架，通过增加`replicaCount.workerCount`，可以快速地扩展worker节点数量，增加Crawlab的处理能力。

```bash
$ helm install --name my-crawlab stable/mongodb --set replicaCount.workerCount=3
```


## Production settings and persistence

默认的配置中，将mongodb和redis的persistence volume关掉了。如果是生产环境的配置，请参考[mongodb values-production.yaml](https://github.com/cloudnativeapp/charts/blob/master/curated/mongodb/values-production.yaml)和[redis values-production.yaml](https://github.com/cloudnativeapp/charts/blob/master/curated/redis/values-production.yaml)修改配置。

## 其他


