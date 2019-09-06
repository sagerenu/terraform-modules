
provider "aws" {

  region = "us-east-1"
  access_key = "${var.my-access-key}"
  secret_key = "${var.my-secret-key}"

}
module "my_vpc"{
  source = "../modules/vpc"
  vpc_id   = "${module.my_vpc.vpc_id}"
}
module "key_pair" {
  source = "../modules/key_pair"
}

module "ec2" {
  source = "../modules/ec2"
  ec2_count     = "1"
  key_name      = "${module.key_pair.key_name}"
  ami_id        = "ami-5a8da735"
  instance_type = "t2.micro"
  subnet_id     = "${module.my_vpc.subnet_id}"
}
