#!/usr/bin/env bash

LO_VERSION=6.1.0.0.alpha0

REGIONS='
ap-northeast-1
ap-northeast-2
ap-south-1
ap-southeast-1
ap-southeast-2
ca-central-1
eu-central-1
eu-west-1
eu-west-2
eu-west-3
sa-east-1
us-east-1
us-east-2
us-west-1
us-west-2
'

aws s3 cp ./layer.zip s3://shelf-assets/libreoffice-lambda-layer/layer.zip

for region in $REGIONS; do
  aws lambda add-layer-version-permission --region $region --layer-name libreoffice \
    --statement-id sid1 --action lambda:GetLayerVersion --principal '*' \
    --version-number $(aws lambda publish-layer-version --region $region --layer-name libreoffice \
      --description "LibreOffice ${LO_VERSION} binary" --query Version --output text \
      --content S3Bucket=shelf-assets,S3Key=libreoffice-lambda-layer/layer.zip)
done
