# Storybook

## 功能介绍 

[Storybook](https://storybook.js.org/)是一个功能强大的前端工具，用于为React/Vue/Angular开发UI组件，允许团队设计、构建和组织UI组件

- 提供沙箱来单独构建UI组件，脱离业务上下文
- 模拟现实中很难达到的测试用例
- 将组件使用文档化为样例

## 安装使用

```shell
$ helm install sample-storybook \ 
    ./storybook \
    --set source.repo=https://github.com/toliu/storybook-helm.git
```

运行后看到输出：

 ```shell
NAME: sample-storybook
LAST DEPLOYED: 2019-08-15 16:08:09.099641529 +0900 KST m=+0.072809165
NAMESPACE: default
STATUS: deployed

NOTES:
1. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods -l "app.kubernetes.io/name=storybook,app.kubernetes.io/instance=sample-storybook" -o jsonpath="{.items[0].metadata.name}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl wait --for=condition=ready pods/$POD_NAME
  kubectl port-forward --address 0.0.0.0 $POD_NAME 8080:8080
```

执行NOTES提示的步骤后，即可通过访问`http://127.0.0.1:8080`来使用Storybook

![sample](https://user-images.githubusercontent.com/16846632/63079571-42891300-bf71-11e9-98b9-d008521733da.gif)

## 使用参数

- `source.repo`: 指向项目git地址，如: https://github.com/toliu/storybook-helm.git
- `source.branch`: 指定需要拉取的分支,默认拉取**master**

