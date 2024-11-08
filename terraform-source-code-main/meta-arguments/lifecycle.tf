resource "aws_instance" "web" {
  ami           = "ami-0abc4c35ba4c005ca"  #ami-0d04e6652cb408e57"
  instance_type = "t2.micro"
  tags = {
    "Name" = "jjtech-demo2"
  }
# lifecycle {
#   prevent_destroy = true
# }


 }


