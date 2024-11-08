

resource "aws_instance" "us-east1" {
  ami = "ami-0440d3b780d96b29d"
  instance_type = "t3.micro"

}


resource "aws_instance" "us-east2" {
  ami = "ami-0440d3b780d96b29d"
  instance_type = "t3.micro"
  
}

resource "aws_instance" "us-east3" {
  ami = "ami-0440d3b780d96b29d"
  instance_type = "t3.micro"
  
}



