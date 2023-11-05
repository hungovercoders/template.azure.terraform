az storage account create -n $TF_BACKEND_STORAGE_ACCOUNT -g $TF_BACKEND_RESOURCE_GROUP -l $REGION --sku Standard_LRS
az storage container create --name $TF_BACKEND_CONTAINER --account-name $TF_BACKEND_STORAGE_ACCOUNT
az storage container create --name "development" --account-name $TF_BACKEND_STORAGE_ACCOUNT
az storage container create --name "production" --account-name $TF_BACKEND_STORAGE_ACCOUNT