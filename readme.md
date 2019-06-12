# LibreOffice binary for AWS Lambda

A [layer](https://aws.amazon.com/about-aws/whats-new/2018/11/aws-lambda-now-supports-custom-runtimes-and-layers/)
for AWS Lambda that allows your functions to use LibreOffice.

## Getting Started

You can add this layer to any Lambda function you want – no matter what runtime

Click on Layers and choose "Add a layer", and "Provide a layer version
ARN" and enter the following ARN.

```
arn:aws:lambda:us-east-1:764866452798:layer:libreoffice:3
```

## Version ARNs

| LibreOffice version | ARN                                                         |
| ------------------- | ----------------------------------------------------------- |
| 6.1.0.0.alpha0      | `arn:aws:lambda:us-east-1:764866452798:layer:libreoffice:3` |

## License

MIT © [Shelf](https://shelf.io)
