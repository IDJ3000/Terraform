#!bin/bash/
terraform init
terraform fmt
terraform validate 
terraform plan
sleep 10
terraform apply --auto-approve
sleep 10
terraform destroy --auto-approve

## To execute this script, run <sh terraform.sh>