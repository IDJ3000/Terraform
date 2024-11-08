variable "sg-name" {
  description = "sg for my webserver"
  type = string
}


variable "http-port" {
  description = "allow http port"
  type = string
  
}

variable "ssh-port" {
  description = "allow http port"
  type = string
  default = 22
}

variable "vpc_id" {
  
}

