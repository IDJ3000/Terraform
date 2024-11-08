resource "aws_instance" "web_server" {
  count = var.Do-you-want-to-create-ec2-instance == true ? 1 : 0
  ami = var.ami_bliss_id
  key_name = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = var.sg_ids
  subnet_id = var.subnet_id
  instance_type = var.instance_type
  tags = var.tags
}


