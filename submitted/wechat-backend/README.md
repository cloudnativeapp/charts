# WeChat Account Backend

[wechat-backend](https://github.com/jenkins-zh/wechat-backend) is a backend api server for the WeChat Account.

## Introduction

This chart helps you run a backend api server. This server could allow you to manage your wechat account easily. You can provide a config file for it, then [wechat-backend](https://github.com/jenkins-zh/wechat-backend) could auto replay according the config file. Hightlight is that git webhook is supported. So, anyone could help you to maintain your auto reply messages without a admin permission.

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
# set source_url
$ helm install my-release wechat-backend \
--set source_url=https://github.com/jenkins-zh/wechat-backend-chart
```

## Uninstall

To uninstall/delete the `my-release` deployment:

```bash
$ helm uninstall my-release
```

## Configuration

The following table lists the configurable parameters of the hugo chart and their default values.

Parameter                 	 	| Description                        				| Default
------------------------------- | ------------------------------------------------- | ----------------------------------------------------------
`image.registry`           		| Image registry.                    				| `docker.io`
`image.repository`           	| Image source repository name.         			| `surenpi/jenkins-wechat`
`image.tag`                 	| Image tag.                    		  	    	| `latest`
`image.pullPolicy`         		| Image pull policy                  				| `IfNotPresent`
`source_url`             		| Url of source.                    				| `https://github.com/jenkins-zh`
`ingress.enabled`         		| Whether to open ingress.             				| `false`
`ingress.hosts`          		| Ingress hosts.                       				| `{}`
`resources`                		| CPU/Memory resource requests/limits				| `{}`

`image.registry` can use Aliyun image source.
