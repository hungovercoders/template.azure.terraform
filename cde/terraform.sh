TF_BACKEND_RESOURCE_GROUP="state-rg-$UNIQUE_NAMESPACE"
TF_BACKEND_STORAGE_ACCOUNT="statesa$UNIQUE_NAMESPACE"
TF_BACKEND_CONTAINER=$ENVIRONMENT
TF_VAR_environment=$ENVIRONMENT
TF_VAR_unique_namespace=$UNIQUE_NAMESPACE
TF_VAR_organisation=$ORGANISATION
TF_VAR_region=$REGION
TF_VAR_team=$TEAM
TF_VAR_domain=$DOMAIN

cd  terraform
terraform init -backend-config="resource_group_name=$TF_BACKEND_RESOURCE_GROUP" -backend-config="storage_account_name=$TF_BACKEND_STORAGE_ACCOUNT" -backend-config="container_name=$TF_BACKEND_CONTAINER" -backend-config="key=template.azure.terraform.tfstate"
terraform fmt
terraform validate
terraform plan