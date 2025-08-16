module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
  prefix = var.prefix
}

module "ec2" {
  source            = "./modules/ec2"
  ami_id            = var.ami_id
  public_subnet_ids = module.vpc.public_subnet_ids
  security_group_id = module.security_group.security_group_id
  instance_type     = var.instance_type
  key_name          = var.key_name
}
