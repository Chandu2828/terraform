resource "aws_instance" "terraform_demo" {
    ami = local.ami_id
    instance_type = local.instance_type
    vpc_security_group_ids = [aws_security_group.allow_terraform.id]
    tags = local.ec2_tags
}

resource "aws_security_group" "allow_terraform" {
    name    =   "${local.name}-commmon"
    description = "Allow TLS inbound traffic and all outbound traffic"

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = local.sg_tags
}