# Below is the resource block which creates EC2 Instance
resource "aws_instance" "Appserver" {
  ami           = var.ami_ids["linux"]
  instance_type = var.instance_type[0]
  tags = {
    Name = var.ec2_name_tag[0]
  }
}
resource "aws_instance" "DataServer" {
  ami           = var.ami_ids["ubuntu"]
  instance_type = var.instance_type[0]
  tags = {
    Name = var.ec2_name_tag[1]
  }
}

resource "aws_instance" "ProdServer" {
  ami           = var.ami_ids["ubuntu"]
  instance_type = var.instance_type[0]
  tags = {
    Name = var.ec2_name_tag[2]
  }
}
