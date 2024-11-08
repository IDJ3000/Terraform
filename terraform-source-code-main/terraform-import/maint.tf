resource "aws_instance" "import" {
  instance_type = "t2.nano"
  ami = "ami-0889a44b331db0194"
}