# # Specify the AWS provider and region
# provider "aws" {
#   region = "us-east-1"
# }

# Create a VPC
resource "aws_vpc" "Terraform_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "Terraform_vpc"
  }
}

# Create three subnets in different availability zones
resource "aws_subnet" "TFsubnet_1" {
  vpc_id                  = aws_vpc.Terraform_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "TFsubnet_1"
  }
}

resource "aws_subnet" "TFsubnet_2" {
  vpc_id                  = aws_vpc.Terraform_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "TFsubnet_2"
  }
}

resource "aws_subnet" "TFsubnet_3" {
  vpc_id                  = aws_vpc.Terraform_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "TFsubnet_3"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "Terraform_igw" {
  vpc_id = aws_vpc.Terraform_vpc.id

  tags = {
    Name = "Terraform_igw"
  }
}

# Create a route table
resource "aws_route_table" "Terraform_RT" {
  vpc_id = aws_vpc.Terraform_vpc.id

  tags = {
    Name = "Terraform_RT"
  }
}

# Create a route to the Internet Gateway in the route table
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.Terraform_RT.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.Terraform_igw.id
}

# Associate the subnets with the route table
resource "aws_route_table_association" "subnet_1_assoc" {
  subnet_id      = aws_subnet.TFsubnet_1.id
  route_table_id = aws_route_table.Terraform_RT.id
}

resource "aws_route_table_association" "subnet_2_assoc" {
  subnet_id      = aws_subnet.TFsubnet_2.id
  route_table_id = aws_route_table.Terraform_RT.id
}

resource "aws_route_table_association" "subnet_3_assoc" {
  subnet_id      = aws_subnet.TFsubnet_3.id
  route_table_id = aws_route_table.Terraform_RT.id
}


# Create a security group that allows SSH (port 22) and HTTP (port 80) access
resource "aws_security_group" "allow_ssh_http" {
  vpc_id = aws_vpc.Terraform_vpc.id

  # Ingress rule to allow SSH access on port 22
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Ingress rule to allow HTTP access on port 80
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rule to allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_http"
  }
}


# # Create a security group that allows SSH access
# resource "aws_security_group" "allow_ssh" {
#   vpc_id = aws_vpc.Terraform_vpc.id

#   ingress {
#     description = "Allow SSH"
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
#     Name = "allow_ssh"
#   }
# }

# # Create a security group that allows HTTP traffic
# resource "aws_security_group" "allow_http" {
#   vpc_id = aws_vpc.Terraform_vpc.id

#   ingress {
#     description = "Allow HTTP"
#     from_port   = 80
#     to_port     = 80
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
#     Name = "allow_http"
#   }
# }

## Create a key pair
# resource "aws_key_pair" "idj-keypair" {
#   key_name   = "idj-keypair"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAWzjyue4+wHqMT6bjtWuDVNiYakWqvQkyCluqCULaismluz74sfYXr7QEXSRx+pLLg3MGNvfQ1en/OeJxZNlDqPNjMDe5jssfqhbTWZXDLRoywr4+5dhZ/Y0NbIP6/9wv2sUQjL6LV2KGlhSicE5oA0GQ9rHhE5ltRNEMfBTaciI2LRGmaZeOtuZIfC0l+oMeUymNYYkEo210aPpN7Mmy5stDI1gkAaW7CaGn26VHa1IPGQLXm4J+rKgUklTfaYspAcKUE5Qg2ZKwi0ZS9PHV5PE2JP+bPCqrDDkki4Kdzuy9H8lkkse/D0GcfMylBm/Zw87N1E4lE+27aylCK2E7 USER@IDJ" # Replace with your actual public key
# }

# Launch an EC2 instance in the first subnet with the key pair
resource "aws_instance" "Terraform_Server" {
  ami                         = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI (HVM), SSD Volume Type - us-east-1
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.TFsubnet_1.id
  vpc_security_group_ids      = [aws_security_group.allow_ssh_http.id]
  key_name                    = "Server-A-keypair"
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
        yum update -y
    yum install httpd -y
    systemctl start httpd
    systemctl enable httpd
    echo "Welcome world of Terraform automation, 
    this is an EC2 instance running Terraform!" > /var/www/html/index.html
    EOF

  tags = {
    Name = "Terraform_Server"
  }
}
