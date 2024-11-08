variable "cidr" {
  type = string
  description = "provide cidr block for vpc"
  default = "10.0.0.0/16"
}


variable "vpc_tags" {
  type = map(string)
  description = "provide tags for vpc"
  default = {
    Name = "my-vpc"
  }
  
}


variable "subnet_cidr" {
  type = string
  description = "provide cidr block for subnet"
  default = "10.0.0.0/24"
}