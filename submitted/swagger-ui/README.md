# swagger-ui

##功能介绍

swagger-ui 是一个 API 文档管理工具，可以让我们把定义的接口以配置文件的方式编写，最后在 Web 端生成一个可视化的接口文档，可以支持管理一个或多个项目的接口。


## 安装使用

```
$ helm install swagger-ui

or

// helm v3
$ helm install swagger-ui --generate-name
```

运行后看到输出：

```
NAME:   orange-panther
LAST DEPLOYED: Wed Aug 14 20:00:56 2019
NAMESPACE: pks-installer
STATUS: DEPLOYED

RESOURCES:
==> v1/Deployment
NAME                       READY  UP-TO-DATE  AVAILABLE  AGE
orange-panther-swagger-ui  0/2    0           0          1s

==> v1/Pod(related)
NAME                                       READY  STATUS   RESTARTS  AGE
orange-panther-swagger-ui-75b6fdd7c-hbpb5  0/1    Pending  0         0s
orange-panther-swagger-ui-75b6fdd7c-wmd92  0/1    Pending  0         0s

==> v1/Service
NAME                       TYPE       CLUSTER-IP      EXTERNAL-IP  PORT(S)  AGE
orange-panther-swagger-ui  ClusterIP  10.100.227.231  <none>       80/TCP   1s


NOTES:
1. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods --namespace pks-installer -l "app.kubernetes.io/name=swagger-ui,app.kubernetes.io/instance=orange-panther" -o jsonpath="{.items[0].metadata.name}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl port-forward $POD_NAME 8080:80
```

Web 界面如下所示：

![](http://cdn.tianfeiyu.com/image-20190815091012095.png)


## 其他说明

如需自定义 API 配置，请参考：[https://github.com/gosoon/app-charts/](https://github.com/gosoon/app-charts/)

