# [adminMongo](https://github.com/mrvautin/adminMongo "adminMongo")

## 简介
**adminMongo is a Web based user interface (GUI) to handle all your MongoDB connections/databases needs.**

![brief](https://raw.githubusercontent.com/mrvautin/mrvautin.github.io/master/images/adminMongo/adminMongo_collectionview.png "1")

![brief](https://raw.githubusercontent.com/mrvautin/mrvautin.github.io/master/images/adminMongo/adminMongo_searchdocuments.png "1")

## 安装使用

### helm install
```shell
打包Chart
$ helm package admin-mongo

本地安装
$ helm install adminmongo admin-mongo-0.1.0.tgz
```
### 查看Pods
```shell
$ kubectl get pods

NAME                                                               READY     STATUS    RESTARTS   AGE
adminmongo-admin-mongo-5ddd76bfb7-6dwff    1/1        Running    0               16m
```

### 映射端口
```shell
$ kubectl port-forward adminmongo-admin-mongo-5ddd76bfb7-6dwff 8081:8081

Forwarding from 127.0.0.1:8081 -> 8081
Forwarding from [::1]:8081 -> 8081
```

## 访问测试
浏览器访问 http://127.0.0.1:8081

