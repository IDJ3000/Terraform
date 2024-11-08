terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.1.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.21.1"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = local.profile
  default_tags {
    tags = {
      Name = "workspace-project"
      env  = "${terraform.workspace}"
    }
  }
}



# dev:
# - Region = us-east-1
# prod 
# - Region = us-east-2
# stage
# - Region = us-west-1