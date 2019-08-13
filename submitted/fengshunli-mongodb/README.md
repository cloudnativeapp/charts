## Prerequisites

- Kubernetes 1.4+ with Beta APIs enabled
- PV provisioner support in the underlying infrastructure

## Configuration

The following table lists the configurable parameters of the MongoDB chart and their default values.

|         Parameter                   |             Description                    |                         Default                          |
|----------------------------         |-------------------------------------       |----------------------------------------------------------|
| `image.registry`                    | MongoDB image registry                     | `docker.io`                                              |
| `image.repository`                  | MongoDB Image name                         | `bitnami/mongodb`                                        |
| `image.tag`                         | MongoDB Image tag                          | `{VERSION}`                                              |
| `image.pullPolicy`                  | Image pull policy                          | `Always` if `imageTag` is `latest`, else `IfNotPresent`  |
| `image.pullSecrets`                 | Specify image pull secrets                 | `nil`                                                    |
| `mongodbRootPassword`               | MongoDB admin password                     | `random alhpanumeric string (10)`                        |
| `mongodbUsername`                   | MongoDB custom user                        | `nil`                                                    |
| `mongodbPassword`                   | MongoDB custom user password               | `random alhpanumeric string (10)`                        |
| `mongodbDatabase`                   | Database to create                         | `nil`                                                    |
| `mongodbExtraFlags`                 | MongoDB additional command line flags      | []                                                       |
| `service.type`                      | Kubernetes Service type                    | `ClusterIP`                                              |
| `service.nodePort`                  | Port to bind to for NodePort service type  | `nil`                                                    |
| `persistence.enabled`               | Use a PVC to persist data                  | `true`                                                   |
| `persistence.storageClass`          | Storage class of backing PVC               | `nil` (uses alpha storage class annotation)              |
| `persistence.accessMode`            | Use volume as ReadOnly or ReadWrite        | `ReadWriteOnce`                                          |
| `persistence.size`                  | Size of data volume                        | `8Gi`                                                    |
| `nodeSelector`                      | Node labels for pod assignment             | {}                                                       |
| `livenessProbe.initialDelaySeconds` | Delay before liveness probe is initiated   | 30                                                       |
| `livenessProbe.periodSeconds`       | How often to perform the probe             | 10                                                       |
| `livenessProbe.timeoutSeconds`      | When the probe times out                   | 5                                                        |
| `livenessProbe.successThreshold`    | Minimum consecutive successes for the probe to be considered successful after having failed.     |  1 |
| `livenessProbe.failureThreshold`    | Minimum consecutive failures for the probe to be considered failed after having succeeded.       |  6 |
| `readinessProbe.initialDelaySeconds`| Delay before readiness probe is initiated                                                        |  5 |
| `readinessProbe.periodSeconds`      | How often to perform the probe                                                                   | 10 |
| `readinessProbe.timeoutSeconds`     | When the probe times out                                                                         |  5 |
| `readinessProbe.successThreshold`   | Minimum consecutive successes for the probe to be considered successful after having failed.     |  1 |
| `readinessProbe.failureThreshold`   | Minimum consecutive failures for the probe to be considered failed after having succeeded.       |  6 |

The above parameters map to the env variables defined in [bitnami/mongodb](http://github.com/bitnami/bitnami-docker-mongodb). For more information please refer to the [bitnami/mongodb](http://github.com/bitnami/bitnami-docker-mongodb) image documentation.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

## 安装使用

### helm install
```shell
打包Chart
$ helm package fengshunli-mongodb

本地安装
$ helm install fengshunli-mongodb fengshunli-mongodb-0.1.0.tgz
```


