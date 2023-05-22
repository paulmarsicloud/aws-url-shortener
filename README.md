# AWS URL Shortener

[https://makeitshort.link](https://makeitshort.link)

## Overview

Welcome to the world's **simplest** URL Shortening service! Built on AWS using Serverless services, this product takes any URL and returns a shortened URL, which simply forwards to the original input URL. This product works similarly to [tiny.url](tinyurl.com) and [bit.ly](https://bitly.com/) but is completely open source!

If you google search "Systems Design Interview URL Shortening" and read some of the links, you will see some rock-solid yet kind of complicated system designs. The idea behind this project was to make an architecture for a URL shortening service using the **least** amount of services and complexity as possible.

## Architecture

![Architecture](/.github/images/architecture.png)

Basically, a user goes to a CloudFront S3 website, provides a long URL which then invokes a Lambda function. The Lambda function simply creates an empty S3 Object, named with a random 5 character string, with a Metadata header for `x-amz-website-redirect-location` referencing long URL. The shortened link is then provided back to the website for the user to test.

A more accurate AWS architecture diagram is as follows:

![AWS Architecture](/.github/images/aws_architecture.png)

## Host your own

In order to host your own AWS URL Shortener, you need only three things:

1. An AWS Account
2. A Domain Name that resides in Route53
3. A wildcard (e.g `*.makeitshort.link`) SSL Certificate

If you possess those three things, go ahead and fork this repo and update your Terraform env variables. The GitHub Actions workflow should take care of the creation after that!

## Contributing

Please feel free to reach out directly via a Pull Request or contact me via a DM: [@paulmarsicloud](https://twitter.com/paulmarsicloud)

There are **many** shortcomings of this URL Shortener - however, I have put together a [Roadmap](https://github.com/paulmarsicloud/aws-url-shortener/wiki/Roadmap!) as this is where we'll keep track of upcoming changes on the horizon!
