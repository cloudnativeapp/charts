# mobile-number-admin

## 功能介绍

提供一个手机号码登记管理信息系统，可以根据必需的数据库表格创建出自己的web管理系统

## 安装使用

```shell
helm install mobile-number-admin
```

or

//helm v3
```shell
helm install mobile-number-admin --generate-name
```
运行后看到输出：

```shell
NAME:   iced-abalone
LAST DEPLOYED: Fri Aug 23 11:09:50 2019
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/Deployment
NAME                              READY  UP-TO-DATE  AVAILABLE  AGE
iced-abalone-mobile-number-admin  0/2    0           0          0s

==> v1/Service
NAME                              TYPE       CLUSTER-IP  EXTERNAL-IP  PORT(S)  AGE
iced-abalone-mobile-number-admin  ClusterIP  10.0.0.235  <none>       80/TCP   0s


NOTES:
1. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=mobile-number-admin,app.kubernetes.io/instance=iced-abalone" -o jsonpath="{.items[0].metadata.name}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl port-forward $POD_NAME 8080:80
```
Web界面如下所示：


