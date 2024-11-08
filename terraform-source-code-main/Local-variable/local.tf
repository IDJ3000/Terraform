locals {
  ami           = "ami-local"
  instance_type = ["t2.micro", "t3.micro", "t4.micro"]
  tag_local = {
    Name    = "jjtech"
    ENv     = "dev1"
    project = "Tower-terraform"
  }
}