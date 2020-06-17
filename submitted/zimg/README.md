# zimg

[zimg](http://zimg.buaa.us/) A lightweight and high performance image storage and processing system.


## 功能介绍

利用 k8s运行zimg图片服务器

## 安装使用

```bash
helm install   zimg/ \
--set persistence.enabled=true,ingress.enabled=true \
--set ingress.hosts[0].host=z.test.com \
--set ingress.tls[0].hosts[0]=z.test.com,ingress.tls[0].secretName=my-certificate-secret \
--set ingress.annotations.cert-manager\\.io/cluster-issuer=letsencrypt-prod

```

| Parameter                        | Description                                             | Default                                                      |
|----------------------------------|---------------------------------------------------------|--------------------------------------------------------------|
| `persistence.enabled`            |Enable persistence using PVC                             | `false`                                                      |
| `ingress.hosts[0].host`          |Hostname to your zimg installation                       | `chart-example.local`					    |
| `ingress.tls[0].hosts[0]`        |TLS hosts                                                | `[]`		                                            |
| `ingress.annotations`            |Ingress annotations                                      | `[]`                                                         |
| `ingress.tls[0].secretName`      |TLS Secret (certificates)                                | `[]`                                                         |
| `service.type`                   |Kubernetes Service type	                             | `ClusterIP`                                                  |
| `service.nodePort`               |NodePort if Service type is  NodePort	             | `nil`                                                        |

