variable "environment" {
    default = "dev"
    type = string
}

variable "project" {
    type = string 
    default = "roboshop"
}

variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "RHEL joindevops image"
}

variable "instance_type" {
    type = string 
    default = "t2.micro"

    validation {
        condition = contains(["t2.micro", "t2.small", "t2.meduim", "t2.large"], var.instance_type)
        error_message = "Instance type should be either t2.micro or t2.small"
    }
}

variable "sg_name" {
    type = string
    default = "allow_terraform_vars"
}

variable "port" {
    default = 0
    type = number
}

variable "cidr"{
    type = list 
    default = ["0.0.0.0/0"]
}

variable "zone_id"{
    default = "Z100713130SN6SD90QW7V"
}

variable "domain_name"{
    default = "vnmurthy.online"
}

variable "instances" {
    type = map 
    default = {
        momgodb = {
            "instance_type" = "t2.micro"
        },
        redis = {
            "instance_type" = "t2.micro"
        },
        mysql = {
            "instance_type" = "t2.micro"
        },
        rabbitmq = {
            "instance_type" = "t2.micro"
        },
        catalogue = {
            "instance_type" = "t2.micro"
        },
        user = {
            "instance_type" = "t2.micro"
        },
        cart = {
            "instance_type" = "t2.micro"
        },
        shipping = {
            "instance_type" = "t2.micro"
        },
        payment = {
            "instance_type" = "t2.micro"
        },
        frontend = {
            "instance_type" = "t2.micro"
        }
    }
}