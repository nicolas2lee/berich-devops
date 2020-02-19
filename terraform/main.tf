terraform {
  backend "s3" {
    bucket = "berich-terraform-backend-state"
    key    = "berich/terraformcloud/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_dynamodb_table" "berich-dynamodb-table-fund" {
  name           = "Fund"
#  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "id"
#  range_key      = "GameTitle"

  attribute {
    name = "id"
    type = "S"
  }

#  ttl {
#    attribute_name = "TimeToExist"
#    enabled        = false
#  }

#  global_secondary_index {
#    name               = "GameTitleIndex"
#    hash_key           = "GameTitle"
#    range_key          = "TopScore"
#    write_capacity     = 10
#    read_capacity      = 10
#    projection_type    = "INCLUDE"
#    non_key_attributes = ["UserId"]
#  }

  tags = {
    Name        = "berich-table-fund"
    Environment = "dev"
  }
}