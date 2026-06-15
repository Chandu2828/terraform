data "ami_id" "joindevops" {
    most_recent =   true
    owners      =   ["973714476881"]

    filter {
        name    =   "name"
        values   =   ["RedHat-9-DevOps-Practice"]
    }

    filter {
        name    =   "root-device-type"
        values  =   ["ebs"]
    }

    filter {
        name    =   "virtualization-type"
        values  =   ["hvm"]
    }

    filter {
        name    =   "architecture"
        values  =   ["x86_64"]
    }
}

output "ami_id" {
    value   =   data.ami_id.joindevops.id
}