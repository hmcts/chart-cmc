#!/bin/sh

helm upgrade chart-cmc-preview cmc \
  -f cmc/values.yaml -f cmc/values.preview.yaml \
  --install --wait --timeout 900s \
  --namespace money-claims
