# reservation-client

## 功能介绍

活动室预约系统的 angular8 + material 客户端，

开源项目地址：

- 活动室预约服务器端：<https://github.com/WeihanLi/ActivityReservation>
- 活动室预约客户端：<https://github.com/WeihanLi/ActivityReservation/tree/dev/ActivityReservation.Clients/ReservationClient>

## 安装使用

```shell
helm install reservation-client reservation-client
```

这里默认使用的是 NodePort 暴露端口，默认端口号是 31256，在浏览器中访问：`http://<nodeip>>:31256`，

如果修改了端口请换成自己的端口号或上面获得到的端口号，可以通过 `service.nodePort` 来设置端口

```shell
helm install reservation-client --set service.nodePort=32156 reservation-client
```

如果不是使用 Node-Port 方式访问的，可以通过 `kubectl port-forward svc/homepage 31256:80` 来创建一个端口转发，然后访问 `http://localhost:31256` 来访问应用

提供了一个部署在我的 k8s 上的在线示例的 <https://reservation-client0.weihanli.xyz>
