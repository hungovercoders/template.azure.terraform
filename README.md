# TEMPLATE.AZURE.PLATFORM

This is a template repo for you to use to create your own Azure platform resources using Terraform. It is designed to work with both gitpod and github codespaces as well as deploy with github actions.

- [TEMPLATE.AZURE.PLATFORM](#templateazureplatform)
  - [What this template provides](#what-this-template-provides)
  - [Use as Template](#use-as-template)
  - [Create Azure Resources](#create-azure-resources)
  - [Update Common Variables](#update-common-variables)
  - [Develop with Gitpod](#develop-with-gitpod)
    - [Setup a Prebuild](#setup-a-prebuild)
  - [Develop with Github Codespaces](#develop-with-github-codespaces)
  - [Develop with VS Code Dev Containers](#develop-with-vs-code-dev-containers)
  - [Deploy with Github Actions](#deploy-with-github-actions)
  - [Miscellaneous](#miscellaneous)
    - [Migrating Terraform State](#migrating-terraform-state)
    - [Upgrading Terraform Versions](#upgrading-terraform-versions)

## What this template provides

- Instructions on how to setup Azure credentials that is used to deploy infrastructure.
- Instructions on how to update common variables used in any environment.
- Instructions on how develop in different environments using gitpod, github codespaces and VS Code dev containers.
- A developer environment that includes the Azure CLI, Terraform and appropriate variables.
- An automatically deployed storage account to hold the terraform state.
- A github actions workflow to deploy the infrastructure.

## Use as Template

1. Create a new repository in github.
2. Choose use template and select this repository.
3. Name your new repo appropriately.

![Github Repo Template](images/github_repo_template.PNG)

## Create Azure Resources

- You must have an [Azure subscription](https://portal.azure.com).
- You must have an application registration in Azure with the appropriate permissions to create resources in your subscription.
- You can create an application registration by running the a CLI command in a shell in the portal. Copy and paste the following code, but change your subscription name to be the one your using and set the app reg name to be what you require. It will also output the ARM_CLIENT_ID and ARM_CLIENT_SECRET which you can use to set the environment variables in the following sections.

```bash
SUBSCRIPTION_NAME="MySubscriptionName"
APP_REG_NAME=aprg-organisation-env-admin
az account set --subscription "$SUBSCRIPTION_NAME"
ARM_CLIENT_ID=$(az ad app create --display-name $APP_REG_NAME --query appId --output tsv)
echo "ARM_CLIENT_ID is..."
echo $ARM_CLIENT_ID
ARM_CLIENT_SECRET=$(az ad app credential reset --id $ARM_CLIENT_ID --append --years 1 --query password --output tsv)
echo "ARM_CLIENT_SECRET is..."
echo $ARM_CLIENT_SECRET
```

- If you are unsure where your app reg was created, you can find it [here](https://portal.azure.com/#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/RegisteredApps) in the Azure portal.

- You can then give it the appropriate role against the subscription (as an example using the command below):

**IMPORTANT:** I use "Owner" as a role in these examples as they are just development environments. You will likely want to limit access to your app registrations in reality to more appropriate roles.

```bash
az ad sp create --id $ARM_CLIENT_ID
az role assignment create --assignee $ARM_CLIENT_ID --role "Owner" --scope "/subscriptions/$ARM_SUBSCRIPTION_ID"
```

* You can also get the other Azure variables you need for the environment variables you need in the following sections below by running:

```bash
ARM_SUBSCRIPTION_ID=$(az account show --query id -o tsv)
echo "ARM_SUBSCRIPTION_ID is..."
echo $ARM_SUBSCRIPTION_ID
ARM_SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
echo "ARM_SUBSCRIPTION_NAME is..."
echo $ARM_SUBSCRIPTION_NAME.
ARM_TENANT_ID=$(az account show --query tenantId -o tsv)
echo "ARM_TENANT_ID is..."
echo $ARM_TENANT_ID
```

## Update Common Variables

1. You'll need to edit the [domain.env](domain.env) file to be appropriate domain and team for your new repo.

```bash
TEAM=myteam
DOMAIN=mydomain
```

**Top Tip!** You can edit github repos in the browser by changing the name of the repo url to be github.dev instead of github.com. e.g. https://github.dev/hungovercoders/terraform.azure.platform. This will open up the repo in VS Code in the browser and you can edit the files directly.

2. You'll need to edit the [versions.tf](terraform/versions.tf) file to have the correct key for your state. e.g.

```yml
backend "azurerm" {
    key = "platform.azure.myinfrastructure.tfstate"
  }
```

This value wil be what we see later is the file name in the appropriate container of the storage account that holds the state.

## Develop with [Gitpod](gitpod.io)

1. If you haven't already, add the following environment variables to your [gitpod environment](https://gitpod.io/user/variables):

| Name  | Example Value  |
|---|---|
| ARM_CLIENT_ID  | da4ee6ba-7a57-11ee-b962-0242ac120002  |
| ARM_CLIENT_SECRET  |  ed72eb4c-7a57-11ee-b962-0242ac120002 |
| ARM_SUBSCRIPTION_ID  | e10bae2a-7a57-11ee-b962-0242ac120002  |
| ARM_SUBSCRIPTION_NAME  | Development  |
| ARM_SUBSCRIPTION_ID  | e6288fd6-7a57-11ee-b962-0242ac120002  |
| ARM_REGION  | northeurope  |
| ENVIRONMENT | development |
| ORGANISATION | hungovercoders |
| UNIQUE_NAMESPACE | hngc |

These can be scoped however you need. For example, you can scope them to your [repository project](https://gitpod.io/projects), or to your [user](https://gitpod.io/user/variables).
Ensure the scope of the variables is also at the required level when using user variables. In this example below I have set the variables at the user level, because I use them consistently, but scoped them to my hungovercoders organisation repos. The Tenant is the same everywhere though which is why it scoped to all.

![Gitpod Variables](images/gitpod_variables.PNG)

2. To develop with [gitpod](https://gitpod.io) you can either open the url of this repo prefixed with gitpod.io/# or you can use the [gitpod browser extension](https://www.gitpod.io/docs/configure/user-settings/browser-extension) to open the repo in gitpod.

4. Open in gitpod and you should see the following bash terminals:

a. **Azure CLI** - this will login to Azure using the service principal and set the subscription to the one specified in the environment variables.

![Gitpod Azure CLI](images/gitpod_azure_cli.PNG)

**Important:** If you wish to sign in to Azure using your own credentials as part of this process, you will want to change to use to the azure.sh script in the gitpod.yml instead of azure_sp.sh. This will prompt you to sign-in when you open up gitpod and the other tasks will not run until you have done this.

![Gitpod Azure CLI](images/gitpod_azure_cli_own.PNG)

b. **Storage account** - which creates the storage account that will hold the terraform state.

![Gitpod Azure Storage](images/gitpod_azure_storage.PNG)

You should see this deployed in Azure based on the environment variables you set earlier. 

![Azure Storage](images/azure_storage.PNG)

This will have a container for each environment.

![Azure Storage Containers](images/azure_storage_containers.PNG)

c. **Terraform** - which will run terraform init, format, validation and then terraform plan.

![Gitpod Terraform](images/gitpod_terraform.PNG)

You should see the initial state file in the development container with the same name as the repo.

![Azure Storage State](images/azure_storage_container_state.PNG)

You have now successfully initialised a repo with gitpod and integrated resource state with your developer environment. To develop you can now start adding resources to the [main.tf](./terraform/main.tf) file and then run terraform plan and apply as you would normally.

### Setup a Prebuild

In order to speed up your new environment when you go to use it again I recommend setting up a [gitpod prebuild](https://www.gitpod.io/docs/configure/projects/prebuilds). This will mean the development container is already built and ready to go when you open it up.

## Develop with Github Codespaces

## Develop with VS Code Dev Containers

## Deploy with Github Actions

In order to make the actions trigger appropriately on pull request or committing to main, you will need to amend the [terraform.yml](.github/workflows/terraform.yml) file to have the appropriate default branches instead of the placeholders e.g.

```yaml
on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
  workflow_dispatch:
```

This means that the workflow will run on push to main, pull request to main and manually when you click the run workflow button.

## Miscellaneous

### Migrating Terraform State

```bash
terraform init -migrate-state
```

### Upgrading Terraform Versions

If you get an issue where terraform says it doesn't support a particular resource, upgrade the [versions.tf file](./terraform/versions.tf) to the latest version of what you need and then run: 

```bash
terraform init -upgrade
```
