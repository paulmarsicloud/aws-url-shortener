terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.39.0"
    }
  }
  backend "s3" {}
}

data "aws_caller_identity" "this" {}
