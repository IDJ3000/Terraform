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
  region = "us-east-1"
  profile= var.profile
  default_tags {
    tags = {
      Name = "immersion"
      env  = "dev"
    }
  }
}
