resource "aws_instance" "terraform_demo" {
    ami =   "ami-0220d79f3f480ecf5"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_terraform.id]
    tags = {
        Name =  "terraform-demo-1"
        Project = "roboshop"
        Environment = "dev"
    }
}

# It creates in default vpc
resource "aws_security_group" "allow_terraform" {
    name    =   "allow_terraform_dynamic"
    description = "Allow TLS inbound traffic and all outbound traffic"

    # outbound traffic
    # egress {
    #     from_port   =   0
    #     to_port     =   0
    #     protocol    =   "-1"
    #     cidr_blocks =   ["0.0.0.0/0"]
    # }

    # ingress {
    #     from_port   =   22
    #     to_port     =   22
    #     protocol    =   "tcp"
    #     cidr_blocks =   ["0.0.0.0/0"]
    # }

    # ingress {
    #     from_port   =   80
    #     to_port     =   80
    #     protocol    =   "tcp"
    #     cidr_blocks =   ["0.0.0.0/0"]
    # }

    # ingress {
    #     from_port   =   3306
    #     to_port     =   3306
    #     protocol    =   "tcp"
    #     cidr_blocks = ["0.0.0.0/0"]
    # }

    # ingress block
    # this give us special variable ingress
    dynamic "ingress" {
        for_each    =   var.ingress_rules
        content { # this is goimg to be repeated so this data must be in contains
            from_port   =   ingress.value.port
            to_port     =   ingress.value.port
            protocol    =   "tcp"
            cidr_blocks =   ingress.value.cidr_blocks
        }
    }

    tags = {
        Name   =    "allow_terraform"
        Project =   "roboshop"
        Environmemt =   "dev"
    }
}