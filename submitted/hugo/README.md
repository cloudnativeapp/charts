# Hugo Chart

![hugo](https://d33wubrfki0l68.cloudfront.net/30790d6888bd8af863fb2b5c33a7f337cdbda243/4e867/images/hugo-logo-wide.svg)

[Hugo](https://gohugo.io/) is one of the most popular open-source static site generators. With its amazing speed and flexibility, Hugo makes building websites fun again.

## Introduction

This chart helps you run a blog built by hugo using a URL on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
# set source_url
$ helm install my-release hugo \
--set source_url=https://github.com/sunny0826/hugo-demo
# set ingress
$ helm install my-release hugo \
--set source_url=https://github.com/sunny0826/hugo-demo \
--set ingress.enabled=true \
--set ingress.hosts={hugo.maoxianplay.com}  
```
__Please resolve the DNS to ingress.__

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
`image.repository`           	| Image source repository name.         			| `nginx`
`image.tag`                 	| Image tag.                    		  	    	| `latest`
`image.pullPolicy`         		| Image pull policy                  				| `IfNotPresent`
`source_url`             		| Url of source.                    				| `https://github.com/sunny0826/hugo-demo`
`config`                		| `ngxinx` config.                  				| `server {...}`
`ingress.enabled`         		| Whether to open ingress.             				| `false`
`ingress.hosts`          		| Ingress hosts.                       				| `{}`
`resources`                		| CPU/Memory resource requests/limits				| `{}`

`image.registry` can use Aliyun image source.

`image.repository` can use `nginx` or `tengine`.
