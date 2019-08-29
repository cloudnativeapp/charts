# reservation-client

## 功能介绍 *(此处介绍charts功能)*

活动室预约系统的 angular8 + material 客户端，

开源项目地址：

- 活动室预约服务器端：<https://github.com/WeihanLi/ActivityReservation>
- 活动室预约客户端：<https://github.com/WeihanLi/ActivityReservation/tree/dev/ActivityReservation.Clients/ReservationClient>

## 安装使用 *(此处介绍安装方式)*

```shell
helm install reservation-client reservation-client
```

运行后看到输出：

```shell
NAME: reservation-client
LAST DEPLOYED: 2019-08-29 09:49:24.498483847 +0000 UTC m=+2.149383629
NAMESPACE: default
STATUS: deployed
NOTES:
1. Get the application URL by running these commands:

kubectl get svc

2. access the web with the port in the browser
```

这里默认使用的是 NodePort 暴露端口，默认端口号是 31256，在浏览器中访问：`http://<nodeip>>:31256`，如果修改了端口请换成自己的端口号或上面获得到的端口号

提供了一个部署在我的 k8s 上的在线示例的 <https://reservation-client0.weihanli.xyz>
