resource "aws_instance" "terraform_demo" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_terraform.id]
    tags = {
        Name    =   "terraform-demo-1"
        Project =   "roboshop"
        Environment =   "dev"
    }

    provisioner "local-exec" {
        command = "echo ${self.private_ip} > inventory.ini"
    }

    provisioner "local-exec" {
        command = "echo instance created"
    }

    provisioner "local-exec" {
        when = destroy
        command = "echo instance is going to be destroyed"
    }

    provisioner "local-exec" {
        when = destroy
        command =   "echo > inventory.ini"
    }

    connection {
        type = "ssh"
        user = "ec2-user"
        password = "DevOps321"
        host =  self.public_ip
    }

    provisioner "remote-exec" {
        inline = [
            "sudo dnf install nginx -y",
        ]
    }
}

resource "aws_security_group" "allow_terraform" {
    name    =   "allow_terraform_provisioners"
    description = "Allow TLS inbound traffic and all outbound traffic"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_terraform"
        Project = "roboshop"
        Environment = "dev"
    }
}