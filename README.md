# CMC Product Helm Chart

## Testing

Make sure:
- local kubectl is pointing to sandbox cluster.
- sandbox cluster has `money-claims` namespace with a kvcreds secret

In root dir:
```
az acr helm repo add --name hmcts --subscription 1c4f0704-a29e-403d-b719-b90c34ef14c9     
helm dependency update cmc 
helm install --wait --timeout 120 --namespace money-claims --name cmc --debug -f cmc/values.yaml cmc
```

## TODO

- add send-letter and document-management services (Praveen in platform looking into - send-letter chart is ready)
- check azure devops - ci-values will need adjusting? what do we define here - which env?
- ingress and demo environment setup ???