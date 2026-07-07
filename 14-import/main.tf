# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_instance" "vpn" {
  ami                                  = "ami-0220d79f3f480ecf5"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1a"
  instance_type                        = "t3.micro"
  monitoring                           = false
  region                               = "us-east-1"
  tags = {
    Name = "import"
  }
}

  