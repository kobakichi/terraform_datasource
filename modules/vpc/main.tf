# ------------------------------
# VPC module
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

  availability_zone       = each.key
  cidr_block              = each.value.public_cidr_blocks
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true

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

# ------------------------------
# IGW
# ------------------------------
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "kz_igw"
  }
}

# ------------------------------
# Route table
# ------------------------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

resource "aws_route_table_association" "public_route" {
  for_each       = aws_subnet.public
  route_table_id = aws_route_table.public.id
  subnet_id      = each.value.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table_association" "private_route" {
  for_each       = aws_subnet.private
  route_table_id = aws_route_table.private.id
  subnet_id      = each.value.id
}