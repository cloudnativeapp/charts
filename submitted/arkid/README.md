# ArkID

ArkID是全新一代企业单点登录解决方案, 彻底告别企业内多系统多账号的烦恼, 节省管理成本, 自带功能全面的WEB管理界面，提升管理效率。

## 项目说明

- [arkid-frontend](https://github.com/longguikeji/arkid-frontend): 前端代码
- [arkid-core](https://github.com/longguikeji/arkid-core): 后端核心以及其他
- [arkid-broker](https://github.com/longguikeji/arkid-broker): 一账通部署在ArkOS中的服务Broker

## 功能特性

### 兼容各种常见协议, 让每个应用都可以连接

1. LDAP
2. OAuth
3. OpenID(即将开放)
4. SAML(即将开放)
5. HTTP API

### 丰富的账号与分组管理

1. 灵活高效的管理企业内部账号与分组
2. 支持一键钉钉导入

### 完备的权限管理

细粒度的权限管理，让企业没有管理不到的权限

1. 账号权限
2. 分组权限
3. 应用白名单，黑名单
4. 应用内权限

### 工作台(Workspace)

每位员工均拥有自己的工作台，一键访问业务系统

### 自定义登陆UI

名称、LOGO、主题色，让登陆页面彰显企业文化



## 文档

- [接口文档](https://oneid1.docs.apiary.io/#)


### QuickStart

假设系统内部没有`cert-managaer`，不启用HTTPS

```shell
> helm install arkid .  --set persistence.init=true --set ingress.cert=false --set ingress.tls=false --set apiServer=""

NAME:   arkid
LAST DEPLOYED: Mon Aug 12 21:10:32 2019
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/ConfigMap
NAME   DATA  AGE
arkid  2     21s

==> v1/PersistentVolumeClaim
NAME   STATUS  VOLUME                                    CAPACITY  ACCESS MODES  STORAGECLASS     AGE
arkid  Bound   pvc-90aa88a0-bd02-11e9-ae44-00163e009f85  8Gi       RWO           rook-ceph-block  21s

==> v1/Service
NAME          TYPE       CLUSTER-IP      EXTERNAL-IP  PORT(S)          AGE
arkid-fe      ClusterIP  10.103.188.115  <none>       80/TCP           21s
arkid-portal  ClusterIP  10.99.233.163   <none>       80/TCP           21s
arkid         ClusterIP  10.109.113.112  <none>       80/TCP,8080/TCP  21s

==> v1/Deployment
NAME          DESIRED  CURRENT  UP-TO-DATE  AVAILABLE  AGE
arkid-fe      1        1        1           1          21s
arkid-portal  1        1        1           1          21s
arkid         1        1        1           0          21s

==> v1beta1/Ingress
NAME   HOSTS                  ADDRESS  PORTS  AGE
arkid  oneid.longguikeji.com  80       21s

==> v1/Pod(related)
NAME                           READY  STATUS             RESTARTS  AGE
arkid-fe-597c8f6b5b-zgbjk      1/1    Running            0         21s
arkid-portal-8644894767-j8s4k  1/1    Running            0         21s
arkid-ff5946498-n456z          0/4    ContainerCreating  0         21s
```
arkid 可能因为依赖的数据库未完全启动，而进行几次重启，请稍作等待，直至达到 Running。

```shell
> kubectl port-forward arkid-portal-8644894767-j8s4k  10080:80
Forwarding from 127.0.0.1:10080 -> 80
Handling connection for 10080
```

```shell
> curl http://127.0.0.1:10080/ping
pong
```

浏览器打开http://127.0.0.1:10080，既可用默认管理员账号 admin / admin 探索ArkID完整功能。

![image](https://raw.githubusercontent.com/skoogi/charts/assets/assets/login.png)

![image](https://raw.githubusercontent.com/skoogi/charts/assets/assets/ucenter.png)

![image](https://raw.githubusercontent.com/skoogi/charts/assets/assets/admin.png)

## Contact

- [Website](https://www.longguikeji.com)
