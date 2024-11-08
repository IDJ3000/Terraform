
terraform {
  required_version = ">= 1.6.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.55.0"
    }

  }
}


provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

provider "aws" {
    alias = "us-east2"
    region = "us-east-2"
    profile = "default"
  
}

provider "aws" {
    alias = "ca-central"
    region = "ca-central-1"
    profile = "default"
  
}


variable "region" {
    type = list(string)
    default = [ "us-east1", "us-east2", "us-east-3" ]
  
}