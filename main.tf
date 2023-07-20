provider "aws" {
  region = "us-west-2"  # Replace with your desired AWS region
}

module "vpc" {
  source = "./modules/vpc"
}

module "subnets" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
}

module "ec2_instance" {
  source = "./modules/ec2"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.subnets.private_subnet_ids
}
