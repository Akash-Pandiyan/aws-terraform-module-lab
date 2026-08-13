provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name
}

resource "aws_subnet" "mysubnets" {
  vpc_id = "vpc-0a96e5c7e2384bc13"
  for_each = var.subnets
  cidr_block = each.value.cidr
  tags = {
    Name = each.key
  }
}