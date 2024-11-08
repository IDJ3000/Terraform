# variable "user_name" {
#   type = list
#   default = [ "user1", "user2", "user3", "user4" ]
# }

# resource "aws_iam_user" "user1" {
#   count = 4
#   name = var.user_name[count.index]


#   tags = {
#     tag-key = "usertags${count.index}"
#   }
# }




# # locals {
# #   instance_type = ["t2.micro", "t2.nano", "t3.micro", "t4.nano"]
# #   ami = ["ami1", "ami2", "ami3", "ami4"]
# # }

# # resource "aws_instance" "name" {
# #     count = 4
# #     ami = ami1
# #     instance_type = local.instance_type[count.index]

# #     tags = {
# #       Name = "instance${count.index}"
# #     }
  
# # }