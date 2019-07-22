# hexo

## 功能介绍 *(在 kubernetes 中运行自己的 hexo 博客)*

展示一个web页面，可以根据values值改变页面的输出内容。


## 安装使用 *(此处介绍安装方式)*

```shell
helm install my-hello-world-test1 my-hello-world
```

运行后看到输出：

```shell
NAME: my-hell-world
LAST DEPLOYED: 2019-07-16 10:30:41.927128 +0800 CST m=+0.132308108
NAMESPACE: default
STATUS: deployed

NOTES:
1. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods -l "app.kubernetes.io/name=my-hello-world,app.kubernetes.io/instance=my-hell-world" -o jsonpath="{.items[0].metadata.name}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl port-forward $POD_NAME 8080:80
```

执行完 NOTES 中提示命令的命令即可在浏览器中访问 `http://127.0.0.1:8080` 查看。

## 使用参数 *(此处介绍进阶功能)*

```shell
helm install my-hello-world-chart-test2 my-hello-world --set Username="Cloud Native"
```

同样按输出的 NOTES 执行后看到的页面输出会有变化。


*ps: 阅读[《Helm Chart 创作指南》](https://cloudnativeapp.gitbook.io/handbook/helm-chart-creation-tutorial)学习如何编写一个Charts。*