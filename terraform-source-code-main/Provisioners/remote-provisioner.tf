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

#   provisioner "file" {
#     source      = "./nginx.sh"
#     destination = "/home/ec2-user/nginx.sh"
#     connection {
#       host        = self.public_ip
#       type        = "ssh"
#       user        = "ec2-user"
#       private_key = file("~/Downloads/terraformkp.pem")

#     }
#   }

#   provisioner "remote-exec" {
#     #script = "./nginx.sh"
#     inline = [
#       "chmod 777 ./nginx.sh",
#       "sh nginx.sh"
#     ]

#     connection {
#       host        = self.public_ip
#       type        = "ssh"
#       user        = "ec2-user"
#       private_key = file("~/Downloads/terraformkp.pem")

#     }

#   }
# }


# resource "null_resource" "name" {
#   provisioner "remote-exec" {
#     when = create 
#     inline = [
#       "sudo yum update",
#       "sudo yum install -y nginx",
#       "sudo systemctl start nginx",
#       "sudo systemctl enable nginx"
#     ]
    
#     connection {
#       host        = aws_instance.web.public_ip
#       type        = "ssh"
#       user        = "ec2-user"
#       private_key = file("~/Downloads/terraformkp.pem")

#     }
#   }

# }
