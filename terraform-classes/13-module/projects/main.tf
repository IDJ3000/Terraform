
variable "name" {
  type = string
}

resource "aws_vpc" "JJtech_vpc" {
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = var.name
  }
}

# Below is the resource block which creates EC2 Instance
resource "aws_instance" "JJTech_Instance" {
  count = 4
  ami           = "ami-0182f373e66f89c85"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0fb20794fcbd781e9"
  tags = {
    Name = var.name
  }
  credit_specification {
    cpu_credits = "standard" 
    }
}

variable "ami_tag" {
  default = "infrastructure"
}

data "aws_ami" "app_ami" {
  most_recent = false
  owners = ["self"]

  filter {
    name   = "tag:application-group"
    values = [var.ami_tag]
  }
}

data "aws_subnet" "jjtech_sn" {
   vpc_id = "vpc-0b87e8f4572a9d420"
   filter {
     name   = "tag:application"
     values = ["JJTech-App"]
   }
}
