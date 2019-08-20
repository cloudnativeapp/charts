# Django Sso Server
## 一个用户友好的Django单点登录系统(ldap&&企业微信扫码)
***
### 1 . 功能简介:
本系统为用于实现基于ldap验证或(和)企业微信扫码验证的单点登录系统

通过加解密cookie以及验证api的方式实现单点登录

### 2. 安装方式:
```shell
helm install django-sso-server ../django-sso-server --set ingress.hosts={sso.calmkart.com} --set nameSpace="default"
```
其中sso.calmkart.com可以替换为你需要的域名,nameSpace可以替换为其他命名空间

运行后将看到输出并创建以下k8s api对象:
```shell
➜  django-sso-server helm install django-sso-server ../django-sso-server --set ingress.hosts={sso.calmkart.com}
NAME: django-sso-server
LAST DEPLOYED: 2019-08-07 16:50:17.156739 +0800 CST m=+0.108258958
NAMESPACE: default
STATUS: deployed

NOTES:
1. Get the application URL by running these commands:
  http://sso.calmkart.com/

➜  django-sso-server kubectl get pods
NAME                                 READY   STATUS    RESTARTS   AGE
django-sso-server-768d85864b-fvb7q   1/1     Running   0          60s
➜  django-sso-server kubectl get service
NAME                TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
django-sso-server   ClusterIP   10.103.253.185   <none>        8080/TCP   65s
kubernetes          ClusterIP   10.96.0.1        <none>        443/TCP    2d4h
➜  django-sso-server kubectl get deployment
NAME                READY   UP-TO-DATE   AVAILABLE   AGE
django-sso-server   1/1     1            1           68s
➜  django-sso-server kubectl get ingress
NAME                HOSTS              ADDRESS   PORTS   AGE
django-sso-server   sso.calmkart.com             80      71s
```

我们将sso.calmkart.com的域名解析切换到ingress地址即可访问(修改hosts或dns皆可)

访问地址:
`http://sso.calmkart.com/`

### 3. 其他备注

#### 可用参数

- ingress.hosts

`ingress对象对应的域名`

- nameSpace

`django-sso-server部署所在的namespace`

#### 详细使用说明
[https://github.com/calmkart/Django-sso-server/blob/master/README.MD](https://github.com/calmkart/Django-sso-server/blob/master/README.MD)

#### 系统源码

[https://github.com/calmkart/Django-sso-server](https://github.com/calmkart/Django-sso-server)

#### docker镜像

[https://hub.docker.com/r/calmkart/django_sso_server](https://hub.docker.com/r/calmkart/django_sso_server)