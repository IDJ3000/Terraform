# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Creating ec2
resource "aws_instance" "JJTech_App" {
  ami             = "ami-066784287e358dad1"
  instance_type   = "t2.micro"
  subnet_id       = "subnet-0971fda0d6821e726"
  security_groups = ["sg-0be3b957c7f0b23e3"]
  tags = {
    "Name" = "JJTech-App"
  }
}

# Create a VPC
resource "aws_vpc" "tf-test" {
  cidr_block = "10.1.0.0/16"
}

