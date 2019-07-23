# jekyll

## 功能介绍

jekyll 是一个基于 Ruby 写的静态博客系统.

本 chart 实现的功能是: 在 env 里面配置 git 仓库,运行时自动拉取仓库并运行该仓库对应的博客系统.

使用简单方便,可定制性强!

## 安装使用

按需修改 values.yaml 中的参数.

比如 env 中的 GIT_URL , 这个参数指的是对应的 jekyll 源码地址.

还有就是决定是否要使用 volume .

默认的方案是用 postStart 拉取 最新的 master 分支代码,这样镜像比较小,也不用特意去考虑 volume.但是因为众所周知的原因,git clone 会比较慢.这种场景建议用多副本,`maxUnavailable: 0`

volume 我也是有做预留的,这种方案是要自己去维护 volume ,相对来说比较麻烦.

其他参数 可以使用 `--set xxx=xxx`指定,例子如下:

```shell
		helm install ../jekyll \
		--name myjekyll \
		--set fullnameOverride=myjekyll  \		
		--set ingress.hosts={www.zeusro.tech} \
```

运行后看到输出：

```shell
NAME:   myjekyll
LAST DEPLOYED: Tue Jul 23 19:47:55 2019
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1beta2/Deployment
NAME      DESIRED  CURRENT  UP-TO-DATE  AVAILABLE  AGE
myjekyll  1        1        1           0          0s

==> v1beta1/Ingress
NAME      HOSTS          ADDRESS  PORTS  AGE
myjekyll  b.zeusro.tech  80       0s

==> v1/Pod(related)
NAME                       READY  STATUS             RESTARTS  AGE
myjekyll-6554fc9f8b-j7lds  0/1    ContainerCreating  0         0s

==> v1/Service
NAME      TYPE       CLUSTER-IP    EXTERNAL-IP  PORT(S)   AGE
myjekyll  ClusterIP  172.30.0.192  <none>       4000/TCP  0s


NOTES:
设置 DNS 解析指向 ingress 公网IP.
友情提示: 如果你的 Kubernetes 地址位于国内,记得先对域名备案哦~
URL 如下:
    http://www.zeusro.tech/
```

## 注意事项

默认用的是

默认的工作目录是 `/srv/jekyll`
用户是 jekyll.

使用外部 volume 时要**注意 Linux 文件所有者的问题**.

[镜像的 dockerfile](https://github.com/envygeeks/jekyll-docker/blob/master/repos/jekyll/Dockerfile) 里面有一行 : `ENTRYPOINT ["/usr/jekyll/bin/entrypoint"]`
如果要重写 deploy ,要注意这个问题
