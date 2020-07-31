#!/usr/bin/env bash

LO_VERSION=6.4.0.1

aws s3 cp ./"$LAYER_FILENAME" s3://shelf-lambda-layers-"$TARGET_REGION"/"$LAYER_FILENAME"

aws lambda add-layer-version-permission \
  --region "$TARGET_REGION" \
  --layer-name "$LAYER_NAME" \
  --statement-id sid1 \
  --action lambda:GetLayerVersion \
  --principal '*' \
  --version-number "$(aws lambda publish-layer-version \
    --region "$TARGET_REGION" \
    --layer-name "$LAYER_NAME" \
    --description "${LAYER_NAME} ${LO_VERSION} binary" \
    --query Version \
    --output text \
    --content S3Bucket=shelf-lambda-layers-"$TARGET_REGION",S3Key="$LAYER_FILENAME"
    )"
