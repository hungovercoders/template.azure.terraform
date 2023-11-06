TF_BACKEND_RESOURCE_GROUP="state-rg-$UNIQUE_NAMESPACE"
TF_BACKEND_STORAGE_ACCOUNT="statesa$UNIQUE_NAMESPACE"
az group create -n $TF_BACKEND_RESOURCE_GROUP -l $ARM_REGION
az storage account create -n $TF_BACKEND_STORAGE_ACCOUNT -g $TF_BACKEND_RESOURCE_GROUP -l $ARM_REGION --sku Standard_LRS
az storage container create --name "development" --account-name $TF_BACKEND_STORAGE_ACCOUNT
az storage container create --name "uat" --account-name $TF_BACKEND_STORAGE_ACCOUNT
az storage container create --name "production" --account-name $TF_BACKEND_STORAGE_ACCOUNT