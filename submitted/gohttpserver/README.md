# gohttpserver

## 功能介绍:

目标: 做最好的HTTP文件服务器

功能: 人性化的UI体验，文件的上传支持，安卓和苹果安装包的二维码直接生成。

项目作者源码: [https://github.com/codeskyblue/gohttpserver](https://github.com/codeskyblue/gohttpserver)

基于原作者的docker镜像做了helm包封装.可以做到开箱即用.


## 安装方式:
```shell
helm install gohttpserver ../gohttpserver 
```

运行后将看到输出并创建以下k8s api对象:
```shell
➜  gohttpserver git:(gohttpserver) ✗ helm install gohttpserver ../gohttpserver
NAME: gohttpserver
LAST DEPLOYED: 2019-08-08 15:17:21.380347 +0800 CST m=+0.144642186
NAMESPACE: default
STATUS: deployed

NOTES:
1. Get the application URL by running these commands:
  http://gohttpserver.calmkart.com/

➜  gohttpserver git:(gohttpserver) ✗ kubectl get pods
NAME                                 READY   STATUS        RESTARTS   AGE
gohttpserver-55fc8964d8-6nsm2        1/1     Running       0          69s
➜  gohttpserver git:(gohttpserver) ✗ kubectl get deployment
NAME           READY   UP-TO-DATE   AVAILABLE   AGE
gohttpserver   1/1     1            1           75s
➜  gohttpserver git:(gohttpserver) ✗ kubectl get service
NAME           TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)    AGE
gohttpserver   ClusterIP   10.96.80.28   <none>        8000/TCP   79s
➜  gohttpserver git:(gohttpserver) ✗ kubectl get ingress
NAME           HOSTS                       ADDRESS   PORTS   AGE
gohttpserver   gohttpserver.calmkart.com             80      85s
```

我们可以通过port-forward或者ingress访问服务

>`kubectl port-forward svc/gohttpserver 8000:8000`
- 访问地址 `http://0.0.0.0:8000/`

>将gohttpserver.calmkart.com的域名解析切换到ingress地址即可访问(修改hosts或dns皆可)
- 访问地址: `http://gohttpserver.calmkart.com/`

### 3. 其他备注

#### 可用参数
| Parameter | Description | Default |
| ----- | ----------- | ------ |
| `pullPolicy` | docker镜像拉取策略(因为tag使用的是latest,所以推荐使用默认的Always,调试或特殊情况可修改) |`Always`|
| `nameSpace` | gohttpserver创建的api对象的命名空间 |`"default"`|
| `startArgs.auth_type` | 认证方式,参考项目源官方文档,推荐为空不设置,或设置为http | `''` |
| `startArgs.auth_http` | http认证的账号密码,以:分隔(如calmkart:calmkart),细节参考官方文档 | `''` |
| `startArgs.upload` | 是否开启上传功能,默认为true | `true` |
| `startArgs.delete` | 是否开启删除功能,默认为true | `true` |
| `ingress.hosts` | ingress域名 | `['gohttpserver.calmkart.com']` |

#### 系统源码

[https://github.com/codeskyblue/gohttpserver](https://github.com/codeskyblue/gohttpserver)

#### docker镜像

[https://hub.docker.com/r/codeskyblue/gohttpserver](https://hub.docker.com/r/codeskyblue/gohttpserver)