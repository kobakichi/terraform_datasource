# ------------------------------
# root-main.tf
# ------------------------------

# VPC,Route table,IGW
module "network" {
  source = "./modules/vpc"

  vpc_cidr     = var.vpc_cidr
  subnet_cidrs = var.subnet_cidrs
}

# EC2instance
module "ec2" {
  source = "./modules/ec2"

  ami_id                 = data.aws_ami.amazon_linux2.id
  instance_type          = var.instance_type
  vpc_security_group_ids = module.websg.security_group_id
  subnet_id = module.network.public_subnet_ids[0]
}

# security group
module "websg" {
  source = "./modules/sg"

  vpc_id   = module.network.vpc_id
  name     = var.name
  port     = var.port
  protocol = var.protocol

  cidr_blocks = var.cidr_blocks
}