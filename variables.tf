# ------------------------------
# root module variables.tf
# ------------------------------
variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  type = map(object({
    public_cidr_blocks  = string
    private_cidr_blocks = string
  }))
}

# variable "instance_type" {
#   type        = string
#   description = "EC2 instance type"
# }