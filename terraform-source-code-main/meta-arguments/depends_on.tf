# resource "aws_instance" "web" {
#   ami                    = "use-your-own-ami"
#   instance_type          = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.web_server_sg_tf.id]

#   depends_on = [
#     aws_security_group.web_server_sg_tf,
#   ]

# }


# resource "aws_security_group" "web_server_sg_tf" {
#   name        = "web-server-sg-tf"
#   description = "Allow HTTPS to web server"

#   ingress {
#     description = "HTTPS ingress"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "http ingress"
#     protocol    = "tcp"
#     from_port   = 80
#     to_port     = 80
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }