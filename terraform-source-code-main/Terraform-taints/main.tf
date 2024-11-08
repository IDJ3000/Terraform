# terraform taint aws_security_group.web_server_sg_tf
# terraform untaint aws_security_group.web_server_sg_tf
# terraform applyy -replace aws_security_group.web_server_sg_tf

data "aws_vpc" "selected" {
  default = true
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
