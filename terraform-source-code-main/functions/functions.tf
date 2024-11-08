
# locals {
#   timestamp = formatdate("EEEE, DD MMMM YYYY hh:mm ZZZ", timestamp())
# }

# output "timestamp" {
#   value = local.timestamp
# }

# ###############################################
# ##Lookup function
# locals {
#   region       = "ca-central-1"
#   instance_type = ["t2.micro", "t2.nano", "t3.small"]
#   ami = {
#     us-east-1  = "us-east-ami"
#     us-west-2  = "us-west-ami"
#     ca-central = "ca-central-ami"
#   }
#   tags = {
#     Name    = "Test-server"
#     project = "jjtech-demo"
#   }
# }


# resource "aws_instance" "lookup" {
#   count = 3
#   ami                         = lookup(local.ami, "ca-central", "ami-new-lookup")
#   instance_type               = local.instance_type[count.index]
#   tags                        = local.tags

# }


# ######################################################

# # file function and Zipmap
# locals {
#   region       = "ca-central"
#   instance_type = "t2.micro"
#   key    = ["Name", "Env", "Proj"]
#   values = ["Tower-vm", "Dev", "Tower-po"]

#   ami = {
#     us-east-1  = "ami-0dfcb1ef8550277af"
#   }
#   tags = {
#     Name    = "Test-server"
#     project = "jjtech-demo"
#   }
# }

# resource "aws_instance" "lookup" {
#   ami                         = local.ami["us-east-1"]
#   instance_type               = local.instance_type
#   user_data = file("./nginx.sh")
#   tags                        =  zipmap(local.key, local.values)    #local.tags

# }


# #######################################################
# # Element function
# # element retrieves a single element from a list.
# locals {
#   region        = "ca-central"
#   instance_type = "t2.micro"
#   ami = "ami-0dfcb1ef8550277af"
#   tags = ["first-tag", "Second-tag"]
# }


# resource "aws_instance" "element" {

#   ami           = local.ami
#   instance_type = local.instance_type
#   tags          = {
#     Name = element(local.tags, 1)
# }
# }



# #########################################################
# ### Length function
# Returns the length of a string, list, or map.

# locals {
#   region       = "ca-central"
#   instance_type = ["t2.micro", "t2.nano", "t3.small"]
#   ami = ["ca-central-ami", "us-east-ami", "us-west-ami"]

#   tags = {
#     Name    = "Test-server"
#     project = "jjtech-demo"
#   }
# }


# resource "aws_instance" "lookup" {
#   count =  length(local.instance_type)
#   ami                         = element(local.ami, count.index)
#   instance_type               = element(local.instance_type, count.index)
#   tags                        = local.tags

# }

# variable "username" {
#   type    = list(any)
#   default = ["moni", "julie", "luma"]
# }

# resource "aws_iam_user" "example" {
#   count = length(var.username)
#   name  = element(var.username, count.index)
# }


variable "private_subnet" {
  type    = list(any)
  default = ["privatesn1", "privatesn2"]
}

variable "public_subnet" {
  type    = list(any)
  default = ["publicsn1", "publicsn2"]
}

resource "aws_iam_role" "example" {
  assume_role_policy = file("./iam-policy.json")
}

resource "aws_eks_cluster" "example" {
  name     = "example"
  role_arn = aws_iam_role.example.arn

  vpc_config {
    subnet_ids = concat(var.private_subnet, var.public_subnet)
  }
}
