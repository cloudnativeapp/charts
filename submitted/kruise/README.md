# Kruise

[Kruise](https://openkruise.io) 是应用[编排管理工具](https://kubernetes.io/docs/concepts/workloads/controllers/)的扩展

## 简介
这是一个安装 kruise 的 chart 文件

## 官方文档
官方文档可以在[这里](https://github.com/openkruise/kruise/tree/master/docs)找到.

## 前提条件
- 安装要求 Kubernetes 1.10+
- 使用某些功能（如：statefulset 就地更新）需要 Kubernetes 1.12+

## 安装

```bash
$ helm repo add apphub https://apphub.aliyuncs.com
$ helm install kruise apphub/guestbook
```

运行后看到输出：

```
[root@k8s-master submitted]# helm install --name=kruise kruise
NAME:   kruise
LAST DEPLOYED: Fri Aug 23 10:37:52 2019
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/ClusterRole
NAME                 AGE
kruise-manager-role  0s

==> v1/ClusterRoleBinding
NAME                        AGE
kruise-manager-rolebinding  0s

==> v1/Namespace
NAME           STATUS  AGE
kruise-system  Active  0s

==> v1/Pod(related)
NAME                         READY  STATUS             RESTARTS  AGE
kruise-controller-manager-0  0/1    ContainerCreating  0         0s

==> v1/Secret
NAME                          TYPE    DATA  AGE
kruise-webhook-server-secret  Opaque  0     0s

==> v1/Service
NAME                               TYPE       CLUSTER-IP    EXTERNAL-IP  PORT(S)  AGE
kruise-controller-manager-service  ClusterIP  10.98.202.12  <none>       443/TCP  0s

==> v1/StatefulSet
NAME                       READY  AGE
kruise-controller-manager  0/1    0s

==> v1beta1/CustomResourceDefinition
NAME                          AGE
broadcastjobs.apps.kruise.io  0s
sidecarsets.apps.kruise.io    0s
statefulsets.apps.kruise.io   0s

==> v1beta1/MutatingWebhookConfiguration
NAME                                   AGE
kruise-mutating-webhook-configuration  0s

==> v1beta1/ValidatingWebhookConfiguration
NAME                                     AGE
kruise-validating-webhook-configuration  0s

```

## 卸载


```bash
$ helm delete kruise
```

## 配置

下表列出了Kruise charts 的可配置参数及其默认值。

配置文件的参数描述及默认值如下表所示：

| 参数 | 描述 | 默认值 |
| --- | --- | --- |
| `log.level` | kruise-manager 日志输出级别 | `4` |
| `revisionHistoryLimit` | 修改历史的限制 | `3` |
| `manager.image.repository` | kruise-manager 镜像的名称 | `openkruise/kruise-manager` |
| `manager.image.tag` | kruise-manager 镜像的标记 | `v0.1.0-beta.1` |
| `manager.resources.limits.cpu` | kruise-manager 容器的CPU资源限制 | `500m` |
| `manager.resources.limits.memory` | kruise-manager 容器的内存资源限制 | `1Gi` |
| `manager.resources.requests.cpu` | kruise-manager 容器的CPU资源请求 |  |
| `manager.resources.requests.memory` | kruise-manager 容器的内存资源请求 |  |
| `manager.metrics.addr` | 提供指标的地址 | `localhost` |
| `manager.metrics.port` | 提供指标的端口 | `8080` |

可以使用如下方式指定参数

```bash
# helm install apphub/kruise --name=kruise --set manager.log.level=5
```