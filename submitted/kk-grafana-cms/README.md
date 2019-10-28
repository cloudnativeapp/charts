# cms-grafana-builder

![grafana](https://raw.githubusercontent.com/grafana/grafana/master/docs/logo-horizontal.png)

The open-source platform for monitoring and observability.

## Introduction

This chart helps you run a grafana server that include aliyun cms dashboard.

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
# start
$ helm install my-release kk-grafana-cms \
--namespace {your_namespace} \
--set access_key_id={your_access_key_id} \
--set access_secret={your_access_secret} \
--set region_id={your_aliyun_region_id} \
--set password={admin_password}

# set ingress and open tls
helm install my-release kk-grafana-cms \
--namespace {your_namespace} \
--set access_key_id={your_access_key_id} \
--set access_secret={your_access_secret} \
--set region_id={your_aliyun_region_id} \
--set password={admin_password} \
--set ingress.enabled=true \
--set ingress.hosts[0].host="{your_host}",ingress.hosts[0].paths[0]="/"
--set ingress.tls[0].secretName="{your_tls_secret_name}",ingress.tls[0].hosts[0]="{your_tls_host}"
```
__Please resolve the DNS to ingress.__

## Uninstall

To uninstall/delete the `my-release` deployment:

```bash
$ helm uninstall my-release
```

## Configuration

The following table lists the configurable parameters of the kk-grafana-cms chart and their default values.

Parameter                 	 	| Description                        				| Default
------------------------------- | ------------------------------------------------- | ----------------------------------------------------------
`plugins`           	        | Grafana plugin list.         	            		| `grafana-clock-panel,ryantxu-ajax-panel,farski-blendstat-panel,grafana-simple-json-datasource,https://github.com/aliyun/aliyun-cms-grafana/archive/master.zip;aliyun-cms-grafana`
`access_key_id`                	| Aliyun Access Key Id.                  			| ``
`access_secret`                	| Aliyun Access Secret.                  			| ``
`region_id`                    	| Aliyun Region Id.                        			| `cn-shanghai`
`password`                    	| Grafana admin password.                  			| `admin`
`schedule`                    	| CronJob schedule.                     			| `"30 2 * * *"`
`image.repository`           	| Image source repository name.         			| `registry-vpc.cn-shanghai.aliyuncs.com/keking/grafana`
`image.pullPolicy`         		| Image pull policy                  				| `IfNotPresent`
`build_image.repository`        | Build image source repository name.         	    | `registry-vpc.cn-shanghai.aliyuncs.com/keking/grafana-build`
`build_image.tag`              	| Image tag.                    		  	    	| `3`
`build_image.pullPolicy`       	| Image pull policy                  				| `IfNotPresent`
`ingress.enabled`         		| Whether to open ingress.             				| `false`
`ingress.hosts`          		| Ingress hosts.                       				| `[]`