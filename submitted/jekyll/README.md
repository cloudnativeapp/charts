# jekyll

## 功能介绍

jekyll 是一个基于 Ruby 写的静态博客系统

## 安装使用

```shell
		helm install ../jekyll \
		--name myjekyll \
		--set fullnameOverride=myjekyll  \
		--set jekyll_host=www.zeusro.tech \
		--set ingress.hosts={www.zeusro.tech} \
    	--set public_git_url=https://github.com/zeusro/Zeusro.github.io.git
```

运行后看到输出：

```shell

```

## 注意事项

默认的工作目录是 `/srv/jekyll`
用户是 jekyll.

使用外部 volume 时要**注意 Linux 文件所有者的问题**.

[镜像的 dockerfile](https://github.com/envygeeks/jekyll-docker/blob/master/repos/jekyll/Dockerfile) 里面有一行 : `ENTRYPOINT ["/usr/jekyll/bin/entrypoint"]`
如果要重写 deploy ,要注意这个问题

## 使用参数

参数名|意义
--|--
name|release 名称
fullnameOverride|资源(service,deploy)名称
jekyll_host |博客公网 URL
ingress.hosts|博客公网 URL
public_git_url|jekyll 源代码路径(不一定要GitHub,但需要能够支持公开拉取)