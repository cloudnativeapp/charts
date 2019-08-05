# nginx-php - nginx php服务器

[nginx-php](https://github.com/1and1internet/ubuntu-16-nginx-php-7.0)是基于1and1internet的nginx php做的chart。

## Introduction

This chart bootstraps nginx-php deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.6+
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install my-release nginx-php
```

The command deploys nginx-php cluster on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

### Uninstall

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release
```

## Configuration

The following table lists the configurable parameters of the FastDFS-Nginx chart and their default values.

| Parameter                  | Description                         | Default                                |
| -----------------------    | ----------------------------------- | -------------------------------------- |
| `statefulset.enabled`      | use statefulset to start            | `false`                                |
| `deploymentStrategy`       | deployment rollingUpdate setting    | `{}`                                   |
| `replicaCount`             | replicas number                     | `1`                                    |
| `service`                  | Service type, protocol, port        | `ClusterIP` `TCP` 8080                 |
| `env`                      | container env setting               | `[]`                                   |
| `startCommand`             | Start command                       | `[]`                                   |
| `config`                   | Additional configmap to use         | see in `values.yaml`                   |
| `secret`                   | Additional secret to use            | see in `values.yaml`                   |
| `image`                    | `nginx-php-sftp` image, tag.        | `1and1internet/ubuntu-16-nginx-php-7.0` `latest`|
| `ingress`                  | Ingress for the nginx-php.          | `false`                                |
| `metrics.enabled`          | Prometheus metrics                  | `false`                                |
| `persistentVolume.enabled` | Create a volume to store data       | `false`                                |
| `persistentVolume.storageClass` | Type of persistent volume claim| `nil`                                  |
| `persistentVolume.accessModes`  | Persistent volume access modes | `[ReadWriteMany]`                      |
| `persistentVolume.size`         | Persistent volume access modes | `500Mi`                                |
| `persistentVolume.existingClaim`| Persistent volume existingClaim name| `{}`                              |
| `persistentVolume.mountPaths`   | Persistent directory path      | see in `values.yaml`                   |
| `persistentVolume.annotations`  | Persistent volume annotations  | `{}`                                   |
| `healthCheck.enabled`      | Liveness and readiness probes       | `true`, detail see in `values.yaml`    |
| `resources`                | CPU/Memory resource requests/limits | `{}`                                   |
| `lifecycle`                | Pod lifecycle                       | `{}`                                   |
| `deployment.additionalVolumes`| Deployment additionalVolumes     | `[]`                                   |
| `additionalContainers`     | Sidecar containers                  | `{}`                                   |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

## Persistence

The [nginx-php image](https://github.com/1and1internet/ubuntu-16-nginx-php-7.0) stores the data and configurations at the `/var/www` path of the container.

