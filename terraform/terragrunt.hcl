remote_state {
  backend = "s3"

  config = {
    region = "us-east-1"

    bucket  = "aws-url-shortener-terraform-state"
    key     = "terraform.tfstate"
    encrypt = true

    dynamodb_table = "aws-url-shortener-terraform-locks"
  }
}
