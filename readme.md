# LibreOffice for AWS Lambda as a layer

> 85 MB LibreOffice to fit inside AWS Lambda Layer compressed with Brotli 

## Getting Started

You can add this layer to any Lambda function you want – no matter what runtime

Click on Layers and choose "Add a layer", and "Provide a layer version
ARN" and enter the following ARN.

```
arn:aws:lambda:us-east-1:764866452798:layer:libreoffice:3
```

Works well with [aws-lambda-libreoffice npm package](https://github.com/shelfio/aws-lambda-libreoffice)

## Version ARNs

| LibreOffice version | ARN                                                         |
| ------------------- | ----------------------------------------------------------- |
| 6.1.0.0.alpha0      | `arn:aws:lambda:us-east-1:764866452798:layer:libreoffice:6` |

## License

MIT © [Shelf](https://shelf.io)
