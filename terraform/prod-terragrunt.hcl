remote_state {
  backend = "s3"

  config = {
    region = "us-east-1"

    bucket  = "url-shortener-terraform-state"
    key     = "terraform.tfstate"
    encrypt = true

    dynamodb_table = "url-shortener-terraform-locks"
  }
}

