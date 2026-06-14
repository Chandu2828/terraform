variable "environment" {
  default = "prod"
  type = string
}

variable "project"{
  default = "roboshop"
  type = string
}

variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
  description = "RHEL9 joindevops image"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"

  validation {
    condition     = contains(["t2.micro", "t2.small", "t2.medium", "t2.large"], var.instance_type)
    error_message = "Instance type should be either t2.micro or t2.small"
  }
}

variable "sg_name" {
  type    = string
  default = "allow_terraform_vars"
}

variable "port" {
  default = 0
  type    = number
}

variable "cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "instances" {
  default = ["mongodb", "redis", "mysql", "rabbitmq"]
  type = list
}