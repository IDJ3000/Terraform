# resource "aws_iam_user" "User" {
#   name = "user${count.index + 1}"
#   count = var.user
#   path = "/system/"

#   tags = {
#     tag-key = "tag-value"
#   }
# }

# variable "user" {
#     description = "Number of users to create"
#     type = number
#     default = 10
   
  
# }

# resource "aws_iam_user" "example" {
#   count = 4
#   name  = var.user_names[count.index]
# }


# variable "user_names" {
#   description = "IAM usernames"
#   type        = list(string)
#   default     = ["user1", "user2", "user3", "user4"]
# }


# # resource "aws_instance" "name" {
# #   count         = 3
# #   ami           = "your-ami-id"
# #   instance_type = var.instance_type[count.index]
# #   tags = {
# #     "Name" = "test-instance${count.index}"
# #   }
# # }

# # variable "instance_type" {
# #   default = ["t2.nano", "t2.small", "t2.medium"]
# # }

