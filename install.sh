#!/bin/sh

helm install chart-cmc-ci-test cmc \
     --namespace money-claims \
     -f ci-values.yaml \
     --wait --timeout 900s
