# resource "aws_instance" "vpn" {
#     ami                     = "ami-0220d79f3f480ecf5"
#     instance_type           = "t3.micro"
#     vpc_security_group_ids  = [
#               "sg-0452077c999c9cf99"
#             ]
#     tags= {
#               "Name": "import"
#             }
# }