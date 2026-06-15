resource "aws_instance" "terraform_demo" {
    ami = data.aws_ami.joindevops.id
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_terraform.id]
    tags = {
        Name    =   "terraform-demo-1"
        Project =   "roboshop"
        Environment =   "dev"
    }
}

resource "aws_security_group" "allow_terraform" {
    name    =   "allow_terraform_data_source"
    description =   "Allow TLS inbound traffic and outbound traffic"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name    =   "allow_terraform"
        Project =   "roboshop"
        Environment =   "dev"
    }
}