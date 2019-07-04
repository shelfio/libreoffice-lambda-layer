#!/usr/bin/env bash

LO_VERSION=6.1.0.0.alpha0

# It's 1 region for now since S3 bucket is there
REGIONS='
us-east-1
us-east-2
eu-west-1
eu-central-1
us-west-2
'

aws s3 cp ./layer.zip s3://shelf-libreoffice-lambda-layer-us-east-1/layer.zip
aws s3 cp ./layer.zip s3://shelf-libreoffice-lambda-layer-us-east-2/layer.zip
aws s3 cp ./layer.zip s3://shelf-libreoffice-lambda-layer-eu-west-1/layer.zip
aws s3 cp ./layer.zip s3://shelf-libreoffice-lambda-layer-eu-central-1/layer.zip
aws s3 cp ./layer.zip s3://shelf-libreoffice-lambda-layer-us-west-2/layer.zip

for region in $REGIONS; do
  aws lambda add-layer-version-permission --region $region --layer-name libreoffice \
    --statement-id sid1 --action lambda:GetLayerVersion --principal '*' \
    --version-number $(aws lambda publish-layer-version --region $region --layer-name libreoffice \
      --description "LibreOffice ${LO_VERSION} binary" --query Version --output text \
      --content S3Bucket=shelf-libreoffice-lambda-layer-$region,S3Key=layer.zip)
done
