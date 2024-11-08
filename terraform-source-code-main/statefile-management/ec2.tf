resource "aws_instance" "webserver" {
  ami           = "ami-00beae93a2d981137"
  instance_type = "t3.nano"
  tags = {
    Name = "${terraform.workspace}-instance"
  }
}

