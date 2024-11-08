resource "aws_vpc" "vpc" {
  cidr_block = var.cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = var.vpc_tags
}

resource "aws_subnet" "public_subnet" {
  cidr_block = var.subnet_cidr
  vpc_id = aws_vpc.vpc.id
}

