# Nacos Helm Chart

Nacos is committed to help you discover, configure, and manage your microservices. It provides a set of simple and useful features enabling you to realize dynamic service discovery, service configuration, service metadata and traffic management.

## Introduction

This project is based on the Helm Chart packaged by [nacos-k8s](https://github.com/nacos-group/nacos-k8s/).

## Prerequisites

 - Kubernetes 1.10+ 
 - Helm v3 
 - PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with `release name`:

```shell
$ helm install `release name` ./nacos
```

The command deploys Nacos on the Kubernetes cluster in the default configuration. It will run without a mysql chart and persistent volume. The [configuration](#configuration) section lists the parameters that can be configured during installation. 

### Service & Configuration Management

#### Service registration
```shell
curl -X POST 'http://$NODE_IP:$NODE_PORT/nacos/v1/ns/instance?serviceName=nacos.naming.serviceName&ip=20.18.7.10&port=8080'
```

#### Service discovery
```shell
curl -X GET 'http://$NODE_IP:$NODE_PORT/nacos/v1/ns/instance/list?serviceName=nacos.naming.serviceName'
```
#### Publish config
```shell
curl -X POST "http://$NODE_IP:$NODE_PORT/nacos/v1/cs/configs?dataId=nacos.cfg.dataId&group=test&content=helloWorld"
```
#### Get config
```shell
curl -X GET "http://$NODE_IP:$NODE_PORT/nacos/v1/cs/configs?dataId=nacos.cfg.dataId&group=test"
```



> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete `release name`:

```shell
$ helm uninstall `release name`
```
The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the Skywalking chart and their default values.

| Parameter                             | Description                                                        | Default                             |
|---------------------------------------|--------------------------------------------------------------------|-------------------------------------|
| `global.mode`                         | Run Mode (quickstart, standalone, cluster; quickstart: without mysql and pv)   | `quickstart`            |
| `global.storageClass.provisioner`     | Global storage class provisioner                                   | `nil`                               |
| `mysql.resources`                     | The [resources] to allocate for mysql container                    | `{}`                                |
| `mysql.nodeSelector`                  | Mysql labels for master and slave pod assignment                   | `{}`                                |
| `mysql.affinity`                      | Mysql affinity policy                                              | `{}`                                |
| `mysql.tolerations`                   | Mysql tolerations                                                  | `{}`                                |
| `mysql.replication.user`              | Master-slave replication username                                  | `nacos_ru`                          |
| `mysql.replication.password`          | Master-slave replication password                                  | `nacos_ru`                          |
| `mysql.image.pullPolicy`              | Mysql container image pull policy                                  | `IfNotPresent`                      |
| `mysql.master.annotations`            | Mysql master annotations                                           | `{}`                                |
| `mysql.master.image.repository`       | Mysql master container image name                                  | `nacos/nacos-mysql-master`          |
| `mysql.master.image.tag`              | Mysql master container image tag                                   | `latest`                            |
| `mysql.master.rootPassword`           | Mysql master root password                                         | `root`                              |
| `mysql.master.database`               | Nacos database name                                                | `nacos_devtest`                     |
| `mysql.master.user`                   | Nacos database user                                                | `nacos`                             |
| `mysql.master.password`               | Nacos database password                                            | `nacos`                             |
| `mysql.master.classParameters`        | Mysql master storageclass parameters                               | `{}`                                |
| `mysql.master.persistence.enabled`    | Enable the Mysql master data persistence or not                    | `false`                             |
| `mysql.master.persistence.existingClaim`|Use the existing PVC which must be created manually before bound, and specify the `subPath` if the PVC is shared with other components                                        | `mysql-master-data`        |
| `mysql.master.persistence.claim.name`      | Mysql master pvc name                                         | `mysql-master-data`                 |
| `mysql.master.persistence.claim.spec.accessModes` | Mysql master pvc access mode                           | `ReadWriteOnce`                     |
| `mysql.master.persistence.claim.spec.resources.requests.storage`  | Mysql master pvc requests storage      | `5G`                                |
| `mysql.master.persistence.claim.spec.storageClassName`|  Mysql master pvc storage class name               | `sc-mysql-master`                   |
| `mysql.master.service.port`           | Mysql master service port                                          | `3306`                              |
| `mysql.slave.annotations`             | Mysql slave annotations                                            | `{}`                                |
| `mysql.slave.image.repository`        | Mysql slave container image name                                   | `nacos/nacos-mysql-slave`          |
| `mysql.slave.image.tag`               | Mysql slave container image tag                                    | `latest`                            |
| `mysql.slave.rootPassword`            | Mysql slave root password                                          | `root`                              |
| `mysql.slave.classParameters`        | Mysql slave storageclass parameters                                | `{}`                                |
| `mysql.slave.persistence.enabled`    | Enable the mysql slave data persistence or not                    | `false`                             |
| `mysql.slave.persistence.existingClaim`|Use the existing PVC which must be created manually before bound, and specify the `subPath` if the PVC is shared with other components                                        | `mysql-slave-data`        |
| `mysql.slave.persistence.claim.name`      | Mysql slave pvc name                                         | `mysql-slave-data`                 |
| `mysql.slave.persistence.claim.spec.accessModes` | Mysql slave pvc access mode                           | `ReadWriteOnce`                     |
| `mysql.slave.persistence.claim.spec.resources.requests.storage`  | Mysql slave pvc requests storage      | `5G`                                |
| `mysql.slave.persistence.claim.spec.storageClassName`|  Mysql slave pvc storage class name               | `sc-mysql-slave`                   |
| `mysql.slave.service.port`           | Mysql slave service port                                          | `3306`                              |
| `resources`                          | The [resources] to allocate for nacos container                    | `{}`                                |
| `nodeSelector`                       | Nacos labels for pod assignment                   | `{}`                                |
| `affinity`                           | Nacos affinity policy                                              | `{}`                                |
| `tolerations`                         | Nacos tolerations                                                  | `{}`                                |
| `resources.requests.cpu`|nacos requests cpu resource|`500m`|
| `resources.requests.memory`|nacos requests memory resource|`2G`|
| `replicaCount`                        | Number of desired nacos pods, the number should be 1 as run quickstart or standalone mode| `1`           |
| `image.repository`                    | Nacos container image name                                      | `nacos/nacos-server`                   |
| `image.tag`                           | Nacos container image tag                                       | `0.9.0`                                |
| `image.pullPolicy`                    | Nacos container image pull policy                                | `IfNotPresent`                        |
| `health.enabled`                      | Enable health check or not                                         | `false`                              |
| `env.preferhostmode`                  | Enable Nacos cluster node domain name support                      | `hostname`                         |
| `env.serverPort`                      | Nacos port                                                         | `8848`                               |
| `persistence.enabled`                 | Enable the nacos data persistence or not                           | `false`                              |
| `persistence.storageClassName`        | Nacos storage class name                                           | `sc-nacos`                   |
| `persistence.classParameters`                     | Nacos storageclass parameters                                      | `{}`
| `persistence.data.accessModes` | Nacos data pvc access mode                           | `ReadWriteOnce`                     |
| `persistence.data.storageClassName`  | Nacos data pvc storage class name      | `sc-nacos`                                |
| `persistence.data.resources.requests.storage` | Nacos data pvc requests storage             | `5G`                   |
| `persistence.plugin.accessModes` | Nacos plugin pvc access mode (Available as cluster mode)                       | `ReadWriteOnce`                     |
| `persistence.plugin.storageClassName`  | Nacos plugin pvc storage class name (Available as cluster mode)      | `sc-nacos`                                |
| `persistence.plugin.resources.requests.storage` | Nacos plugin pvc requests storage (Available as cluster mode)             | `5G`                   |
| `persistence.log.accessModes` | Nacos log pvc access mode (Available as cluster mode)                           | `ReadWriteOnce`                     |
| `persistence.log.storageClassName`  | Nacos log pvc storage class name (Available as cluster mode)      | `sc-nacos`                                |
| `persistence.log.resources.requests.storage` | Nacos log pvc requests storage (Available as cluster mode)| `5G`          |
| `service.type` | service type | `NodePort` |
| `service.port` | service port | `8848` |
| `service.nodePort` | service nodeport                 | `30000`                     |
| `ingress.enabled` | Enable ingress or not | `false` |
| `ingress.annotations` | The annotations used in ingress | `{}` |
| `ingress.hosts` | The host of nacos service in ingress rule | `nacos.example.com` |


## Example
![img](./images/nacos.png)
#### quickstart mode(without mysql)
```console
$ helm install `release name` ./ --set global.mode=quickstart
```
![img](./images/quickstart.png)

#### standalone mode(without pv)
```console
$ helm install `release name` ./ --set global.mode=standalone
```
![img](./images/standalone.png)


> **Tip**: if the logs of nacos pod throws exception, you may need to delete the pod. Because mysql pod is not ready, nacos pod has been started.

#### cluster mode(without pv)
```console
$ helm install `release name` ./ --set global.mode=cluster
```
![img](./images/cluster1.png)

```console
$ kubectl scale sts `release name`-nacos --replicas=3
```
![img](./images/cluster2.png)

 * Use kubectl exec to get the cluster config of the Pods in the nacos StatefulSet after scale StatefulSets
 
![img](./images/cluster3.png)
