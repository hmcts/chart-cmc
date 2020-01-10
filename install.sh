#!/bin/sh
#helm upgrade demo-v1 cmc \
#  -f cmc/values.yaml -f cmc/${1}.yaml \
#  --install --wait --timeout ${2} \
#  --namespace money-claims-test

helm upgrade cmc-test cmc \
  -f cmc/values.yaml -f ci-values.yaml \
  --install --wait --timeout 600 \
  --namespace money-claims
