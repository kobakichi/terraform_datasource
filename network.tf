# ------------------------------
# VPC
# ------------------------------
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "kz-vpc"
  }
}

# ------------------------------
# Public subnet
# ------------------------------
resource "aws_subnet" "public" {
  for_each = var.subnet_cidrs

  availability_zone = each.key
  cidr_block        = each.value.public_cidr_blocks
  vpc_id            = aws_vpc.main.id

  tags = {
    Name = "${each.key}-public"
  }
}

# ------------------------------
# Private subnet
# ------------------------------
resource "aws_subnet" "private" {
  for_each = var.subnet_cidrs

  availability_zone = each.key
  cidr_block        = each.value.private_cidr_blocks
  vpc_id            = aws_vpc.main.id

  tags = {
    Name = "${each.key}-private"
  }
}