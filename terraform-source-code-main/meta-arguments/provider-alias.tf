
# provider "aws" {
#   alias  = "canada"
#   region = "ca-central-1"
# }

# provider "aws" {
#   alias  = "us-east"
#   region = "us-east-1"
# }

# resource "aws_instance" "ca-central" {
#   provider      = aws.canada
#   ami           = "ami-0abc4c35ba4c005ca"
#   instance_type = "t2.small"
#   tags = {
#     "Name" = "jjtech-ca-central"
#   }

# }


# resource "aws_instance" "us-east" {
#   provider      = aws.us-east
#   ami           = "ami-007855ac798b5175e"
#   instance_type = "t2.small"
#   tags = {
#     "Name" = "jjtech-us-east"
#   }

# }

