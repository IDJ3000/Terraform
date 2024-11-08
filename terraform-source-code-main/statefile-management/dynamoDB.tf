# To use DynamoDB for locking with Terraform, 
# you must create a DynamoDB table that has a primary key called "LockID"
# (with this exact spelling and capitalization). 
# You can create such a table using the aws_dynamodb_table resource

# resource "aws_dynamodb_table" "terraform_locks" {
#   name         = "terraform-backend-locks"
#   hash_key     = "LockID"
#   read_capacity = 3
#   write_capacity = 3

#   attribute {
#     name = "LockID"
#     type = "S"
#   }

# lifecycle {
#   prevent_destroy = true
# }
# }