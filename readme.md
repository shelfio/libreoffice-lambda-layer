# LibreOffice for AWS Lambda as a layer

> 95 MB LibreOffice to fit inside AWS Lambda Layer compressed with Brotli or gzip

Based on the [serverless-libreoffice](https://github.com/vladgolubev/serverless-libreoffice) project.

## Getting Started

Click on Layers and choose "Add a layer", and "Provide a layer version ARN" and enter the following ARN.

```
arn:aws:lambda:us-east-1:764866452798:layer:libreoffice-brotli:1
```

See the table below for the list of supported regions and runtimes.

Works well with [aws-lambda-libreoffice npm package](https://github.com/shelfio/aws-lambda-libreoffice)

## What's inside this layer?

`libreoffice-brotli` layer contains `lo.tar.br` file which is [LibreOffice v6.4.0.1](https://github.com/vladgolubev/serverless-libreoffice/releases/tag/v6.4.0.1). Node.js has native Brotli unpacking support since version 10 so it's easy to unpack this file natively. Alternatively, you can use [aws-lambda-libreoffice npm package](https://github.com/shelfio/aws-lambda-libreoffice) to simplify this task.

`libreoffice-gzip` layer contains `lo.tar.gz` file which is [LibreOffice v6.4.0.1](https://github.com/vladgolubev/serverless-libreoffice/releases/tag/v6.4.0.1).

## How do I use this layer to launch LibreOffice?

If you don't use [aws-lambda-libreoffice npm package](https://github.com/shelfio/aws-lambda-libreoffice), then these steps are roughly what you need to do.

1. This layer just adds `/opt/lo.tar.br` or `/opt/lo.tar.gz` file to your Lambda runtime
2. Unpack `/opt/lo.tar.br` or `/opt/lo.tar.gz` file during Lambda execution into `/tmp` folder which has 512 MB of free space. Make sure to do this OUTSIDE function handler code.
   This is an expensive task, so better to make it once on a warm start.
3. LibreOffice binary will be located available at `/opt/instdir/program/soffice.bin`
4. Check out `/test/index.js` for CLI arguments needed to run LibreOffice to convert a `.txt` file to `.pdf` for more details

## Version ARNs

### LibreOffice v6.4.0.1 (Amazon Linux 2)

Works with the following [AWS Lambda runtimes](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html) which run on Amazon Linux 2:

- nodejs16.x
- nodejs14.x
- nodejs12.x
- nodejs10.x
- python3.8
- java11

| AWS Region     | Layer ARN (brotli)                                                                                                                                    |
|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| us-east-1      | `arn:aws:lambda:us-east-1:764866452798:layer:libreoffice-brotli:1` or <br> `arn:aws:lambda:us-east-1:764866452798:layer:libreoffice-gzip:1`           |
| eu-west-1      | `arn:aws:lambda:eu-west-1:764866452798:layer:libreoffice-brotli:1` or <br> `arn:aws:lambda:eu-west-1:764866452798:layer:libreoffice-gzip:1`           |
| eu-central-1   | `arn:aws:lambda:eu-central-1:764866452798:layer:libreoffice-brotli:1` or <br> `arn:aws:lambda:eu-central-1:764866452798:layer:libreoffice-gzip:1`     |
| us-west-2      | `arn:aws:lambda:us-west-2:764866452798:layer:libreoffice-brotli:1` or <br> `arn:aws:lambda:us-west-2:764866452798:layer:libreoffice-gzip:1`           |
| us-east-2      | `arn:aws:lambda:us-east-2:764866452798:layer:libreoffice-brotli:1` or <br> `arn:aws:lambda:us-east-2:764866452798:layer:libreoffice-gzip:1`           |
| ap-southeast-2 | `arn:aws:lambda:ap-southeast-2:764866452798:layer:libreoffice-brotli:1` or <br> `arn:aws:lambda:ap-southeast-2:764866452798:layer:libreoffice-gzip:1` |
| eu-west-2      | `arn:aws:lambda:eu-west-2:764866452798:layer:libreoffice-brotli:1` or <br> `arn:aws:lambda:eu-west-2:764866452798:layer:libreoffice-gzip:1`           |
| eu-west-3      | `arn:aws:lambda:eu-west-3:764866452798:layer:libreoffice-brotli:1` or <br> `arn:aws:lambda:eu-west-3:764866452798:layer:libreoffice-gzip:1`           |
| ap-southeast-1 | `arn:aws:lambda:ap-southeast-1:764866452798:layer:libreoffice-brotli:1` or <br> `arn:aws:lambda:ap-southeast-1:764866452798:layer:libreoffice-gzip:1` |
| ap-south-1     | `arn:aws:lambda:ap-south-1:764866452798:layer:libreoffice-brotli:1` or <br> `arn:aws:lambda:ap-south-1:764866452798:layer:libreoffice-gzip:1`         |
| ca-central-1   | `arn:aws:lambda:ca-central-1:764866452798:layer:libreoffice-brotli:1` or <br> `arn:aws:lambda:ca-central-1:764866452798:layer:libreoffice-gzip:1`     |
| sa-east-1      | `arn:aws:lambda:sa-east-1:764866452798:layer:libreoffice-brotli:1` or <br> `arn:aws:lambda:sa-east-1:764866452798:layer:libreoffice-gzip:1`           |

### LibreOffice 6.1.0.0.alpha0 (Amazon Linux 1)

Works with the following [AWS Lambda runtimes](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html) which run on Amazon Linux 2:

- nodejs8.10
- python3.7
- python3.6
- python2.7
- ruby2.5
- java8
- go1.x
- dotnetcore2.1

| AWS Region     | LibreOffice Version | Layer ARN                                                        |
| -------------- | ------------------- | ---------------------------------------------------------------- |
| us-east-1      | 6.1.0.0.alpha0      | `arn:aws:lambda:us-east-1:764866452798:layer:libreoffice:8`      |
| eu-west-1      | 6.1.0.0.alpha0      | `arn:aws:lambda:eu-west-1:764866452798:layer:libreoffice:1`      |
| eu-central-1   | 6.1.0.0.alpha0      | `arn:aws:lambda:eu-central-1:764866452798:layer:libreoffice:1`   |
| us-west-2      | 6.1.0.0.alpha0      | `arn:aws:lambda:us-west-2:764866452798:layer:libreoffice:1`      |
| us-east-2      | 6.1.0.0.alpha0      | `arn:aws:lambda:us-east-2:764866452798:layer:libreoffice:1`      |
| ap-southeast-2 | 6.1.0.0.alpha0      | `arn:aws:lambda:ap-southeast-2:764866452798:layer:libreoffice:1` |
| eu-west-2      | 6.1.0.0.alpha0      | `arn:aws:lambda:eu-west-2:764866452798:layer:libreoffice:1`      |
| ap-southeast-1 | 6.1.0.0.alpha0      | `arn:aws:lambda:ap-southeast-1:764866452798:layer:libreoffice:1` |
| ap-south-1     | 6.1.0.0.alpha0      | `arn:aws:lambda:ap-south-1:764866452798:layer:libreoffice:1`     |

## License

MIT © [Shelf](https://shelf.io)
