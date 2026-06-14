resource "aws_instance" "roboshop"{
    for_each = var.instances
    ami = var.instances
    instance_type = each.value.instance_type
    vpc_security_group_ids = [
        aws_security_group.roboshop[each.key].id,
        aws_security_group.common.id
    ]
    tags = {
        Name = "${var.project}-${var.environment}-${each.key}"
    }
}

resource "aws_security_group" "roboshop" {
    for_each = var.instances
    name = "${var.project}-${var.environment}-${each.key}"
    description = "Allow TLS inbound traffic and all outbound traffic"

    egress {
        from_port = var.port
        to_port = var.port
        protocol = "-1"
        cidr_blocks = var.cidr
    }
    tags = {
        Name = "${var.project}-${var.environment}-${each.key}"
    }

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_security_group" "common" {
    name = "${var.project}-${var.environment}-common"
    description = "Allow TLS inbound traffic and all outbound traffic"

    egress {
        from_port = var.port
        to_port = var.port
        protocol = "-1"
        cidr_blocks = var.cidr
    }

    tags = {
        Name = "${var.project}-${var.environment}-common"
    }

    lifecycle {
        create_before_destroy = true
    }
}