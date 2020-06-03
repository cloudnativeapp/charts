# Milvus Helm Chart

For more information about installing and using Helm, see the [Helm Docs](https://helm.sh/docs/). For a quick introduction to Charts, see the [Chart Guide](https://helm.sh/docs/topics/charts/).

To install Milvus, refer to [Milvus installation](https://milvus.io/docs/guides/get_started/install_milvus/install_milvus.md).

## Introduction
This chart bootstraps Milvus deployment on a Kubernetes cluster using the Helm package manager.

## Prerequisites

- Kubernetes 1.10+
- Helm >= 2.12.0

## Installing the Chart

1. Add the stable repository
```bash
$ helm repo add stable https://kubernetes-charts.storage.googleapis.com
```
2. Install Chart dependencies
```bash
# in 'milvus-helm/'
$ helm dep update
```
3. Install Helm package

To install the chart with the release name `my-release`:

```bash
# Helm v2.x
$ cd milvus-helm
$ helm install --name my-release .
```

or

```bash
# Helm v3.x
$ cd milvus-helm
$ helm install my-release  .
```

> **Tip**: To list all releases, using `helm list`.

### Deploying Milvus with cluster enabled

```bash
$ helm install --set cluster.enabled=true --set persistence.enabled=true my-release  .
```

> **NOTE:** Since all Pods should have the same collection of Milvus files, it is recommended to create just one PV
that is shared. This is controlled by setting `persistence.enabled=true`. You will have to ensure yourself the
PVC are shared properly between your pods:
- If you are on AWS, you can use [Elastic File System (EFS)](https://aws.amazon.com/efs/).
- If you are on Azure, you can use
[Azure File Storage (AFS)](https://docs.microsoft.com/en-us/azure/aks/azure-files-dynamic-pv).

To share a PV with multiple Pods, the PV needs to have accessMode 'ReadOnlyMany' or 'ReadWriteMany'.

## Uninstall the Chart

To uninstall/delete the my-release deployment:

```bash
# Helm v2.x
$ helm delete my-release
```

or

```bash
# Helm v3.x
$ helm uninstall my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

### Milvus server Configuration

The following table lists the configurable parameters of the Milvus chart and their default values.

| Parameter                                 | Description                                   | Default                                                 |
|-------------------------------------------|-----------------------------------------------|---------------------------------------------------------|
| `version`                                 | Configuration Version                         | `0.4`                                                   |
| `primaryPath`                             | Primary directory used to save meta data, vector data and index data. | `/var/lib/milvus`               |
| `timeZone`                                | Use UTC-x or UTC+x to specify a time zone.    | `UTC+8`                                                 |
| `backendURL`                              | URI format: dialect://username:password@host:port/database. Replace 'dialect' with 'mysql' or 'sqlite' | `""` |
| `useBLASThreshold`                        | BLAS threshold                                | `1100`                                                  |
| `gpuSearchThreshold`                      | GPU search threshold                          | `1100`                                                  |
| `autoFlushInterval`                       | The interval, in seconds, at which Milvus automatically flushes data to disk. 0 means disable the regular flush. (s) | `1` |
| `fileCleanupTimeout`                      | The time gap between marking a file as 'deleted' and physically deleting this file from disk, range [0, 3600]. (s) | `10` |
| `logs.path`                               | Absolute path to the folder holding the log files. | `/var/lib/milvus/logs`                             |
| `logs.maxLogFileSize`                     | The maximum size of each log file, size range [512, 4096]. (MB) | `1024`                                |
| `logs.logRotateNum`                       | The maximum number of log files that Milvus keeps for each logging level, num range [0, 1024], 0 means unlimited. | `0` |
| `cache.insertBufferSize`                  | Maximum insert buffer size allowed (GB)       | `1`                                                     |
| `cache.cpuCacheCapacity`                  | Size of CPU memory used for cache  (GB)       | `4`                                                     |
| `cache.cacheInsertData`                   | Load inserted data into cache                 | `false`                                                 |
| `web.enabled`                             | Enable web server or not.                     | `true`                                                  |
| `web.port`                                | Port that Milvus web server monitors.         | `19121`                                                 |
| `wal.enabled`                             | Enable write-ahead logging.                   | `true`                                                  |
| `wal.ignoreErrorLog`                      | Whether to ignore logs with errors that happens during WAL | `true`                                     |
| `wal.bufferSize`                          | Sum total of the read buffer and the write buffer. (MB) | `256`                                         |
| `wal.path`                                | Location of WAL log files.                    | `/var/lib/milvus/db/wal`                                |
| `gpu.enabled`                             | Enable GPU resources                          | `false`                                                 |
| `gpu.cacheCapacity`                       | Size of GPU memory per card used for cache (GB) | `1`                                                   |
| `gpu.searchResources`                     | Define the GPU devices used for search computation | `[gpu0]`                                           |
| `gpu.buildIndexResources`                 | Define the GPU devices used for index building | `[gpu0]`                                               |
| `metrics.enabled`                         | Set this to `true` to enable exporting Prometheus monitoring metrics | `false`                          |
| `metrics.address`                         | Pushgateway address                           | `127.0.0.1`                                             |
| `metrics.port`                            | Prometheus monitoring metrics port            | `9091`                                                  |
| `readonly.useBLASThreshold`                        | BLAS threshold of Readonly nodes              | `1100`                                                  |
| `readonly.gpuSearchThreshold`                      | GPU search threshold of Readonly nodes        | `1100`                                                  |
| `readonly.logs.path`                               | Absolute path to the folder holding the log files. | `/var/lib/milvus/logs`                             |
| `readonly.logs.maxLogFileSize`                     | The maximum size of each log file, size range [512, 4096]. (MB) | `1024`                                |
| `readonly.logs.logRotateNum`                       | The maximum number of log files that Milvus keeps for each logging level, num range [0, 1024], 0 means unlimited. | `0` |
| `readonly.cache.insertBufferSize`                  | Maximum insert buffer size allowed (GB)       | `1`                                                     |
| `readonly.cache.cpuCacheCapacity`                  | Size of CPU memory used for cache  (GB)       | `4`                                                     |
| `readonly.cache.cacheInsertData`                   | Load inserted data into cache                 | `false`                                                 |
| `readonly.gpu.enabled`                             | Enable GPU resources                          | `false`                                                 |
| `readonly.gpu.cacheCapacity`                       | Size of GPU memory per card used for cache (GB) | `1`                                                   |
| `readonly.gpu.searchResources`                     | Define the GPU devices used for search computation | `[gpu0]`                                           |
| `readonly.gpu.buildIndexResources`                 | Define the GPU devices used for index building | `[gpu0]`                                               |


### Milvus Deployment Configuration

The following table lists the configurable parameters of the Milvus chart and their default values.

| Parameter                                 | Description                                   | Default                                                 |
|-------------------------------------------|-----------------------------------------------|---------------------------------------------------------|
| `cluster.enabled`                         | Create a Milvus cluster                       | `false`                                                 |
| `replicas`                                | Number of nodes                               | `1`                                                     |
| `initContainerImage`                      | Init container image                          | `alpine:3.8`                                            |
| `image.repository`                        | Image repository                              | `milvusdb/milvus`                                       |
| `image.tag`                               | Image tag                                     | `0.9.1-cpu-d052920-e04ed5`                                            |
| `image.pullPolicy`                        | Image pull policy                             | `IfNotPresent`                                          |
| `image.pullSecrets`                       | Image pull secrets                            | `{}`                                                    |
| `resources`                               | CPU/GPU/Memory resource requests/limits       | `{}`                                                    |
| `extraInitContainers`                     | Additional init containers                    | `[]`                                                    |
| `extraContainers`                         | Additional containers                         | `unset`                                                 |
| `extraVolumes`                            | Additional volumes for use in extraContainers | `unset`                                                 |
| `extraVolumeMounts`                       | Additional volume mounts to add to the pods   | `unset`                                                 |
| `extraConfigFiles`                        | Content of additional configuration files.    | `{}`                                                    |
| `livenessProbe`                           | Liveness Probe settings                       | `{ "tcpSocket": { "port": 19530 } "initialDelaySeconds": 15, "periodSeconds": 15, "timeoutSeconds": 10, "failureThreshold": 5 }` |
| `readinessProbe`                          | Readiness Probe settings                      | `{ "tcpSocket": { "port": 19530 } "initialDelaySeconds": 15, "periodSeconds": 15, "timeoutSeconds": 10, "failureThreshold": 3 }` |
| `service.type`                            | Kubernetes service type                       | `ClusterIP`                                             |
| `service.port`                            | Kubernetes port where service is exposed      | `19530`                                                 |
| `service.nodePort`                        | Kubernetes service nodePort                   | `unset`                                                 |
| `service.webNodePort`                     | Kubernetes web server nodePort                | `unset`                                                 |
| `service.metricsNodePort`                 | Kubernetes metrics server nodePort            | `unset`                                                 |
| `service.annotations`                     | Service annotations                           | `{}`                                                    |
| `service.labels`                          | Custom labels                                 | `{}`                                                    |
| `service.clusterIP`                       | Internal cluster service IP                   | `unset`                                                 |
| `service.loadBalancerIP`                  | IP address to assign to load balancer (if supported) | `unset`                                          |
| `service.loadBalancerSourceRanges`        | list of IP CIDRs allowed access to lb (if supported) | `[]`                                             |
| `serivce.externalIPs`                     | service external IP addresses                 | `[]`                                                    |
| `persistence.enabled`                     | Use persistent volume to store data           | `false`                                                 |
| `persistence.annotations`                 | PersistentVolumeClaim annotations             | `{}`                                                    |
| `persistence.persistentVolumeClaim.existingClaim` | Use your own data Persistent Volume existing claim name | `unset`                               |
| `persistence.persistentVolumeClaim.storageClass` | The Milvus data Persistent Volume Storage Class | `unset`                                        |
| `persistence.persistentVolumeClaim.accessModes` | The Milvus data Persistence access modes | `ReadWriteMany`                                        |
| `persistence.persistentVolumeClaim.size` | The size of Milvus data Persistent Volume Storage Class | `50Gi`                                         |
| `persistence.persistentVolumeClaim.subPath` | SubPath for Milvus data mount               | `unset`                                                 |
| `logsPersistence.enabled`                 | Use persistent volume to store logs           | `false`                                                 |
| `logsPersistence.annotations`             | PersistentVolumeClaim annotations             | `{}`                                                    |
| `logsPersistence.persistentVolumeClaim.existingClaim` | Use your own logs Persistent Volume existing claim name | `unset`                           |
| `logsPersistence.persistentVolumeClaim.storageClass` | The Milvus logs Persistent Volume Storage Class | `unset`                                    |
| `logsPersistence.persistentVolumeClaim.accessModes` | The Milvus logs Persistence access modes | `ReadWriteMany`                                    |
| `logsPersistence.persistentVolumeClaim.size` | The size of Milvus logs Persistent Volume Storage Class | `5Gi`                                      |
| `logsPersistence.persistentVolumeClaim.subPath` | SubPath for Milvus logs mount               | `unset`                                             |
| `nodeSelector`                            | Node labels for pod assignment                | `{}`                                                    |
| `tolerations`                             | Toleration labels for pod assignment          | `[]`                                                    |
| `affinity`                                | Affinity settings for pod assignment          | `{}`                                                    |
| `podAnnotations`                          | Additional pod annotations                    | `{}`                                                    |
| `podDisruptionBudget.minAvailable`        | Pod disruption minimum available              | `unset`                                                 |
| `podDisruptionBudget.maxUnavailable`      | Pod disruption maximum unavailable            | `unset`                                                 |
| `mishards.image.repository`               | Mishards image repository                     | `milvusdb/mishards`                                     |
| `mishards.image.tag`                      | Mishards image tag                            | `0.9.1`                                                |
| `mishards.image.pullPolicy`               | Mishards image pull policy                    | `IfNotPresent`                                          |
| `mishards.replicas`                       | Number of mishards nodes                      | `1`                                                     |
| `mishards.resources`                      | Mishards CPU/GPU/Memory resource requests/limits | `{}`                                                 |
| `readonly.replicas`                 | Number of readonly nodes                      | `1`                                                     |
| `mishards.resources`                      | Mishards CPU/GPU/Memory resource requests/limits | `{}`                                                 |
| `admin.enabled`                           | Enable deployment of Milvus admin             | `false`                                                 |
| `admin.image.repository`                  | Milvus Admin image repository                 | `milvusdb/milvus-admin`                                 |
| `admin.image.tag`                         | Milvus Admin image tag                        | `v0.3.0`                                                |
| `admin.image.pullPolicy`                  | Milvus Admin image pull policy                | `IfNotPresent`                                          |
| `admin.replicas`                          | Number of Milvus Admin nodes                  | `1`                                                     |
| `admin.resources`                         | Milvus Admin CPU/GPU/Memory resource requests/limits | `{}`                                             |


### MySQL Configuration

The following table lists the configurable parameters of the mysql chart and their default values.

| Parameter                                 | Description                                   | Default                                                 |
|-------------------------------------------|-----------------------------------------------|---------------------------------------------------------|
| `mysql.enable`                            | Enable deployment of MySQL                    | `true`                                                  |
| `mysql.mysqlDatabase`                     | Database name                                 | `milvus`                                                |
| `mysql.imageTag`                          | Image targe                                   | `5.7.14`                                                |
| `mysql.imagePullPolicy`                   | Image pull policy                             | `IfNotPresent`                                          |
| `mysql.mysqlUser`                         | Username of new user to create.               | `milvus`                                                |
| `mysql.mysqlPassword`                     | Password for the new user. Ignored if existing secret is provided | `milvus`                            |
| `mysql.mysqlRootPassword`                 | Password for the root user. Ignored if existing secret is provided | `milvusroot`                       |
| `mysql.configurationFiles`                | List of mysql configuration files             | `...`                                                   |
| `mysql.initializationFiles`               | List of SQL files which are run after the container started | `...`                                     |
| `mysql.persistence.enabled`               | Create a volume to store data                 | `true`                                                  |
| `mysql.persistence.existingClaim`         | Name of existing persistent volume            | `unset`                                                 |
| `mysql.persistence.annotations`           | Persistent Volume annotations                 | `{}`                                                    |
| `mysql.persistence.storageClass`          | Type of persistent volume claim               | `unset`                                                 |
| `mysql.persistence.accessMode`            | ReadWriteOnce or ReadOnly                     | `ReadWriteOnce`                                         |
| `mysql.persistence.size`                  | Size of persistent volume claim               | `8Gi`                                                   |
