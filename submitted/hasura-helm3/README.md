# hasura-helm3-chart
This a simple helm v3 chart for [Hasura](https://hasura.io) v1.0.0-beta.6

## Prerequisites
- Kubernetes cluster (1 node with Minikube or Docker is OK)
- Helm ~v3.0.0.beta1
- kubectl

## Installation
1. This chart doesn't include dependencies: postgresql, please install postgresql chart at first
2. Install hasura chart:

```bash
    helm install test-hasura ./hasura-helm3-chart \ 
    --set postgresDbUrl=HASURA_GRAPHQL_DATABASE_URL
```

> Examples of HASURA_GRAPHQL_DATABASE_URL:
>
> ```bash
>    postgres://admin:password@postgresql-service-host:5432/my-db
>    postgres://admin:@postgresql-service-host:5432/my-db (if there is no password)
> ```



3. After the pod deployed and ready, you can head to http://localhost and the hasura console should be loaded!

## Contributions
Welcome any PR to improve this chart. Let's [Hasura](https://hasura.io)
