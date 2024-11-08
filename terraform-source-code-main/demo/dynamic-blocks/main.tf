resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

}

locals {
  inbound_rules = [
    { port = 53, protocol = "-1", cidr_block = "10.0.1.0/24", description= "DNS" },    # DNS
    { port = 88, protocol = "-1", cidr_block = "10.0.2.0/24" },    # Kerberos
    { port = 123, protocol = "udp", cidr_block = "10.0.3.0/24" },  # Time Sync (NTP)
    { port = 135, protocol = "tcp", cidr_block = "10.0.4.0/24" },  # RPC Endpoint Mapper
    { port = 389, protocol = "-1", cidr_block = "10.0.5.0/24" },   # LDAP
    { port = 445, protocol = "tcp", cidr_block = "10.0.6.0/24" },  # SMB
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