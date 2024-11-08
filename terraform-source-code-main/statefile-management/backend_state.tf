
# terraform {
#   backend "s3" {
#     # Replace this with your bucket name!
#     bucket = "bliss-blessed-batch-remote-bucket"
#     key    = "blessed/terraform.tfstate"
#     region = "us-east-1"

#     # Replace this with your DynamoDB table name!
#     dynamodb_table = "bliss-blessed-table"
#   }
# }