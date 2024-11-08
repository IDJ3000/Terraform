variable "sg_name" {
    type = string
    description = "value for security group name"
    default = "sg-webserver"
  
}


# variable "ssh_port" {
#     type = number
#     description = "value for security group ssh port"
#     default = 22
  
# }

variable "vpc_id" {
    type = string
    description = "value for sg vpc id"
  
}