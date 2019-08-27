
module "my_vpc"{
  source = "/Users/renusaharan/learn/tf/modules/vpc"
  vpc_cidr = "default"
  tenancy  = "default"
  vpc_id   = "${module.my_vpc.vpc_id}"
  subnet_cidr = "default"
}

module "ec2" {
  source = "/Users/renusaharan/learn/tf/modules/ec2"
  ec2_count     = "1"
  ami_id        = "ami-5a8da735"
  instance_type = "t2.micro"
  subnet_id     = "${module.my_vpc.subnet_id}"
}
