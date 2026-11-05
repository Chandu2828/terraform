data "aws_ami" "joindevops" {
  most_recent      = true # most recent one will be packed from the given account
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

output  "ami_id" {
  value       = data.aws_ami.joindevops.id
}

# resource blocks are used to create services/resources inside the provider platform. 
# We can use data sources to query the existing information in provider
