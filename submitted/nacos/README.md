# nacos - an easy-to-use dynamic service discovery, configuration and service management platform for building cloud native applications.

[Nacos](https://nacos.io) is an easy-to-use platform designed for dynamic service discovery and configuration and service management. It helps you to build cloud native applications and microservices platform easily.

## Introduction

This chart bootstraps nacos statefulset on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.6+
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install my-release nacos
```

The command deploys nacos cluster on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

>tip:
>The default user is: nacos
>The default password is: nacos

### Uninstall

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release
```

## Configuration

The following table lists the configurable parameters of the chart and their default values.

| Parameter                  | Description                         | Default                                |
| -----------------------    | ----------------------------------- | -------------------------------------- |
| `statefulset.enabled`      | use statefulset to start            | `true`                                 |
| `deploymentStrategy`       | deployment rollingUpdate setting    | `{}`                                   |
| `replicaCount`             | replicas number                     | `3`                                    |
| `service`                  | Service type, protocol, port        | `ClusterIP` `TCP` 8848                 |
| `env`                      | container env setting               | `[]`                                   |
| `startCommand`             | Start command                       | `[]`                                   |
| `config`                   | Additional configmap to use         | see in `values.yaml`                   |
| `secret`                   | Additional secret to use            | see in `values.yaml`                   |
| `image`                    | `nacos` image, tag.            | `nacos/nacos-server` `1.0.0`                |
| `ingress`                  | Ingress for the nacos.         | `false`                                     |
| `persistentVolume.enabled` | Create a volume to store data       | `false`                                |
| `persistentVolume.storageClass` | Type of persistent volume claim     | `nil`                             |
| `persistentVolume.accessModes`  | Persistent volume access modes | `[ReadWriteOnce]`                      |
| `persistentVolume.size`         | Persistent volume access modes | `2Gi`                                  |
| `persistentVolume.existingClaim`| Persistent volume existingClaim name| `{}`                              |
| `persistentVolume.mountPaths`   | Persistent directory path      | see in `values.yaml`                   |
| `persistentVolume.annotations`  | Persistent volume annotations       | `{}`                              |
| `healthCheck.enabled`      | liveness and readiness probes       | `true`                                 |
| `mysql`                    | mysql for nacos                     | see in values.yaml                     |
| `resources`                | CPU/Memory resource requests/limits | `{}`                                   |
| `deployment`               | deployment annotations initContainers| `{}`                                  |
| `extraContainers`          | sidecar containers                  | `{}`                                   |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

## Persistence

The [nacos image](https://github.com/nacos-group/nacos-docker) stores the data and configurations at the `/home/nacos/{plugins,data,logs}` path of the container.

