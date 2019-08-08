# Helm Chart for Oneindex

## Introduction

This [Oneindex](https://github.com/donwa/oneindex) chart installs [setzero/oneindex](https://github.com/TimeBye/oneindex) in a Kubernetes cluster.

## Prerequisites

- Kubernetes cluster 1.10+
- Helm 2.8.0+

## Installation

### Download the chart

Download Oneindex helm chart code.

```bash
git clone https://github.com/cloudnativeapp/charts.git
```

Checkout the tag.

```bash
git checkout tag_name
cd submitted/oneindex
```

### Configure the chart

The following items can be configured in `values.yaml` or set via `--set` flag during installation.

#### Configure the way how to expose Oneindex service:

- **Ingress**: The ingress controller must be installed in the Kubernetes cluster.  
- **ClusterIP**: Exposes the service on a cluster-internal IP. Choosing this value makes the service only reachable from within the cluster.
- **NodePort**: Exposes the service on each Node’s IP at a static port (the NodePort). You’ll be able to contact the NodePort service, from outside the cluster, by requesting `NodeIP:NodePort`. 
- **LoadBalancer**: Exposes the service externally using a cloud provider’s load balancer.  

#### Configure the way how to persistent data:

- **Disable**: The data does not survive the termination of a pod.
- **Persistent Volume Claim(default)**: A default `StorageClass` is needed in the Kubernetes cluster to dynamic provision the volumes. Specify another StorageClass in the `storageClass` or set `existingClaim` if you have already existing persistent volumes to use.

#### Configure the other items listed in [configuration](#configuration) section.

### Install the chart

Install the Oneindex helm chart with a release name `my-oneindex`:

```bash
# helm v2
helm install . \
  --name my-oneindex \
  --set expose.ingress.host=oneindex.cluster.local

# helm v3
helm install my-oneindex . \
  --set expose.ingress.host=oneindex.cluster.local
```

## Uninstallation

To uninstall/delete the `my-oneindex` deployment:

```bash
# helm v2
helm delete --purge my-oneindex

# helm v3
helm uninstall my-oneindex
```

## Configuration

The following table lists the configurable parameters of the Oneindex chart and the default values.

| Parameter                    | Description                                                                                                                                                                                                                                                                   | Default                                  |
| ---------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------- |
| **Oneindex**                 |                                                                                                                                                                                                                                                                               |                                          |
| `replicaCount`               | Number of desired pods. This is a pointer to distinguish between explicit zero and not specified.                                                                                                                                                                             | `1`                                      |
| `strategy`                   | The deployment strategy to use to replace existing pods with new ones.                                                                                                                                                                                                        | `RollingUpdate`-`maxUnavailable: 0`      |
| `image.repository`           | Repository for oneindex image                                                                                                                                                                                                                                                 | `quay.azk8s.cn/setzero/setzero/oneindex` |
| `image.tag`                  | Tag for oneindex image                                                                                                                                                                                                                                                        | `alpine-91b40ba6`                        |
| `image.pullPolicy`           | The image pull policy                                                                                                                                                                                                                                                         | `IfNotPresent`                           |
| `annotations`                | Annotations to add to the oneindex deployment                                                                                                                                                                                                                                 | `{}`                                     |
| `podAnnotations`             | Annotations to add to the oneindex pod                                                                                                                                                                                                                                        | `{}`                                     |
| `resources`                  | The [resources] to allocate for container                                                                                                                                                                                                                                     | undefined                                |
| `nodeSelector`               | Node labels for pod assignment                                                                                                                                                                                                                                                | `{}`                                     |
| `tolerations`                | Tolerations for pod assignment                                                                                                                                                                                                                                                | `[]`                                     |
| `affinity`                   | Node/Pod affinities                                                                                                                                                                                                                                                           | `{}`                                     |
| `env`                        | The [available options] that can be used to customize your oneindex installation.                                                                                                                                                                                             | `{}`                                     |
| **Expose**                   |                                                                                                                                                                                                                                                                               |                                          |
| `expose.type`                | The way how to expose the service: `ingress`、`clusterIP`、`loadBalancer` or `nodePort`                                                                                                                                                                                       | `ingress`                                |
| `expose.tls.enabled`         | Enable the tls or not                                                                                                                                                                                                                                                         | `false`                                  |
| `expose.tls.secretName`      | Fill the name of secret if you want to use your own TLS certificate. The secret must contain keys named:`tls.crt` - the certificate, `tls.key` - the private key, `ca.crt` - the certificate of CA.These files will be generated automatically if the `secretName` is not set |                                          |
| `expose.tls.certExpiry`      | Automatically generated self-signed certificate validity period(day)                                                                                                                                                                                                          | `3650`                                   |
| `expose.ingress.host`        | The host of oneindex service in ingress rule                                                                                                                                                                                                                                  | `oneindex.cluster.local`                 |
| `expose.ingress.annotations` | The annotations used in ingress                                                                                                                                                                                                                                               |                                          |
| `expose.clusterIP.name`      | The name of ClusterIP service                                                                                                                                                                                                                                                 | `Release.Name`                           |
| `expose.clusterIP.port`      | The service port oneindex listens on when serving with HTTP                                                                                                                                                                                                                   | `80`                                     |
| `expose.nodePort.name`       | The name of NodePort service                                                                                                                                                                                                                                                  | `Release.Name`                           |
| `expose.nodePort.port`       | The service port oneindex listens on when serving with HTTP                                                                                                                                                                                                                   | `80`                                     |
| `expose.nodePort.nodePort`   | The node port oneindex listens on when serving with HTTP                                                                                                                                                                                                                      |                                          |
| `expose.loadBalancer.name`   | The name of LoadBalancer service                                                                                                                                                                                                                                              | `Release.Name`                           |
| `expose.loadBalancer.port`   | The service port oneindexÎ listens on when serving with HTTP                                                                                                                                                                                                                  | `80`                                     |
| **Persistence**              |                                                                                                                                                                                                                                                                               |                                          |
| `persistence.enabled`        | Enable the data persistence or not                                                                                                                                                                                                                                            | `false`                                  |
| `persistence.resourcePolicy` | Setting it to `keep` to avoid removing PVCs during a helm delete operation. Leaving it empty will delete PVCs after the chart deleted                                                                                                                                         | `keep`                                   |
| `persistence.existingClaim`  | Use the existing PVC which must be created manually before bound, and specify the `subPath` if the PVC is shared with other components                                                                                                                                        |                                          |
| `persistence.storageClass`   | Specify the `storageClass` used to provision the volume. Or the default StorageClass will be used(the default). Set it to `-` to disable dynamic provisioning                                                                                                                 |                                          |
| `persistence.accessMode`     | The access mode of the volume                                                                                                                                                                                                                                                 | `ReadWriteMany`                          |
| `persistence.size`           | The size of the volume                                                                                                                                                                                                                                                        | `5Gi`                                    |

[resources]: https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/
[available options]: https://github.com/TimeBye/oneindex#%E5%8F%98%E9%87%8F