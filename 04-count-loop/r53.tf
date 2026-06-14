resource "aws_route53_record" "roboshop" {
    count = 2
    zone_id = var.
    name = "${var.instances[count,index]}-${var.environment}.${var.domain_name}" # smongodb-dev.vnmurthy.online
    type = "A"
    ttl = 1
    records = [aws_instance.roboshop[count.index].private_ip]
}

resource "aws_route53_record" "frontend"{
    count = contains(var.instances, "frontend") ? 1 : 0 # If frontend is not found it doesn't create anything
    zone_id = var.zone_id
    name = "${var.project}-${var.environment}.${var.domain_name}" # roboshop-dev.vnmurthy.online
    type = "A"
    ttl = 1
    records = [aws_instance.roboshop[index(var.instances, "frontend")].public_ip]
}


