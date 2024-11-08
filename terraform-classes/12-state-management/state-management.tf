
## state-management.tf
provider "aws" {
  region = "us-east-1"
  # access_key = "YOUR-ACCESS-KEY"
  # secret_key = "YOUR-SECRET-KEY"
}

data "aws_ami""app" {
  most_recent      = true
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.app.id
  instance_type = "t2.micro"
tags = {
  Name = "myEC2-instance"
  Environment = "dev"
  Owner = "JJtech"
}
}

resource "aws_iam_user" "jjtech" {
  name = "JJtech-user"
}

terraform {
  backend "s3" {
    bucket = "terraform-state-idj"
    key    = "demo.tfstate"
    region = "us-east-1"
    # access_key = "YOUR-ACCESS-KEY"
    # secret_key = "YOUR-SECRET-KEY"
  }
}


## Commands used for State Management 


# terraform state list
# terraform state mv aws_instance.webapp aws_instance.myec2
# terraform state pull
# terraform state rm aws_instance.myec2
