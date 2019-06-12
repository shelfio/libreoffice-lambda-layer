#!/usr/bin/env bash

rm -rf layer
unzip layer.zip -d layer

cd layer
brotli -d lo.tar.br
tar -xvf lo.tar

cd ../test

docker run --rm -v "$PWD":/var/task -v "$PWD"/../layer:/opt lambci/lambda:nodejs8.10

rm -rf layer
