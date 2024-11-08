variable "ami" {
    type = string
    description = "value for ami"
    default = "ami-022e1a32d3f742bd8"
}

variable "instance-type" {
  type = string
  description = "value for instance type"
}

variable "create_ec2" {
  type = bool
}