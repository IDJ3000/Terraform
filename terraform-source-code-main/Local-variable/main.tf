



locals {
  cidr_block = "10.20.0.0/16"
  ami           = "ami-local"
  instance_type = ["t2.micro", "t3.micro", "t4.micro"]
  tag_local = {
    Name    = "jjtech"
    ENv     = "dev1"
    project = "Tower-terraform"
  }

}

resource "aws_instance" "tower_instance" {
  ami           = local.ami
  instance_type = local.instance_type[1]

  tags = local.tag_local

}

resource "aws_vpc" "name" {
    cidr_block = local.cidr_block
  
}

resource "aws_security_group" "name" {
  
  
}





























# locals {
#   az = "us-west-2a"
#   instance_type = "t2.micro"
#   ami= "ami-0735c191cf914754d"
#   tags = {
#     Name = "webserver"
#     project = "Terraform"
#     Env = "prod"
#   }

# }

# resource "aws_instance" "webserver" {
#   ami = local.ami
#   availability_zone = local.az
#   instance_type = local.instance_type

#   tags = local.general_tags

# }
