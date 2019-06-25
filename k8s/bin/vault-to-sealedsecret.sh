#!/bin/bash

# vault-to-sealedsecret.sh aat /Users/markry/workspace/hmcts/cnp-flux-config/k8s/aat/pub-cert.pem money-claims-test

env=$1
cert=$2
namespace=$3
secrets=(
    'cmc|notify-api-key'
    'cmc|oauth-client-secret'
    'cmc|citizen-oauth-client-secret'
    'cmc|anonymous-caseworker-username'
    'cmc|anonymous-caseworker-password'
    'cmc|system-update-username'
    'cmc|system-update-password'
    'cmc|ccd-importer-username' 
    'cmc|ccd-importer-password' 
    'ccd|ccd-api-gateway-oauth2-client-secret'
    'ccd|ccd-admin-web-oauth2-client-secret'
    'ccpay|gov-pay-keys-cmc'
)

for i in "${secrets[@]}"; do
    vault=$(echo "$i" | awk -F'|' '{print $1}')-$env
    name=`echo "$i" | awk -F'|' '{print $2}'`
    secret=`az keyvault secret show --vault-name $vault --name $name -o tsv --query value`

    kubectl delete secret $vault-$name

    kubectl create secret generic $vault-$name \
        --from-literal key=$secret \
        --namespace $namespace \
        -o json > $vault-$name.json

    kubeseal --format=yaml --cert=$cert < $vault-$name.json > ../sealed-secrets/$vault-$name.yaml

    rm -f $vault-$name.json

done
