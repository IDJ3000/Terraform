# ## create an S3 bucket by using the aws_s3_bucket resource 

# resource "aws_s3_bucket" "terraform_state" {
#   bucket = "jjtech-statefile-20233"
#   force_destroy = true

#   lifecycle {
#     prevent_destroy = true
#   }

# }


#  ## use the aws_s3_bucket_versioning resource to enable versioning on the S3 
#   ## bucket so that every update to a file in the bucket actually 
#   ## creates a new version of that file
# resource "aws_s3_bucket_versioning" "enabled" {
#   bucket = aws_s3_bucket.terraform_state.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# ## use the aws_s3_bucket_server_side_encryption_configuration resource 
#   ## to turn server-side encryption on by default for all data written to this S3 bucket. 
#   ## This ensures that your state files, and any secrets they might contain, 
#   ## are always encrypted on disk when stored in S3
# resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
#   bucket = aws_s3_bucket.terraform_state.id

#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "AES256"
#     }
#   }
# }

# # use the aws_s3_bucket_public_access_block resource to block all 
# # public access to the S3 bucket.
# resource "aws_s3_bucket_public_access_block" "public_access" {
#   bucket                  = aws_s3_bucket.terraform_state.id
#   block_public_acls       = false
#   block_public_policy     = true
#   ignore_public_acls      = false
#   restrict_public_buckets = true
# }