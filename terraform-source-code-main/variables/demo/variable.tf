# For a list variable for environment variable:
## export TF_VAR_instance_type='["env-t2.nano", "env-t3.large", "env-t4.small"]'

# For a map variable for environment variable:
# export TF_VAR_tags='{"Name"="env-jjtech-server1", "Env"="env-dev1", "project"="env-tower-project1"}'

# For a string variable for environment variable
## export TF_VAR_ami="env-ami"

#  For passing variable at runtime on cli
## terraform plan -var="instance_type=[\"t2.micro\", \"t3.micro\", \"t3.micro\"]"
## terraform plan -var="ami=cli-ami"


variable "ami" {
  description = "expecting value for ami # Note ami miust be from us-east-1"
  type        = string
  default     = "ami-02396cdd13e9a1257"
  sensitive = false
}

variable "instance_type" {
  description = "instance types expected"
  type        = list(any)
  default     = ["t2.small", "t2.large", "t3.nano", "t4.large"]
  sensitive = false
}

variable "tags" {
  description = ""
  type        = map(any)
  default = {
    Name        = "jjtech-server"
    Environment = "dev"
    Project     = "tower-project"
  }
  sensitive = false
}


# variable "number_of_instance" {
#   description = ""
#   type        = number
#   default     = 3
#   sensitive = false
# }






































