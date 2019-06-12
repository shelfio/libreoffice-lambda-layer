#!/usr/bin/env bash

LO_VERSION=6.1.0.0.alpha0

REGIONS='
us-east-1
'

for region in $REGIONS; do
  aws lambda add-layer-version-permission --region $region --layer-name libreoffice \
    --statement-id sid1 --action lambda:GetLayerVersion --principal '*' \
    --version-number $(aws lambda publish-layer-version --region $region --layer-name libreoffice --zip-file fileb://layer.zip \
      --description "LibreOffice ${LO_VERSION} binary" --query Version --output text)
done
