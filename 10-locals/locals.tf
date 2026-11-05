locals {
    name            = "${var.project}-${var.environment}"
    instance_type   =   "t2.micro" # It can't be overided in CLI
    ami_id          =   data.aws_ami.joindevops.id
    common_tags = {
        Name        = "${var.project}-${var.environment}"
        Environment =   var.environment
        project     =   var.project
    }
    ec2_tags    = merge(
        local.common_tags,
        {
            Name = "${local.name}-locals-demo" # you can refer local in local but it is not possible in variables
                    # roboshop-dev-locals-demo
        }
    )

    sg_tags = merge(
        local.common_tags,
        {
            Name = "${local.name}-common" # roboshop-dev-common
        }
    )
}


# 1. vars inside variables are not allowed. locals are like variables, it has extra capabilities
# 2. we can use vars inside locals , locals inside locals
# 3. we can assign expressions or functions to locals and reuse them
# 4. we cant override locals
