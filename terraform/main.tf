provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name
}

resource "aws_subnet" "mysubnets" {
  vpc_id = "vpc-0d73514c2a09be7d2"
  for_each = var.subnets
  cidr_block = each.value.cidr
  availability_zone = each.value.az
  tags = {
    Name = each.key
  }
}