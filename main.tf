# ------------------------------
# root-main.tf
# ------------------------------
module "network" {
  source = "./modules/vpc"

  vpc_cidr     = var.vpc_cidr
  subnet_cidrs = var.subnet_cidrs
}