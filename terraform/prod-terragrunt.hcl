remote_state {
  backend = "s3"

  config = {
    region = "us-east-1"

    bucket  = "meeple.pro-terraform-state"
    key     = "terraform.tfstate"
    encrypt = true

    dynamodb_table = "meeple.pro-terraform-locks"
  }
}

