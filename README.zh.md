# Charts
其他语言: [English](README.md)

## 简介 <a name = "about"></a>

这里是[云原生Apphub](https://developer.aliyun.com/hub)的Helm charts开源仓库。

## 如何上手 <a name = "getting_started"></a>

如果您是刚开始接触Helm的用户，[Helm 快速指南](https://helm.sh/docs/using_helm/)是一份不错的入门资料。

在安装好Helm之后，您可以执行以下语句将我们的仓库添加到您的本地客户端

```
helm repo add apphub https://apphub.aliyuncs.com
```

## Chart 资源

### 开源 Chart

Github上有很多热门的开源Helm charts，但是他们大多数都来源于国外，其中包含很多在国内难以访问的镜像资源，如来源于`gcr.io`的容器镜像。我们定期对这些Chart做本土化，将其包含的镜像同步到国内较易访问的阿里云，以便国内用户使用。这些本土化过的Chart存放在`curated/`文件夹下。

### 用户上传 Chart

我们欢迎用户在仓库上提交用户自己的Chart。在经过校验和审核后，我们会将其放置在我们的[云原生Apphub](https://developer.aliyun.com/hub)上，供所有Helm用户使用。这些Chart存放在`submitted/`文件夹下。

## 维护人员

@hongchaodeng @resouer @wonderflow 是该仓库的主要维护人员。我们会在近期设立CODEOWNERS文件并邀请更多的维护人员加入我们。

## Issues

如果您在使用中遇到了问题，或是对我们的仓库有新的需求，您可以通过[提交issue](https://github.com/cloudnativeapp/charts/issues/new)的方式来与我们沟通。

## 致谢

和很多其他项目一样，我们的工作受益于很多人的付出与支持。特别感谢Helm社区在这之中给出的建议与帮助，以及阿里云对于仓库服务的基础设施支持。

