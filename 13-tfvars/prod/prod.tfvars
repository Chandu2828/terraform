environment     = "prod"
instance_type   = "t3.small"

# terraform init -reconfigure -backend-config=prod/backend.tf 
# terraform plan -var-file=prod/prod.tfvars 
