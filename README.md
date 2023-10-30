# TEMPLATE.AZURE.PLATFORM

This is a template repo for you to use to create your own Azure platform resources using Terraform. It is designed to work with both gitpod and github codespaces.

## Use as Template

1. Create a new repository in github.
2. Choose use template and select this repository.

## Pre-Requisites

* You must have an Azure subscription.
* You must have an application registration in Azure with the appropriate permissions to create resources in your subscription.

```bash

```

## Develop with Gitpod

1. Add the following environment variables to your gitpod environment:

* ARM_CLIENT_ID
* ARM_CLIENT_SECRET
* ARM_SUBSCRIPTION_ID
* ARM_SUBSCRIPTION_NAME
* ARM_TENANT_ID
* TERRAFORM_BACKEND_STORAGE_ACCOUNT_NAME
* TERRAFORM_BACKEND_STORAGE_ACCOUNT_CONTAINER_NAME

These can be scoped however you need. For example, you can scope them to the repository, or to your user.

1. Open in gitpod and you should see the following bash terminals:

1. **Azure CLI** - this will login to Azure using the service principal and set the subscription to the one specified in the environment variables.
2. **Storage account** - which creates the storage account that will hold the terraform state.
3. **Terraform** - which will run terraform init, format, validation and then terraform plan.

## Develop with Github Codespaces

## Deploy with Github Actions


## Upgrading Terraform Versions

If you get an issue where terraform says it doesn't support a particular resource, upgrade the [versions.tf file](./terraform/versions.tf) to the latest version of what you need and then run: 

```bash
terraform init -upgrade
```
