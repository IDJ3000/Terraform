# resource "aws_vpc" "innovative" {
#   cidr_block           = "10.0.0.0/16"
#   instance_tenancy     = "default"
#   enable_dns_support   = true
#   enable_dns_hostnames = true

#   tags = {
#     Name = "main"
#   }
# }


# resource "aws_subnet" "public_subnet" {
#   cidr_block        = "10.0.1.0/24"
#   vpc_id            = aws_vpc.innovative.id
#   availability_zone = "us-east-1a"

# }


