# cassandra

[Apache Cassandra](https://cassandra.apache.org) is a free and open-source distributed database management system designed to handle large amounts of data across many commodity servers or datacenters.

## TL;DR;

```console
$ helm install <helm-repo>/cassandra
```

$ helm install bitnami/cassandra
## Introduction

This chart bootstraps a [Cassandra](https://github.com/bitnami/bitnami-docker-cassandra) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Bitnami charts can be used with [Kubeapps](https://kubeapps.com/) for deployment and management of Helm Charts in clusters. This Helm chart has been tested on top of [Bitnami Kubernetes Production Runtime](https://kubeprod.io/) (BKPR). Deploy BKPR to get automated TLS certificates, logging and monitoring for your applications.

## Prerequisites

- Kubernetes 1.8+
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install --name my-release <helm-repo>/cassandra
```

$ helm install --name my-release bitnami/cassandra
The command deploys one node with Cassandra on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` release:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the cassandra chart and their default values.

| Parameter                                  | Description                                                                                                    | Default                                              |
|--------------------------------------------|----------------------------------------------------------------------------------------------------------------|------------------------------------------------------|
| `global.imageRegistry`                     | Global Docker Image registry                                                                                   | `nil`                                                |
| `global.imagePullSecrets`                  | Global Docker registry secret names as an array                                                                | `[]` (does not add image pull secrets to deployed pods) |
| `image.registry`                           | Cassandra Image registry                                                                                           | `docker.io`                                          |
| `image.repository`                         | Cassandra Image name                                                                                               | `bitnami/cassandra`                                      |
| `image.tag`                                | Cassandra Image tag                                                                                                | `{VERSION}`                                          |
| `image.pullPolicy`                         | Image pull policy                                                                                              | `Always`                                             |
| `image.pullSecrets`                        | Specify docker-registry secret names as an array                                                               | `[]` (does not add image pull secrets to deployed pods) |
| `service.type`                       | Kubernetes Service type                                                                          | `ClusterIP`                                          |
| `service.nodePort`                   | Kubernetes Service nodePort                                                                      | `nil`                                                |
| `service.loadBalancerIP`             | LoadBalancerIP if service type is `LoadBalancer`                                                   | `nil`                            |
| `service.annotations`                | Annotations for the service                                                                            | {}                                                   |
| `persistence.enabled`               | Use PVCs to persist data                                                                        | `true`                                               |
| `persistence.storageClass`          | Persistent Volume Storage Class                                                                                    | `generic`                                            |
| `persistence.annotations`                | Persistent Volume Claim annotations Annotations                                                                            | {}                                                   |
| `persistence.accessModes`           | Persistent Volume Access Modes                                                                                 | `[ReadWriteOnce]`                                    |
| `persistence.size`                  | Persistent Volume Size                                                                                             | `8Gi`                                                |
| `tlsEncryptionSecretName`                         | Secret with keystore, keystore password, truststore and truststore password                                                               |  `{}`                         |
| `resources`                         | CPU/Memory resource requests/limits                                                               |  `{}`                         |
| `existingConfiguration`             | Pointer to a configMap that contains custom Cassandra configuration files. This will override any Cassandra configuration variable set in the chart        |  `{}`                         |
| `cluster.name`                         | Cassandra cluster name                                                               |  `cassandra`                         |
| `cluster.replicaCount`                         | Number of Cassandra nodes                                                               |  `1`                         |
| `cluster.seedCount`                           | Number of seed nodes (note: must be greater or equal than 1 and less or equal to `cluster.replicaCount`)                                                   | `1`                                                |
| `cluster.numTokens`                           | Number of tokens for each node                                              | `256`                                                |
| `cluster.datacenter`                           | Datacenter name                                                  | `dc1`                                                |
| `cluster.rack`                           | Rack name                                                   | `rack1`                                                |
| `cluster.enableRPC`                           | Enable Thrift RPC endpoint                                    | `true`                  |
| `cluster.minimumAvailable`                           | Minimum nuber of instances that must be available in the cluster (used of PodDisruptionBudget)                                    | `1`                                                |
| `cluster.internodeEncryption`                           | Set internode encryption. NOTE: A value different from 'none' requires setting `tlsEncryptionSecretName`                                   | `none`                                                |
| `cluster.clientEncryption`                           | Set client-server encryption. NOTE: A value different from 'false' requires setting `tlsEncryptionSecretName`                                 | `false`                                                |
| `cluster.jvm.extraOpts`                           | Set the value for Java Virtual Machine extra optinos (JVM_EXTRA_OPTS)                                                   | `nil`                                                |
| `cluster.jvm.maxHeapSize`                           | Set Java Virtual Machine maximum heap size (MAX_HEAP_SIZE). Calculated automatically if `nil`                                                 | `nil`                                                |
| `cluster.jvm.newHeapSize`                           | Set Java Virtual Machine new heap size (HEAP_NEWSIZE). Calculated automatically if `nil`                                                 | `nil`                                                |
| `service.port`                           | CQL Port for the Kubernetes service                                                 | `9042`                                                |
| `service.thriftPort`                           | Thrift Port for the Kubernetes service                                                 | `9160`                                                |
| `dbUser.user`                           | Cassandra admin user                                                   | `cassandra`                                                |
| `dbUser.forcePassword`                           | Force the user to provide a non-empty password for `dbUser.user`                                                   | `false`                                                |
| `dbUser.password`                              | Password for `dbUser.user`. Randomly generated if empty                                                                                                   | (Random generated)                                               |
| `dbUser.existingSecret`                                 | Use an existing secret object for `dbUser.user` password (will ignore `dbUser.password`)                                                                 | `nil`                                   |
| `initDBConfigMap`                                 | Configmap for initialization CQL commands (done in the first node). Useful for creating keyspaces at startup, for instance                                                                 | `nil`                                   |
| `livenessProbe.enabled`             | Turn on and off liveness probe                                                             | `true`                                               |
| `livenessProbe.initialDelaySeconds` | Delay before liveness probe is initiated                                                    | `30`                                                 |
| `livenessProbe.periodSeconds`       | How often to perform the probe                                                             | `30`                                                 |
| `livenessProbe.timeoutSeconds`      | When the probe times out                                                                    | `5`                                                  |
| `livenessProbe.successThreshold`    | Minimum consecutive successes for the probe to be considered successful after having failed | `1`                                                  |
| `livenessProbe.failureThreshold`    | Minimum consecutive failures for the probe to be considered failed after having succeeded.                     | `5`                                                  |
| `readinessProbe.enabled`            | Turn on and off readiness probe                                                             | `true`                                               |
| `readinessProbe.initialDelaySeconds`| Delay before readiness probe is initiated                                                   | `5`                                                  |
| `readinessProbe.periodSeconds`      | How often to perform the probe                                                              | `10`                                                 |
| `readinessProbe.timeoutSeconds`     | When the probe times out                                                                    | `5`                                                  |
| `readinessProbe.successThreshold`   | Minimum consecutive successes for the probe to be considered successful after having failed | `1`                                                  |
| `readinessProbe.failureThreshold`   | Minimum consecutive failures for the probe to be considered failed after having succeeded.                     | `5`                                                  |
| `podAnnotations`                     | Additional pod annotations                                                                     | `{}`                              |
| `podLabels`                         | Additional pod labels                                                                         | `{}`                                                   |
| `statefulset.updateStrategy`        | Update strategy for StatefulSet                                                                                | onDelete                                             |
| `statefulset.rollingUpdatePartition`        | Partition update strategy                                                                                | `nil`                                             |
| `securityContext.enabled`           | Enable security context                                                                     | `true`                                               |
| `securityContext.fsGroup`           | Group ID for the container                                                                  | `1001`                                               |
| `securityContext.runAsUser`         | User ID for the container                                                                   | `1001`                                               |
| `affinity`                          | Enable node/pod affinity                                                                 | {}                                   |
| `tolerations`                       | Toleration labels for pod assignment                                                              | []                                                   |
| `networkPolicy.enabled`                    | Enable NetworkPolicy                                                                                           | `false`                                              |
| `networkPolicy.allowExternal`              | Don't require client label for connections                                                                     | `true`                                |
| `metrics.enabled`                          | Start a side-car prometheus exporter                                                                           | `false`                                              |
| `metrics.image.registry`                   | Cassandra exporter Image registry                                                                                  | `docker.io`                                          |
| `metrics.image.repository`                 | Cassandra exporter Image name                                                                                      | `criteo/cassandra_exporter`                           |
| `metrics.image.tag`                        | Cassandra exporter Image tag                                                                                       | `2.0.4`                                            |
| `metrics.image.pullPolicy`                 | Image pull policy                                                                                              | `IfNotPresent`                                       |
| `metrics.image.pullSecrets`                | Specify docker-registry secret names as an array                              | `[]` (does not add image pull secrets to deployed pods)                             |
| `metrics.podAnnotations`                   | Additional annotations for Metrics exporter                                                                 | `{prometheus.io/scrape: "true", prometheus.io/port: "8080"}`                                                   |
| `metrics.resources`                        | Exporter resource requests/limit                                                                               | `{}`                         |

The above parameters map to the env variables defined in [bitnami/cassandra](http://github.com/bitnami/bitnami-docker-cassandra). For more information please refer to the [bitnami/cassandra](http://github.com/bitnami/bitnami-docker-cassandra) image documentation.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,
$ helm install --name my-release \
  --set dbUser.user=admin,dbUser.password=password\
    <helm-repo>/cassandra
$ helm install --name my-release \
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
$ helm install --name my-release -f values.yaml <helm-repo>/cassandra
```

$ helm install --name my-release -f values.yaml bitnami/cassandra
> **Tip**: You can use the default [values.yaml](values.yaml)

## Persistence

The [Bitnami cassandra](https://github.com/bitnami/bitnami-docker-cassandra) image stores the cassandra data at the `/bitnami/cassandra` path of the container.

Persistent Volume Claims are used to keep the data across deployments. This is known to work in GCE, AWS, and minikube.
See the [Configuration](#configuration) section to configure the PVC or to disable persistence.

## Enable TLS for Cassandra

You can enable TLS between client and server and between nodes. In order to do so, you need to set the following values:

 * For internode cluster encryption, set `cluster.internodeEncryption` to a value different from `none`. Available values are `all`, `dc` or `rack`.
 * For client-server encryption, set `cluster.clientEncryption` to true.

In addition to this, you **must** create a secret containing the *keystore* and *truststore* certificates and their corresponding protection passwords. Then, set the `tlsEncryptionSecretName`  when deploying the chart.

You can create the secret with this command assuming you have your certificates in your working directory (replace the PUT_YOUR_KEYSTORE_PASSWORD and PUT_YOUR_TRUSTSTORE_PASSWORD placeholders):

```console
kubectl create secret generic casssandra-tls --from-file=./keystore --from-file=./truststore --from-literal=keystore-password=PUT_YOUR_KEYSTORE_PASSWORD --from-literal=truststore-password=PUT_YOUR_TRUSTSTORE_PASSWORD
```

As an example of Cassandra installed with TLS you can use this command:

```console
helm install --name my-release <helm-repo>/cassandra --set cluster.internodeEncryption=all \
             --set cluster.clientEncryption=true --set tlsEncryptionSecretName=cassandra-tls \
```
helm install --name my-release bitnami/cassandra --set cluster.internodeEncryption=all \

## Initializing the database

The [Bitnami cassandra](https://github.com/bitnami/bitnami-docker-cassandra) image allows having initialization scripts mounted in `/docker-entrypoint.initdb`. This is done in the chart by adding files in the `files/docker-entrypoint-initdb.d` folder (in order to do so, clone this chart) or by setting the `initDBConfigMap` value with a `ConfigMap` that includes the necessary `sh` or `cql` scripts:

```bash
kubectl create configmap init-db --from-file=path/to/scripts
helm install <helm-repo>/cassandra --set initDBConfigMap=init-db
```

helm install bitnami/cassandra --set initDBConfigMap=init-db
## Upgrade

### 2.0.0

This releases make it possible to specify custom initialization scripts in both cql and sh files.

#### Breaking changes

- `startupCQL` has been removed. Instead, for initializing the database, see [this section](#initializing-the-database).
