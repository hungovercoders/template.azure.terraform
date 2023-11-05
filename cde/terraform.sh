TF_BACKEND_CONTAINER=$ENVIRONMENT
cd  terraform
terraform init -backend-config="storage_account_name=$TF_BACKEND_STORAGE_ACCOUNT" -backend-config="container_name=$TF_BACKEND_CONTAINER" -backend-config="key=template.azure.terraform.tfstate"
terraform fmt
terraform validate
terraform plan