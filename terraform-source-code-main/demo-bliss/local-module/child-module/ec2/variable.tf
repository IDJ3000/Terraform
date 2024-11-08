variable "ami_bliss_id" {
  type = string
  description = "provide ami_id for webserver"
}

variable "instance_type" {
  type = string
  description = "provide instance type for webserver"
  default = "t2.medium"
}

variable "key_name" {
  type = string
  description = "provide key name for webserver"
  default = "testkp"
  
}

variable "tags" {
  type = map
  description = "provide tags for webserver"
  default = {
    Name = "webserver"
    Project = "webserver"
    Created-by = "terraform"
  }
 
}

variable "subnet_id" {
  type = string
  description = "provide subnet id for webserver"  
  
}

variable "sg_ids" {
  type = set(string)
  description = "provide security group ids for webserver"
  
}

variable "Do-you-want-to-create-ec2-instance" {
  type = bool
  description = "create an ec2-instance"
}