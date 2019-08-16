# slate

## 功能介绍

Slate helps you create beautiful, intelligent, responsive API documentation.
只需要将自己的API利用markdown编写，或将现有的API从平台过工具导入为markdown格式存放在slate中即可。


## 安装使用 

```shell
helm install myslate slate
```

运行后看到输出：

```shell
#git clone https://github.com/cloudnativeapp/charts.git
#git checkout tag_name
#cd submitted/slate
#helm install myslate slate/
NAME: myslate
LAST DEPLOYED: 2019-08-16 15:27:52.369424716 +0800 CST m=+0.129371478
NAMESPACE: default
STATUS: deployed

NOTES:
1. Get the application URL by running these commands:
  export NODE_PORT=$(kubectl get -o jsonpath="{.spec.ports[0].nodePort}" services myslate)
  export NODE_IP=$(kubectl get nodes -o jsonpath="{.items[0].status.addresses[0].address}")
  echo http://$NODE_IP:$NODE_PORT
  

#kubectl get pods
myslate-7ccbf64fff-b6rds                                  1/1     Running     0          74s

#kubectl get deploy
myslate                                  1/1     1            1           3m10s

#kubectl get svc
myslate                             NodePort    10.96.128.97     <none>        4567:30568/TCP                                          2m4s
```

执行完 NOTES 中提示命令的命令即可在浏览器中访问 `http://$NODE_IP:$NODE_PORT` 查看。

## 效果示例

<p align="center"><img src="https://raw.githubusercontent.com/lord/img/master/screenshot-slate.png" width=700 alt="Screenshot of Example Documentation created with Slate"></p>

<p align="center"><em>The example above was created with Slate. Check it out at <a href="https://lord.github.io/slate">lord.github.io/slate</a>.</em></p>

