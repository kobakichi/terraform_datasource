# ------------------------------
# root output.tf
# ------------------------------
output "vpc_id" {
  description = "VPC ID"
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "Public Subnet IDs"
  value       = module.network.public_subnet_ids
}

output "ami_id" {
  description = "EC2 instance AMI ID"
  value       = data.aws_ami.amazon_linux2.id
}

output "security_group_id" {
  description = "security group id"
  value       = module.websg.security_group_id
}