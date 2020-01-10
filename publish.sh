#!/usr/bin/env bash

LO_VERSION=6.4.0.1
LAYER_NAME='libreoffice'

aws s3 cp ./layer.zip s3://shelf-libreoffice-lambda-layer-"$TARGET_REGION"/layer.zip

aws lambda add-layer-version-permission \
  --region "$TARGET_REGION" \
  --layer-name "$LAYER_NAME" \
  --statement-id sid1 \
  --action lambda:GetLayerVersion \
  --principal '*' \
  --version-number "$(aws lambda publish-layer-version \
    --region "$TARGET_REGION" \
    --layer-name libreoffice \
    --description "LibreOffice ${LO_VERSION} binary" \
    --query Version \
    --output text \
    --content S3Bucket=shelf-libreoffice-lambda-layer-"$TARGET_REGION",S3Key=layer.zip
    )"
