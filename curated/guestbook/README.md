# guestbook: an example chart for educational purpose.

This chart provides example of some of the important features of Helm.

The chart installs a [guestbook](https://kubernetes.io/docs/tutorials/stateless-application/guestbook/) application.

## Installing the Chart

Add the repository to your local environment:
```bash
$ helm repo add apphub https://apphub.aliyuncs.com
```

To install the chart with release name of `guestbook`:

```bash
$ helm install guestbook apphub/guestbook
```

## Configuration

The following tables lists the configurable parameters of the chart and their default values.

| Parameter                  | Description                                     | Default                                                    |
| -----------------------    | ---------------------------------------------   | ---------------------------------------------------------- |
| `image.repository`         | Image repository                                | `resouer/guestbook`                                         |
| `image.tag`                | Image tag                                       | `v1`                                                       |
| `image.pullPolicy`         | Image pull policy                               | `Always`                                                   |
| `service.type`             | Service type                                    | `LoadBalancer`                                             |
| `service.port`             | Service port                                    | `3000`                                                     |
| `redis.slaveEnabled`       | Redis slave enabled                             | `true`                                                     |
| `redis.port`               | Redis port                                      | `6379`                                                     |

Specify each parameter using the `--set [key=value]` argument to `helm install`. For example,

```bash
$ helm install apphub/guestbook --set service.type=NodePort
```

## Use Kustomize to configure the application

TBD

## Use Kruise to upgrade the application

TBD: Link to Kruise Tutorial

### Uninstalling the Chart

To completely uninstall/delete the `guestbook` deployment:

```bash
$ helm delete --purge guestbook
```

The command removes all the Kubernetes components associated with the chart and deletes the release.
