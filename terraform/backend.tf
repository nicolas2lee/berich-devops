terraform {
  backend "s3" {
    bucket = "berich-terraform-backend-state"
    key    = "berich/terraformcloud/terraform.tfstate"
    region = "eu-west-3"
  }
}