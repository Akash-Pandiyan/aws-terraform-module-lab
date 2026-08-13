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

resource "aws_internet_gateway" "gw" {
  vpc_id = "vpc-0a96e5c7e2384bc13"

  tags = {
    Name = "Akash-IG"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = "vpc-0a96e5c7e2384bc13"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "Public_RT"
  }
}     


resource "aws_route_table_association" "rt_associate" {
  for_each = { for k, v in var.subnets : k => v if v.public }
  subnet_id      = aws_subnet.mysubnets[each.key].id
  route_table_id = aws_route_table.public_rt.id
}
