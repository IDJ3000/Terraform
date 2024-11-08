
#### Dynamic blocks for security groups
variable "sg_ports" {
  type        = list(any)
  description = "List of ingress ports to open"
  default     = ["443", "80", "9000", "9300", "8300", "3306", "25"]

}
  
# resource "aws_security_group" "name" {
#   name = "jjtech-demo"
#   dynamic "ingress" {
#     for_each = var.sg_ports
#     content {
#       cidr_blocks = ["0.0.0.0/0"]
#       description = "Allow traffic fro ssh, https etc..."
#       from_port   = ingress.value
#       to_port     = ingress.value
#       protocol    = "tcp"

#     }

#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_security_group" "dynamic_sg" {
#   name = "dynamic_sg"

#   dynamic "ingress" {
#     for_each = var.sg_ports
#     iterator = ports
#     content {
#       from_port   = ports.value
#       to_port     = ports.value
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# # # ##########################################################################

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

}
locals {
  inbound_rules = [
    { 
      port = 53, 
      protocol = "-1", 
      cidr_block = "10.0.1.0/24" 
      },    # DNS
    { 
      port = 88, 
      protocol = "-1", 
      cidr_block = "10.0.2.0/24"
       },    # Kerberos
    { 
      port = 123, 
      protocol = "udp", 
      cidr_block = "10.0.3.0/24" 
      },  # Time Sync (NTP)
    { 
      port = 135, 
      protocol = "tcp", 
      cidr_block = "10.0.4.0/24" 
      },  # RPC Endpoint Mapper
    { 
      port = 389, 
      protocol = "-1", 
      cidr_block = "10.0.5.0/24" 
      },   # LDAP
    { 
      port = 445, 
      protocol = "tcp", 
      cidr_block = "10.0.6.0/24" 
      },  # SMB
    { port = 464, protocol = "-1", cidr_block = "10.0.7.0/24" },   # Kerberos (password)
    { port = 636, protocol = "tcp", cidr_block = "10.0.8.0/24" },  # LDAP SSL
    { port = 3268, protocol = "tcp", cidr_block = "10.0.9.0/24" }, # LDAP Global Catalog
    { port = 3269, protocol = "tcp", cidr_block = "10.0.10.0/24" }  # LDAP Global Catalog SSL
  ]
}

# Security Groups
resource "aws_security_group" "sg-ad" {
  vpc_id      = aws_vpc.vpc.id
  name        = "active_directory"
  description = "Security Group for AD Domain Controllers"

  dynamic "ingress" {
    for_each = local.inbound_rules
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = [ingress.value.cidr_block]
    }
  }

  tags = {
    Name        = "sg-webserver",
    Environment = "dev"
  }
}


# resource "aws_security_group" "jenkins" {
#   name        = "jenkins-sg"
#   description = "Allow HTTP to jenkins server"
#   vpc_id      = data.aws_vpc.default.id

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
#     from_port   = 8080
#     to_port     = 8080
#   }
#   ingress {
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "http ingress"
#     protocol    = "tcp"
#     from_port   = 22
#     to_port     = 22
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   lifecycle {
#     prevent_destroy = true
#   }
# }