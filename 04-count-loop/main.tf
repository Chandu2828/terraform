resource "aws_instance" "terraform_demo" {
  count   = 10
  ami                    = var.ami_id
  instance_type          = var.environment == "dev" ? "t3.micro" : "t3.small" # env = true then t3.micro, if env = false then t3.small
  vpc_security_group_ids = [aws_security_group.allow_terraform.id] # list
  # labels, metadata, info, etc
  tags = var.ec2_tags
}

# It creates in default VPC
resource "aws_security_group" "allow_terraform" {
  name        = var.sg_name
  description = "Allow TLS inbound traffic and all outbound traffic"

  # outbound traffic
  egress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "-1" # all traffic
    cidr_blocks = var.cidr
  }

  tags = var.sg_tags
}