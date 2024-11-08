
variable "ami" {
  description = "value"
  type        = string
  default     = "ami-022e1a32d3f742bd8"

}

variable "instance_type" {
  description = "value"
  type        = string
  default     = "t2.micro"

}

variable "profile" {
  type = string
  description = "provide profile name to env"
  
}

