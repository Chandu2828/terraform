variable ingress_rules {
    default = {
        ssh = { # key = ssh and port, cidr_blocks are values 
            port        = 22
            cidr_blocks = ["0.0.0.0/0"]
        }
        http = {
            port        = 80
            cidr_blocks = ["0.0.0.0/0"]
        }
        mysql = {
            port        = 3306
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}
