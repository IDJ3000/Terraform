terraform {
  # required_version = ">= 1.3.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.55.0"
    }

  }
}



provider "aws" {
  #region = "us-east-1"
  #profile = "default"
}

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "replace with your bucket name"
    key            = "jjtech/terraform.tfstate"
    region         = "replace with region where bucket is created"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "replace with your dynamoDB table name"
  }
 }




