# Happy Helming in China!

Other Language: [中文文档](README.md)

## About <a name = "about"></a>

This is the place where we open source Helm charts hosted on [Cloud Native App Hub](https://developer.aliyun.com/hub), short for AppHub. The AppHub is a mirror of [Helm Hub](https://hub.helm.sh) hosted in China, fully open source & non-profit, and developed by three engineers from Alibaba Cloud with their 20% time. 

The reason we want to do this is: there're many container image URLs (e.g. gcr.io, quay.io) and Charts repo (e.g. storage.googleapis.com, AWS S3) are not available due to "networking issue", which makes `helm install` is impossible in China.

## Getting Started <a name = "getting_started"></a>

To add the charts repo for your Helm, run:

```
helm repo add apphub https://apphub.aliyuncs.com
```

**We strongly recommend** you to use Helm v3 and [here is the reason](https://helm.sh/blog/helm-3-preview-pt2/).

In case you are new to Helm, try the [Quickstart Guide](https://helm.sh/docs/using_helm/) first.

## Chart Sources

### Charts from helm.sh

First of all, AppHub syncs charts from [it's official repo](https://github.com/helm/charts) periodically.

And at the same time, AppHub localizes these charts by replacing all unavailable URLs in the chart, verifies the chart by a Kubernetes cluster (CI), and publishes chart to AppHub portal.

These charts are located under `curated/`.

### User submitted charts

Users could submit any charts by creating a PR to this repo, and we would include them on AppHub after verification and PR merge.

These charts are located under `submitted/`.

### User submitted Charts Repo (coming soon!)

We also encourage user to submit their own Charts Repo, we are very happy to include it in AppHub. Eventually, AppHub will become an "aggregator hub" for every user's chart repo and we believe it's where Helm community is going to.

> TBD: This feature is still actively under developing.

### Roadmap

We open source the [roadmap of AppHub here](https://github.com/cloudnativeapp/charts/projects/4) and we are eager to know your ideas about how to make it as a great Helm Hub mirror in China. 

The upcoming features including but not limited to:

1. "One click to install" to any cloud
2. Kustomize the YAML file
3. Enable user to submit chart
4. Enable user to submit charts repo
5. Open source all backend component including our "Charts Syncer"
6. Decentralize the hub: eventually, AppHub will become an "aggregator hub"

## Maintainers

@hongchaodeng @resouer @wonderflow are the active maintainers.
We will be setting up OWNERS file shortly and welcome more maintainers.

## Issues
Feel free to come up with [new issues](https://github.com/cloudnativeapp/charts/issues/new). We are welcome to all kinds of issues including new feature request, existing problems or any other things that could improve your use experience.

## Acknowledgements

Like so many projects, this effort has roots in many places.
Special thanks to the [Helm community](https://helm.sh) for discussing and supporting this work.
**Thanks to Alibaba Cloud for hosting the service and making this free to everyone.**
