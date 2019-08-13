# redispapa

## 功能介绍:

功能: 利用redis的info信息对redis的使用情况进行监控。(相较于原版的读conf获取target,纯静态修改需要重启的方式,修改为动态读取数据库更新线程列表.并且替换了原版所有不能用的cdn静态文件.)

改动: 
- 从原系统的读config文件获取监控target列表(静态,需手动修改并重启服务器)切换到sqlite动态发现(通过管理后台变更数据,无需重启)

- 添加了flask admin管理后台用于动态变更监控target列表

- 原版的静态文件用的cdn地址已有很多读取不上了,全部替换成了本地文件

源码地址:

[https://github.com/calmkart/redispapa](https://github.com/calmkart/redispapa)

## 安装方式:
```shell
helm install redispapa ./redispapa 
```

运行后将看到输出并创建以下k8s api对象:
```shell
➜ helm install redispapa ./redispapa  --set service.type=NodePort
NAME: redispapa
LAST DEPLOYED: 2019-08-12 17:10:29.032902 +0800 CST m=+0.138064656
NAMESPACE: default
STATUS: deployed

NOTES:
1. Get the application URL by running these commands:
  export NODE_PORT=$(kubectl get -o jsonpath="{.spec.ports[0].nodePort}" services redispapa)
  export NODE_IP=$(kubectl get nodes -o jsonpath="{.items[0].status.addresses[0].address}")
  echo http://$NODE_IP:$NODE_PORT

➜ kubectl get pods
kNAME                      READY   STATUS    RESTARTS   AGE
redispapa-5bb76fd-tw4zj   1/1     Running   0          2m41s
➜ kubectl get deployments
NAME        READY   UP-TO-DATE   AVAILABLE   AGE
redispapa   1/1     1            1           2m46s
➜ kubectl get service
NAME         TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
kubernetes   ClusterIP   10.96.0.1       <none>        443/TCP    7d
redispapa    ClusterIP   10.110.99.224   <none>        5000/TCP   2m50s
```

我们可以通过NodePort或者port-forward或者ingress访问服务

NODE_PORT=$(kubectl get -o jsonpath="{.spec.ports[0].nodePort}" services redispapa)&&NODE_IP=$(kubectl get nodes -o jsonpath="{.items[0].status.addresses[0].address}")&&echo http://$NODE_IP:$NODE_PORT

- 访问地址(监控页面): `<nodeip:nodeport>`
- 访问地址(target后台管理): `<nodeip:nodeport>/admin/redisobj`

kubectl port-forward svc/redispapa 5000:5000
- 访问地址(监控页面): `http://0.0.0.0:5000/`
- 访问地址(target后台管理): `http://0.0.0.0:5000/admin/redisobj`

将redispapa.calmkart.com的域名解析切换到ingress地址即可访问(修改hosts或dns皆可)
- 访问地址(监控页面): `http://redispapa.calmkart.com/`
- 访问地址(target后台管理): `http://redispapa.calmkart.com/admin/redisobj`

### 3. 其他备注

#### 可用参数
| Parameter | Description | Default |
| ----- | ----------- | ------ |
| `nameSpace` | redispapa创建的api对象的命名空间 |`"default"`|
| `service.type` | service服务暴露类型 | `ClusterIP` |
| `ingress.enabled` | 是否开启ingress | `false` |
| `ingress.hosts` | ingress域名 | `['redispapa.calmkart.com']` |

#### 详细使用说明
[https://github.com/calmkart/redispapa/blob/master/README.md](https://github.com/calmkart/redispapa/blob/master/README.md)

#### 系统源码

[https://github.com/calmkart/redispapa](https://github.com/calmkart/redispapa)

#### docker镜像

[https://cloud.docker.com/repository/docker/calmkart/redispapa-sqlite](https://cloud.docker.com/repository/docker/calmkart/redispapa-sqlite)
