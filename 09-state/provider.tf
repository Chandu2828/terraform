terraform {
    required_providers {
        aws ={
            source = "hashicorp/aws"
            version = "6.48.0"
        }
    }

backend "s3" {
    bucket  =   "remote-state-practice-90s"
    key     =   "remote-state-demo.tfstate"
    region  =   "us-east-1"
    encrypt =   true
    use_lockfile    =   true # Enables native S3 state locking
    }
}

provider "aws" {
    region = "us-east-1"
}