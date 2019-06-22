# Charts
Other Language: [中文文档](README.md)

## About <a name = "about"></a>

This is the place where we open source Helm charts hosted on [Cloud Native App Hub](https://developer.aliyun.com/hub).

## Getting Started <a name = "getting_started"></a>

In case you are new to Helm, try the [Quickstart Guide](https://helm.sh/docs/using_helm/) first.

To add the charts repo for your local client, run:

```
helm repo add apphub https://apphub.aliyuncs.com
```

## Chart Sources

### Open source charts

Many popular open source Helm charts exists on Github.
But they are mostly hosted outside China, and contain content unable to access from China. For example, container images on `gcr.io` .
We do our best to localize these charts and synchronize with upstream periodically.
The localized charts and content will be hosted in China on Alibaba Cloud for availability and speed-up.

These charts are located under `curated/`.

### User submitted charts

Users could submit charts definition and we would include them on [Cloud Native App Hub](https://developer.aliyun.com/hub).

These charts are located under `submitted/`.

## Maintainers

@hongchaodeng @resouer @wonderflow are the active maintainiers.
We will be setting up CODEOWNERS file shortly and welcome more maintainers.

## Issues
Feel free to come up with [new issues](https://github.com/cloudnativeapp/charts/issues/new). We are welcome to all kinds of issues including new feature request, existing problem or any other things that could improve your use experience.

## Acknowledgements

Like so many projects, this effort has roots in many places.
Special thanks to the Helm community for discussing and supporting this work.
Thanks to Alibaba Cloud for hosting the service.
