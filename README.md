# CMC Product Helm Chart

## Testing 

Make sure:
- local kubectl is pointing to preview cluster.
- preview cluster has `money-claims` namespace with a kvcreds secret

In root dir:
```
az acr helm repo add --name hmctspublic --subscription 1c4f0704-a29e-403d-b719-b90c34ef14c9     
helm dependency update cmc

## Delete
helm delete --purge cmc

## Lint
helm lint cmc -f cmc/values.{env}.yaml

## Install
helm install cmc --name cmc --namespace money-claims -f cmc/values.{env}.yaml --debug --wait --timeout 120
```

## TODO

- check azure devops - ci-values will need adjusting? what do we define here - which env?
- ingress and demo environment setup ???
