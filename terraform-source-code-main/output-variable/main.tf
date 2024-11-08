resource "aws_instance" "web" {
  ami           = "ami-0d04e6652cb408e57"
  instance_type = "t2.micro"
  tags = {
    "Name" = "jjtech-demo"
  }
}



resource "aws_vpc" "name" {
  cidr_block = "10.40.0.0/16"
}

