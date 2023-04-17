terraform {
  backend "s3" {
    bucket         = "fake-infra-terraform-state"
    region         = "eu-west-1"
    encrypt        = "true"
    key            = "fake-infra.tfstate"
    dynamodb_table = "fake-infra-terraform-state-lock"
  }
}
