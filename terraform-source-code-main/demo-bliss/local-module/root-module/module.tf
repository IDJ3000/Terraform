data "aws_ami" "linux2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base-*"] # Windows_Server-2022-English-Full-Base-2023.04.12

  }

}


module "ec2" {
  source        = "../child-module/ec2"
  Do-you-want-to-create-ec2-instance = true
  ami_bliss_id  = data.aws_ami.linux2.id
  instance_type = "t2.nano"
  key_name      = "terraformkp"
  tags = {
    Name       = "webserver"
    Project    = "webserver"
    Created-by = "terraform"
  }
  subnet_id = module.vpc.public_subnet_id
  sg_ids    = [module.sg.sg_id]
}


module "vpc" {
  source = "../child-module/vpc"
  cidr   = "200.0.0.0/16"
  vpc_tags = {
    Name = "terraform-vpc"
  }
  subnet_cidr = "200.0.0.0/24"
}

module "sg" {
  source  = "../child-module/sec-group"
  sg_name = "terraform-sg"
  vpc_id  = module.vpc.vpc_id
}
