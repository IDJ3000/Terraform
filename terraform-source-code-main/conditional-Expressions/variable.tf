
variable "create-ec2" {
  type    = bool
  default = true
}


variable "Environment" {
  type    = list(any)
  default = ["prod", "dev"]

}