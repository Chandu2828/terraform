resource "aws_instance" "roboshop" {
  count   = 2 # It will create the instances but with the same name for all the instances
  count                  = length(var.instances) # loops until it read the last element in the list
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [
    aws_security_group.roboshop[count.index].id,
    aws_security_group.common.id
  ]
  tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}" # interpolation
  }
}
# count.index is reserved variable such as item in ansible
# count is used for list variables  

# It creates in default VPC
resource "aws_security_group" "roboshop" {
  count       = length(var.instances)
  name        = "${var.project}-${var.environment}-${var.instances[count.index]}"
  description = "Allow TLS inbound traffic and all outbound traffic"

  # outbound traffic
  egress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "-1" # all traffic
    cidr_blocks = var.cidr
  }

  tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
  }

# first it creates SG and then modify instance SG
  lifecycle {
    create_before_destroy = true 
}
}

resource "aws_security_group" "common" {
    name        = "${var.project}-${var.environment}-common"
    description = "Allow TLS inbound traffic and all outbound traffic"

    #outbound traffic 
    egress {
        from_port   = var.port
        to_port     = var.port
        protocol    = "-1" # all traffic
        cidr_blocks = var.cidr
    }

    tags = {
        Name = "${var.project}-${var.environment}-common"
    }

      lifecycle {
    create_before_destroy = true 
    }
}


