# # For a list variable for environment variable:
# ## export TF_VAR_instance_type='["t2.nano", "t3.large", "t4.small"]'

# # For a map variable for environment variable:
# # export TF_VAR_example_map='{"key1"="value1", "key2"="value2", "key3"="value3"}'


# variable "ami" {
#   description = "expecting value for ami # Note ami miust be from us-east-1"
#   type        = string
#   default     = "ami-02396cdd13e9a1257"
#   sensitive   = false
# }

# variable "instance_type" {
#   description = "instance types expected"
#   type        = list(any)
#   default     = ["t2.small", "t2.large", "t3.nano", "t4.large"]
#   sensitive   = false
# }


# variable "associate_public_ip_address" {
#   description = ""
#   type        = bool
#   default     = true
#   sensitive   = false
# }

# variable "tags" {
#   description = ""
#   type        = map(any)
#   default = {
#     Name        = "jjtech-server"
#     Environment = "dev"
#     Project     = "tower-project"
#   }
#   sensitive = false
# }


variable "associate_public_ip_address" {
  description = "whatever"
  type = bool
  default = true
}

variable "number_of_instances" {
  description = "whatever"
  type        = number
  default     = 3
  sensitive   = false
}


variable "tags" {
    description = "whatever"
    type = map(string)
    default = {
      "Name" = "innovative-instance" 
      "env" = "dev"
      "project" = "terraform-project"
    }
  
}


variable "ami-id" {
    description = "ami id for jjtech innovative instance"
    type = string
    sensitive = false
  
}

variable "instance_type" {
    # default = [ "t2.micro", "t2.nano", "t3.large"]
    description = "instance type for jjtech innovative instance"
    type = list(any)
    sensitive = false
  
}


































