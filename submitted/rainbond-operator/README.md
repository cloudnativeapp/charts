# Goodrain rainbond-operator

[admin-rainbond-operator](https://github.com/goodrain/rainbond-operator) Simplify rainbond cluster
configuration and management.

__DISCLAIMER:__ While this chart has been well-tested, the rainbond-operator is still currently in beta.
Current project status is available [here](https://github.com/goodrain/rainbond-operator).

## Introduction

This chart bootstraps an rainbond-operator.

## Prerequisites

- Kubernetes 1.13+
- Helm 3.0+
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `rainbond-operator`:

```bash
helm repo add incubator https://apphub.aliyuncs.com/incubator
kubectl create namespace rbd-system
helm install rainbond-operator incubator/admin-rainbond-operator --version 0.1.0 -n rbd-system
```

if you want to install with HA mode, [read here](https://v5.2-doc.rainbond.com/docs/user-operations/install/install-base-ha/)


## Uninstalling the Chart

To uninstall/delete the rainbond-operator:

```bash
helm delete rainbond-operator
```

The command removes all the Kubernetes components EXCEPT the persistent volume.

## Configuration

The following table lists the configurable parameters of the etcd-operator chart and their default values.

| Parameter                           | Description                                   | Default                                                                                                                                                                  |
|-------------------------------------|-----------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `rainbondOperator.name`             | Rainbond Operator name                        | `rainbond-operator`                                                                                                                                                      |
| `rainbondOperator.image.repository` | rainbond-operator container image             | `registry.cn-hangzhou.aliyuncs.com/goodrain/rainbond-operator`                                                                                                                                              |
| `rainbondOperator.image.tag`        | rainbond-operator container image tag         | `v1.0.0-beta2`                                                                                                                                                                 |
| `rainbondOperator.image.pullPolicy` | rainbond-operator container image pull policy | `IfNotPresent`                                                                                                                                                           |
| `openapi.name`                      | openapi name                                  | `openapi`                                                                                                                                                                |
| `openapi.image.repository`          | openapi container image                       | `registry.cn-hangzhou.aliyuncs.com/goodrain/rbd-op-ui`                                                                                                                                                      |
| `openapi.image.tag`                 | openapi container image tag                   | `v1.0.0-beta2`                                                                                                                                                                 |
| `openapi.image.pullPolicy`          | openapi container image pull policy           | `IfNotPresent`                                                                                                                                                           |
| `openapi.image.port`                | openapi service port                          | `8080`                                                                                                                                                                   |
| `openapi.image.nodePort`            | openapi service nodePort                      | `30008`                                                                                                                                                                  |
| `openapi.image.downloadURL`         | rainbond package download url                 | `Official download address` |
| `openapi.image.downloadMD5`         | rainbond package SHA256                 | `Official package SHA256` |
| `openapi.image.installMode`         | The installation mode, WithPackage or WithoutPackage     | `WithoutPackage` |
| `openapi.image.imageRepository`     | The default image address              | `Oregistry.cn-hangzhou.aliyuncs.com/goodrain` |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example:

```bash
$ helm install rainbond-operator ./chart --set image.tag=v1.0.0-beta2 
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while
installing the chart. For example:

```bash
$ helm install rainbond-operator ./chart --values values.yaml 
```