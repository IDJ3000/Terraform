resource "aws_instance" "name" {
  count = var.create_ec2 ? 1 : 0
    ami = var.ami
    instance_type = var.instance-type
  tags = {
    "Name" = "jtech-module"
  }
}