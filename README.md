# Charts

## About <a name = "about"></a>

This is the place where we open source Helm charts hosted on [Cloud Native App Hub](https://developer.aliyun.com/hub).

## Getting Started <a name = "getting_started"></a>

In case you are new to Helm, try the [Quickstart Guide](https://helm.sh/docs/using_helm/) first.

To add the charts repo for your local client, run:

```
helm repo add aliyun https://apphub.aliyuncs.com
```

## Chart Sources

### Open source charts

There are many popular Helm charts on Github.
But they are hosted outside China, and they contain content unavailable in China. For example, `gcr.io` prefixed images.
We do our best to localize these charts and synchronize with upstream charts periodically.
The localized charts will be hosted in China on Alibaba Cloud for availability and speed-up.

These charts are located under `curated/`.

### User submitted charts

Users could submit charts definition and we would include them on [Cloud Native App Hub](https://developer.aliyun.com/hub).

These charts are located under `submitted/`.

## Maintainers

@hongchaodeng @resouer @wonderflow are the active maintainiers.
We will be setting up CODEOWNERS file shortly and welcome more maintainers.

## Acknowledgements

Like so many projects, this effort has roots in many places.
Special thanks to the Helm community for discussing and supporting our work.
Thanks to Alibaba Cloud for the hosted service.
