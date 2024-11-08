variable "cidr_block" {
  type    = string
  default = "10.20.0.0/16"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "region" {
  type = string
}