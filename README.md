# AWS URL Shortener

[http://makeitshort.link](http://makeitshort.link)

## Overview

Welcome to the world's **simplest** URL Shortening service! Built on AWS using Serverless services, this product takes any URL and returns a shortened URL, which simply forwards to the original input URL. This product works similar to [tiny.url](tinyurl.com) and [bit.ly](https://bitly.com/) but is completely open source!

If you google search "Systems Design Interview URL Shortening" and read some of the links, you will see some rock-solid yet kind of complicated system designs. The idea behind this project was to make an architecture for a URL shortening service using the **least** amount of services and complexity as possible.

## Architecture

![Architecture](/.github/images/architecture.png)

Basically, a user provides a long URL to the S3 website, which in turn calls a Lambda function. The Lambda function simply creates an empty S3 Object, named with a random 5 character string, with nothing but a Metadata header for `x-amz-website-redirect-location` with the long URL. The shortened link is then provided for the user to test.

A more accurate AWS architecture diagram is as follows:

![AWS Architecture](/.github/images/aws_architecture.png)

## Contributing

Please feel free to reach out directly via a Pull Request or contact me via a DM: [@paulmarsicloud](https://twitter.com/paulmarsicloud)

There are **many** shortcomings of this URL Shortener - namely HTTPS. However, I have put together a [Roadmap](https://github.com/paulmarsicloud/aws-url-shortener/wiki/Roadmap!) as this is where we'll keep track of upcoming changes on the horizon!
