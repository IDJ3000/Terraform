
### Data_sources for ami
##Search for ami int he terraform bbible and get to data sources for ami

data "aws_ami" "linux2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base-2023.04.12"] # Windows_Server-2022-English-Full-Base-2023.04.12

  }


}



# resource "aws_instance" "web" {
#   ami           = data.aws_ami.example.id
#   instance_type = "t3.micro"

#   tags = {
#     Name = "HelloWorld"
#   }
# }

###################################################################################
# Data sorce for vpc_id


# data "aws_vpc" "selected" {
#   #id = "vpc-03610b40c03978581"
#   tags = {
#     Name = "Anselme-VPC-A"
#   }
# }

data "aws_vpc" "selected" {
  default = true
}

output "vpc-arn" {
  value = data.aws_vpc.selected.arn

}

output "ipv6" {
  value = data.aws_vpc.selected.ipv6_association_id

}

output "owner-id" {
  value = data.aws_vpc.selected.owner_id
}


resource "aws_security_group" "web_server_sg_tf" {
  name        = "web-server-sg-tf"
  description = "Allow HTTPS to web server"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "HTTPS ingress"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "http ingress"
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

##########################################################

# data "aws_vpc" "name" {
#   filter {
#     name   = "tag:Name"
#     values = ["pass-ur-own-vpc-tag-value"]
#   }
# }

# data "aws_availability_zone" "available" {
#   name = "ca-central-1a"
# }

# resource "aws_subnet" "name" {
#   vpc_id            = data.aws_vpc.name.id
#   availability_zone = data.aws_availability_zone.available.name
#   cidr_block        = "10.0.60.0/24"
#   tags = {
#     "Name" = "test_vpc"
#   }
# }



