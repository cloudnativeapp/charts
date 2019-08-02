# nvidia-gpu-exporter

采集使用 nvidia-docker 的 K8S集群中的 GPU 资源，并将监控指标暴露给Prometheus

## 前置条件

- NVIDIA drivers ~= 361.93
- nvidia-docker version > 2.0
- docker configured with nvidia as the default runtime.
- Kubernetes version >= 1.9
- The DevicePlugins feature gate enabled

！ 如果上述条件不满足，参考下面连接
https://github.com/NVIDIA/k8s-device-plugin/tree/v1.9
https://kubernetes.io/docs/tasks/manage-gpus/scheduling-gpus/

## 功能介绍

This exporter used the NVidia Management Library (NVML) to query information about the installed Nvidia GPUs.nvidia-gpu-exporter 是一个基于 golang 写的 基于 nvidia-docker 的 prometheus GPU exporter抽象为 chart项目.

源代码项目地址：
https://github.com/mindprince/nvidia_gpu_prometheus_exporter

本 chart 实现的功能是: 采取到 GPU 监控数据
可采取监控指标如下
	设备数量         numDevices
	GPU已使用内存    usedMemory
	GPU总内存        totalMemory
	GPU占空比        dutyCycle
	GPU电源使用情况   powerUsage
	GPU温度         temperature
	GPU风扇速度      fanSpeed

通过 prometheus 后台的target 界面确认是否生效。
确认生效，可以使用 "nvidia" 或 "gpu"相关语句进行查询

## 安装使用

按自身集群GPU机器配置，修改 values.yaml 中的参数.

如 toleration/affinity

```shell
		helm install nvidia-gpu-exporter
```

运行后看到输出：

```shell
NAME:   trendy-goat
LAST DEPLOYED: Fri Aug  2 15:43:27 2019
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/Pod(related)
NAME                                   READY  STATUS             RESTARTS  AGE
trendy-goat-nvidia-gpu-exporter-44klz  0/1    ContainerCreating  0         0s
trendy-goat-nvidia-gpu-exporter-4v7pq  0/1    ContainerCreating  0         0s
trendy-goat-nvidia-gpu-exporter-8vg6q  0/1    Pending            0         0s
trendy-goat-nvidia-gpu-exporter-bb7sn  0/1    ContainerCreating  0         0s
trendy-goat-nvidia-gpu-exporter-cc5s9  0/1    ContainerCreating  0         0s
trendy-goat-nvidia-gpu-exporter-kmbqp  0/1    ContainerCreating  0         0s
trendy-goat-nvidia-gpu-exporter-x9m9j  0/1    ContainerCreating  0         0s
trendy-goat-nvidia-gpu-exporter-zmm2m  0/1    ContainerCreating  0         0s

==> v1/Service
NAME                             TYPE       CLUSTER-IP  EXTERNAL-IP  PORT(S)   AGE
trendy-goat-nvidia-gpu-exporter  ClusterIP  None        <none>       9445/TCP  0s

==> v1/ServiceMonitor
NAME                             AGE
trendy-goat-nvidia-gpu-exporter  0s

==> v1beta1/DaemonSet
NAME                             DESIRED  CURRENT  READY  UP-TO-DATE  AVAILABLE  NODE SELECTOR  AGE
trendy-goat-nvidia-gpu-exporter  8        8        0      8           0          <none>         0s


NOTES:

```

## 注意事项

监控指标暴露端口为 9445
