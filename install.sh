#!/bin/sh

helm upgrade chart-cmc-preview cmc \
  -f cmc/values.yaml -f cmc/values.preview.yaml \
  --install --wait --timeout 900s \
  --namespace money-claims \
  --set global.subscriptionId=1c4f0704-a29e-403d-b719-b9
