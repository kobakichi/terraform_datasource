# ------------------------------
# /modules/sg/main.tf
# ------------------------------
resource "aws_security_group" "web" {
  name   = var.name
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "ingress" {
  type              = "ingress"
  from_port         = var.port
  to_port           = var.port
  protocol          = var.protocol
  cidr_blocks       = var.cidr_blocks
  security_group_id = aws_security_group.web.id
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  to_port           = 0
  from_port         = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web.id
}