# ------------------------------
# /modules/ec2/main.tf ec2module
# ------------------------------
resource "aws_instance" "ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.vpc_security_group_ids]
  subnet_id = var.subnet_id
}