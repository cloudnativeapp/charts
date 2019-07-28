# sftp - Securely share your files

[sftp](https://github.com/ygqygq2/sftp)docker

## Introduction

部署一个sftp服务用于上传下载文件，如果是挂载的多读写的PVC，可用于提供文件的修改入口，比如修改web服务文件。

## Prerequisites

- Kubernetes 1.6+
- PV provisioner support in the underlying infrastructure

## Installing the Chart 

To install the chart with the release name `my-sftp`:

```bash
$ helm install --name my-sftp sftp  # helm2
$ helm install my-sftp sftp  # helm3
```

The command deploys sftp cluster on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

运行后看到输出：
```
ME: my-sftp
LAST DEPLOYED: 2019-07-24 23:25:09.557535712 +0800 CST m=+0.066477189
NAMESPACE: default
STATUS: deployed

NOTES:
** Please be patient while the chart is being deployed **

Connect to the sftp:

  export POD_NAME=$(kubectl get pods --namespace default -l "app=sftp" -l "release=my-sftp" -o jsonpath="{.items[0].metadata.name}")
  kubectl port-forward $POD_NAME 1222:22 --namespace default

  # login sftp, default user is "dev", default password is "dev".
  sftp -o port=1222 dev@127.0.0.1
```

执行完 NOTES 中提示命令的命令即可使用sftp命令登录至sftp。

### Uninstall

To uninstall/delete the `my-sftp` deployment:

```bash
$ helm delete my-sftp [--purge]  # helm2
$ helm delete my-sftp   # helm3
```

## Configuration

The following table lists the configurable parameters of the sftp chart and their default values.

| Parameter                  | Description                         | Default                                |
| -----------------------    | ----------------------------------- | -------------------------------------- |
| `replicaCount`             | replicas number                     | `1`                                    |
| `sshConfFile`              | sftp ssh config file                | look it in values.yaml                 |
| `usersConfFile`            | sftp users config file              | look it in values.yaml                 |
| `scriptFile`               | docker start to run this script     | look it in values.yaml                 |
| `service`                  | Service type, protocol, port        | `ClusterIP` `TCP` 22                   |
| `image`                    | `sftp` image, tag.          | `ygqygq2/sftp` `latest`                        |
| `persistentVolume.enabled` | Create a volume to store data       | `false`                                |
| `persistentVolume.storageClass` | Type of persistent volume claim     | `nil`                             |
| `persistentVolume.accessModes`  | Persistent volume access modes      | `[ReadWriteMany]`                 |
| `persistentVolume.size`         | Persistent volume access modes      | `500Mi`                                |
| `persistentVolume.existingClaim`| Persistent volume existingClaim name| `[]`                              |
| `persistentVolume.annotations`  | Persistent volume annotations       | `{}`                              |
| `resources`                | CPU/Memory resource requests/limits | Memory: `128Mi`, CPU: `100m`           |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

>注意
> * `persistentVolume.existingClaim`支持多个已存在PVC的挂载，默认以PVC名为目录名，挂载在`dev`用户的`/home/dev/upload`下，在`values.yaml`中，请注意其uid和gid；

## Persistence

The [sftp image](https://github.com/ygqygq2/sftp) stores the data and configurations at the `/home` path of the container.

