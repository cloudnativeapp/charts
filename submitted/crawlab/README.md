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
# helm v2
$ helm install --name my-crawlab crawlab

# helm v3
$ helm install my-crawlab crawlab
```

这条命令会以默认的配置将Crawlab部署到Kubernetes集群。[configuration](#configuration) 一节列出了安装时可以配置的参数。

## Uninstalling the Chart

卸载此次部署：

```bash
# helm v2
$ helm delete my-crawlab

# helm v3
$ helm uninstall my-crawlab
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
| `service.frontendNodePort`              | 当serivce类型为`NodePort`时，用户访问Crawlab时前端的节点端口            | `nil`                                     |
| `service.backendNodePort`               | C当serivce类型为`NodePort`时，用户访问Crawlab时后端的节点端口           | `nil`                                     |
| `ingress.enabled`                       | 启用ingress                                                        | `false`                                     |
| `ingress.ingressNodePort`               | ingress暴露在外的nodePort，用于Crawlab前端页面配置后端服务的对外地址      | `nil`                                    |
| `ingress.annotations`                   | ingress的annotations                                               | `{}`                                       |
| `ingress.hosts.frontendHost`            | Crawlab前端的ingress host                                           | `nil`                                     |
| `ingress.hosts.backendHost`             | Crawlab后端的ingress host                                           | `nil`                                     |
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

## Using the configuration

通过`helm install`命令的`--set key=value[,key=value]`，为安装添加不同的配置。例如：

1. 通过`NodePort`形式将Crawlab的访问方式暴露到集群外部

```bash
$ helm install my-crawlab crawlab --set service.type=NodePort,service.nodeIp=10.100.0.200,service.frontendNodePort=30001,service.backendNodePort=30002
```
2. 通过`ingress`将Crawlab的访问方式暴露到集群外部

```bash
$ helm install my-crawlab crawlab --set ingress.enabled=true,ingress.ingressNodePort=30999,ingress.hosts.frontendHost=frontend.crawlab-example.local,ingress.hosts.backendHost=backend.crawlab-example.local
```

## Replication

Crawlab是一个分布式框架，通过增加`replicaCount.workerCount`，可以快速地扩展worker节点数量，增加Crawlab的处理能力。

```bash
$ helm install my-crawlab crawlab --set replicaCount.workerCount=3
```

## Production settings and persistence

默认的配置中，将mongodb和redis的persistence volume关掉了。如果是生产环境的配置，请参考[mongodb values-production.yaml](https://github.com/cloudnativeapp/charts/blob/master/curated/mongodb/values-production.yaml)和[redis values-production.yaml](https://github.com/cloudnativeapp/charts/blob/master/curated/redis/values-production.yaml)修改配置。
