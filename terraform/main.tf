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

resource "aws_s3_bucket" "berich_fund_list_bucket" {
  bucket = "fund-list"
  acl    = "public-read"
  #policy = "${file("policy.json")}"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}