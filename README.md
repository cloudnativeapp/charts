# Happy Helming in China!
其他语言: [English](README_en.md)

## 简介 <a name = "about"></a>

这里是[开放云原生应用中心](https://developer.aliyun.com/hub)的 Helm charts 开源仓库。开放云原生应用中心（简称 AppHub）是一个托管在阿里云上的、完全公益性的 Helm Hub “中国站”。

AppHub 的主要职责之一，是把所有 Helm 官方 Hub 托管的应用，都自动同步到国内，并自动将 Charts 文件中的 gcr.io 等有网络访问问题的 URL 替换成为稳定的国内镜像 URL。

## 如何上手 <a name = "getting_started"></a>

在安装好Helm之后，您只需执行以下语句将我们的仓库添加到 Helm 即可：

```
helm repo add apphub https://apphub.aliyuncs.com
```

我们强烈建议你使用 Helm v3 ，它跟之前的 v2 版本[有本质的区别和优势](https://helm.sh/blog/helm-3-preview-pt2/)。由于 Helm v3 尚未发布到官方下载站点，我们为您提供了一个[国内下载镜像地址](https://github.com/cloudnativeapp/workshop/tree/master/kubecon2019china/charts/guestbook#installing-helm-v3)。

如果您是刚开始接触Helm的用户，我们为你提供了 [Getting Started 指南](https://github.com/cloudnativeapp/workshop/tree/master/kubecon2019china/charts/guestbook)。

此外，[官方的 Helm 快速指南](https://helm.sh/docs/using_helm/)是一份不错的入门资料。

## 关于 Chart 资源

### 自动同步官方 Chart

Github 上有很多热门 Helm charts，但是他们大多数都来维护在国外，其中包含很多在国内无法访问的镜像资源，比如`gcr.io`, `quay.io`，以及无法访问的存储资源，比如 `storage.googleapis.com`， `AWS S3`等等。

AppHub 会定时同步 Helm 官方 Chart 到本仓库，并在这个过程中做**本地化**。具体的说，AppHub 的 Syncer 组件会将其包含的所有不可访问镜像同步到国内，并修改 Chart 的内容，最后经过 CI 验证后发布到 AppHub 站点。这些同步而来并经过本地化的 Chart 存放在`curated/`文件夹下。

>  Syncer 和同步策略，后续会开源出来。

### 用户上传 Chart

我们欢迎用户在仓库上提交用户自己的Chart。在经过校验和审核后，我们会将其合并到本仓库，然后自动发布在[开放云原生应用中心](https://developer.aliyun.com/hub)上。这些 Chart 存放在`submitted/`文件夹下。

### 用户提交 Charts Repo

我们同时欢迎任何人将自己维护的 Charts Repo 的地址加载到开放云原生应用中心，这将使得这些 Repo 里的 Charts 会有更大的机会的被其他开发者搜索并使用到。

> 目前添加用户 Chart Repo 的功能正在开发中，您可以关注本项目的 Roadmap 来跟踪它的进度。

### Roadmap

开放云原生应用中心项目 6 个月时间窗口内的所有 Roadmap，全部以[开源方式](https://github.com/cloudnativeapp/charts/projects/4) 面向开发者开放并接受开发者的指导，您只需将具体诉求提交为 Issue ，经过 Maintainer 的 Review ，就可以进入 Roadmap 成为正式的项目特性。

AppHub 近期的 Roadmap 包括但不限于：
1. 完整的“一键安装”链路
2. 区分 stable 与 incubator 的 repo URL
3. 基于 Overlay 的应用定制能力（Kustomize）
4. 允许用户上传 Chart
5. 允许提交自己的 Charts Repo
6. 开源所有后端组件，包括 Chart 定时同步服务组件（Syncer）
7. 去中心化：AppHub 最终会变成一个用户 Charts Repo 的大集合


## Maintainer

@hongchaodeng @resouer @wonderflow 目前是该仓库的主要维护人员。我们会在近期设立 OWNERS 文件并邀请更多的维护人员加入我们。

## Issues

如果您在使用中遇到了问题，或是对我们的仓库有新的需求，您可以通过[提交issue](https://github.com/cloudnativeapp/charts/issues/new)的方式来与我们沟通。

## 致谢

和很多其他项目一样，我们的工作受益于很多人的付出与支持。在此特别感谢 [Helm 社区](https://helm.sh)在这之中给出的建议与帮助，[阿里云开发者中心](https://developer.aliyun.com/)的网站支持，以及整站后端[阿里云容器镜像服务](https://help.aliyun.com/product/60716.html)久经双十一考验的镜像存储能力。

