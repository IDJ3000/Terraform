#!bin/bash/

terraform init
terraform fmt
terraform validate
terraform plan
sleep 5
terraform apply --auto-approve
sleep 60
terraform destroy --auto-approve