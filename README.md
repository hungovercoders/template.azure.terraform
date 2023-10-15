# platform.azure.container

## Instructions

1. Open in gitpod.
2. On the Azure CLI: bash terminal, once prompted you will need to authenticate to Azure by going to the URL and entering in the code.

![Azure Login Code](./images/azlogin.png)

3. Azure CLI will then be authenticated and terraform will be able to initialise, format, validate and plan.

![Terraform Validate](./images/terraformvalidate.png)

## Upgrading Versions

If you get an issue where terraform says it doesn't support a particular resource, upgrade the [versiosn.tf file](./terraform/versions.tf) to the latest version of what you need and then run: 

```bash
terraform init -upgrade
```
