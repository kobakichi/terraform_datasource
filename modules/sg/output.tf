# ------------------------------
# /modules/sg/output.tf
# ------------------------------
output "security_group_id" {
  value = aws_security_group.web.id
}