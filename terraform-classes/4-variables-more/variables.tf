# Below is the variables blocks
variable "ec2_name_tag" {
  default = ["Appserver", "DataServer", "ProdServer"]
}

variable "instance_type" {
  default = ["t2.micro", "t2.medium","t2.nano"]
  type    = list(string)
}
variable "ami_ids" {
  default = {
    linux  = "ami-0182f373e66f89c85",
    ubuntu = "ami-0e86e20dae9224db8",
    redhat = "ami-0583d8c7a9c35822c"
  }
}


