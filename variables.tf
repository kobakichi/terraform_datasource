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

variable "ami_id" {
  type        = string
  description = "AMI ID"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "name" {
  type        = string
  description = "security group name"
}

variable "vpc_id" {
  type        = string
  description = "vpc id"
}

variable "port" {
  type        = number
  description = "security group port"
}

variable "cidr_blocks" {
  description = "security group cidr blocks"
}

variable "protocol" {
  type        = string
  description = "security group protocol"
}