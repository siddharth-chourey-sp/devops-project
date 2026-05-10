terraform {
  backend "s3" {
    bucket         = "devops-tf-state-sid"
    key            = "infra/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "tf-lock"
    encrypt        = true
  }
}
