
# data "aws_ami" "example" {
#   most_recent = true
#   owners      = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["al2023-ami-2023.3.20240219.0-kernel-6.1-x86_64"]
#   }

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }



# resource "aws_security_group" "http_access" {
#   name        = "http_access"
#   description = "Allow HTTP inbound traffic"

#   ingress {
#     description = "HTTP Access"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "SSH Access"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "http_access"
#   }
# }


# resource "aws_instance" "web" {
#   ami                    = data.aws_ami.example.id
#   instance_type          = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.http_access.id]
#   key_name               = "terraformkp"

# provisioner "local-exec" {
#   when = create
#   command = "echo 'This is my local exec demo '>> private_ip.txt && mkdir Test && mv private_ip.txt Test"
# }
#   provisioner "local-exec" {
#     when    = destroy
#     command = "rm -rf Test && echo 'Destruction successful'>> destruction.txt"
#   }

# }

# resource "null_resource" "name" {
#   provisioner "local-exec" {
#     when    = create
#     command = "echo 'This is my local exec demo '>> private_ip.txt && mkdir Test && mv private_ip.txt Test"
#   }

#   provisioner "local-exec" {
#     when    = destroy
#     command = "rm -rf Test && echo 'Destruction successful'>> destruction.txt"
#   }
# }
