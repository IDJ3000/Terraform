# Below is the variables blocks
variable "ec2_name_tag" {
  default = ["linux-server", "ubuntu-server","rhel9-server"]
}

variable "instance_type" {
  default = ["t2.nano", "t2.medium","t2.micro"]
}

variable "ami_ids" {
  default = {
    0 = "ami-0182f373e66f89c85",
    1 = "ami-0e86e20dae9224db8",
    2 = "ami-0583d8c7a9c35822c"
  }
}