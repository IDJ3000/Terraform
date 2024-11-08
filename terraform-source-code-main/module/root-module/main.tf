module "vpc" {
  source  = "../child-module/vpc"
  cidr = "10.30.0.0/16"
}

module "ec2" {
  source = "../child-module/ec2"
  instance-type = "t2.nano"
  create_ec2 = false
}

module "security_group" {
  source = "../child-module/security-group"
  sg-name = "jjtech-sg-module"
  http-port = 8080
  vpc_id = module.vpc.vpc_id_sg
  

}
