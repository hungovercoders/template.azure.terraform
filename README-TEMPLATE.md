# Repo.Name

This project will do this thing that I am describing.

## Prerequisites

* [Github Account](https://www.github.com/)
* [Gitpod](https://gitpod.io/)
* [Gitpod Browser Extension](https://www.gitpod.io/docs/configure/user-settings/browser-extension) (optional)
* [Visual Studio Code](https://code.visualstudio.com/) (optional but recommended for any workloads requiring Microsoft VS code extensions)

## Getting Started

1. Open the repository in gitpod.
2. Note the terminals on the right hand side
   * Versions: Will show you the versions of the tools installed
   * Azure CLI: Will show you the installation of the Azure CLI
   * Azure Storage: Will show you whether the state resource group and storage is created
   * Terraform: Will show you the current terraform plan against the development environment.

## Local Infrastructure Development in Gitpod

1. Make changes in the terraform directory.
2. Run the following bash commands to test your changes.

```bash
sh ./cde/terraform.sh
```

3. If you wish to try deploying to development from your gitpod directory exactly as the pipeline would, runL:

```bash
sh ./cde/terraform.sh True
```

## Deployment

1. You can either manually trigger the github action associated with this repo, which will deploy to development and generate a plan against production.
1. A pull request to main will trigger the github action associated with this repo, which will deploy to development and generate a plan against production.
1. A completed pull request to main will trigger the github action associated with this repo, which will deploy to development and deploy to production.
