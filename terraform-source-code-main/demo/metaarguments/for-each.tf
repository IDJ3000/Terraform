
# locals {
#   usernames = {
#     "user1" = "kingsley"
#     "user2" = "abdul"
#     "user3" = "derek"
#     "user4" = "mabel"
#   }

#   ami = var.ami
#   instance_type = ["t2.micro", "t2.nano", "t3.micro", "t4.nano"]

# }

# variable "ami" {
#   type = set(string)
#   default = ["ami1", "ami2", "ami3", "ami4"]
# }

# resource "aws_instance" "name" {
#   count = 4
#   for_each = var.ami
#   ami = each.value
#   instance_type = "t2.micro"
# }

# # resource "aws_iam_user" "users" {
# #   for_each = local.usernames
# #   name = each.value
# #   path = "/system/"

# #   tags = {
# #     tag-key = "tag-value"
# #   }
# # }