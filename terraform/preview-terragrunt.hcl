remote_state {
  backend = "s3"

  config = {
    region = "us-east-1"

    bucket  = "preview-url-shortener-terraform-state"
    key     = "terraform.tfstate"
    encrypt = true

    dynamodb_table = "preview-url-shortener-terraform-locks"
  }
}

inputs = {
  environment = "preview."
}
