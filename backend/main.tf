provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "sham" {
  bucket = "demo-terraform-eks-state-bucket-rishabh-123"  # Example unique name
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_dynamodb_table" "basic-dynamodb_table" {
  name         = "terraform-eks-state-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}