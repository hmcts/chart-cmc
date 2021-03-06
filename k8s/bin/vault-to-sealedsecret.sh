#!/bin/bash

# vault-to-sealedsecret.sh aat /Users/kariml/Development/cnp-flux-config/k8s/aat/pub-cert.pem money-claims

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
    'cmc|postcode-lookup-api-key'
    'cmc|os-postcode-lookup-api-key'
    'cmc|cmc-s2s-secret'
    'cmc|claim-store-s2s-secret'
    #'cmc|AppInsightsInstrumentationKey'
    'cmc|cmc-db-password'
    'cmc|milo-recipient'
    'cmc|staff-email'
    'cmc|live-support-email'
    'cmc|rpa-email-sealed-claim'
    'cmc|rpa-email-more-time-requested'
    'cmc|rpa-email-response'
    'cmc|rpa-email-ccj'
    'cmc|rpa-email-paid-in-full'
    'cmc|launchDarkly-sdk-key'
    'cmc|sendgrid-api-key'
)

for i in "${secrets[@]}"; do
    vault=$(echo "$i" | awk -F'|' '{print $1}')-$env
    name=$(echo "$i" | awk -F'|' '{print $2}')
    secret=$(az keyvault secret show --vault-name $vault --name $name -o tsv --query value)

    # kubectl delete secret $vault-$name

    kubectl create secret generic $name \
        --from-literal key=$secret \
        --namespace $namespace \
        -o json > $name.json

    kubeseal --format=yaml --cert=$cert < $name.json > ../sealed-secrets/$name.yaml

    # rm -f $team-$name.json

done
