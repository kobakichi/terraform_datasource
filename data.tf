# data "aws_ami" "amazon_linux2" {
#   most_recent = true
#   owners      = ["amazon"]

#   filter {
#     name   = "architecture"
#     values = ["x86_64"]
#   }

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   filter {
#     name   = "block-device-mapping.volume-type"
#     values = ["gp2"]
#   }
# }