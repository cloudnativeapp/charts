# Tekton

## 功能介绍

在Kubernetes集群中安装Tekton使用环境。其中默认启用Tekton Dashboard，可以提供Pipeline的可视化界面。



## 安装使用

```shell
helm install tektoncd tekton
```

运行后看到输出：

```shell
NAME: tekton
LAST DEPLOYED: 2019-08-04 15:06:00.839105318 +0800 CST m=+0.085271389
NAMESPACE: default
STATUS: deployed

NOTES:
This is a 3rd-party Chart integrate tekton pipeline and dashboard with image synced to aliyun for easy access in China.
If dashboard is enabled, to use it, run

kubectl --namespace tekton-pipelines port-forward svc/tekton-dashboard 9097:9097

Then you can access it through localhost:9097.
The uninstall process will delete the whole namespace `tekton-pipelines` which may take a while to finish.
The original project locates at https://github.com/tektoncd/pipeline and https://github.com/tektoncd/dashboard. Lots of features are comming in the future.
NOTE: Jenkins-x-charts also has a chart for tekton locates at https://github.com/jenkins-x-charts/tekton/tree/master/tekton which does not include tekton dashboard.
```

按照NOTES提示，可以在运行`kubectl port-forward`后访问`localhost:9097`访问tekton dashboard。

## 使用参数

```shell
helm install tektoncd tekton --set dashboard.port=8080,dashboard.type=NodePort
```

可以通过改变values中dashboard的参数来设置访问dashboard的方式。
