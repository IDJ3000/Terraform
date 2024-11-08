data "aws_ami" "example" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20240423"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.example.id
  instance_type = var.instance_type
  tags = {
    Name = "${terraform.workspace}-instance"
  }
}

resource "aws_vpc" "network" {
  cidr_block = var.cidr_block
}


resource "aws_subnet" "subnet1" {
  vpc_id = aws_vpc.network.id
  cidr_block = "10.50.0.0/24"
}


