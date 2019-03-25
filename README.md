# CMC Product Helm Chart

## Testing

Make sure local kubectl is pointing to sandbox cluster.

In root dir:
```
az acr helm repo add --name hmcts --subscription 1c4f0704-a29e-403d-b719-b90c34ef14c9     
helm dependency update cmc 
helm install --wait --timeout 120 --name cmc --debug -f cmc/values.yaml cmc
```

## TODO

- add send-letter and document-management services
- claim-store fails with: `Caused by: java.net.UnknownHostException: mta.reform.hmcts.net` from sandbox cluster
- frontend fails with: `"idam-api":{"errno":"ENOTFOUND","code":"ENOTFOUND","syscall":"getaddrinfo","hostname":"idam-api.aat.platform.hmcts.net","host":"idam-api.aat.platform.hmcts.net","port":443,"status":"DOWN"}`
- ingress and demo environment setup ???