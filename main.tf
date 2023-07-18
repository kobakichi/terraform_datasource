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

  ami_id = data.aws_ami.amazon_linux2.id
  instance_type = var.instance_type
}