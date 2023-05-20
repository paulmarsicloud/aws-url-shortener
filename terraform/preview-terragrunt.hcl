remote_state {
  backend = "s3"

  config = {
    region = "us-east-1"

    bucket  = "preview.meeple.pro-terraform-state"
    key     = "terraform.tfstate"
    encrypt = true

    dynamodb_table = "preview.meeple.pro-terraform-locks"
  }
}

inputs = {
  environment = "preview."
}
