# [codis](https://github.com/CodisLabs/codis)

## 功能介绍

简单地说，codis 是一套应用于 Kubernetes 上面的 Redis 集群方案，通过 codis-proxy 隔离了后端的 Redis 分片；
通过冗余 + HA 的方式实现了高可用；
通过 codis-dashboard 实现了界面化管理 Redis 集群伸缩。

详细的介绍见：

[为什么大厂都喜欢用 Codis 来管理分布式集群？](https://juejin.im/post/5c132b076fb9a04a08218eef)

[tutorial_zh](https://github.com/zeusro/codis/blob/release3.2/doc/tutorial_zh.md)

只用到 Redis 简单指令

由于豌豆荚官方团队没有推送到 https://hub.docker.com/ ，[并且默认的Dockerfile](https://github.com/CodisLabs/codis/blob/release3.2/Dockerfile) 写法比较落后。

我 Fork 并修改了 `release3.2` 的分支，推送到[我自己的 hub.docker.com](https://hub.docker.com/r/zeusro/codis)。

大家也可自行编译。

## 注意事项

codis 依赖于 zookeeper,但这不是绝对的。

> [Codis 使用文档](https://github.com/CodisLabs/codis/blob/release3.2/doc/tutorial_zh.md)
>
> 元数据存储支持 etcd/zookeeper/filesystem。

默认的例子用了 zookeeper ，大家可自行实现其他方式。

## 安装使用
