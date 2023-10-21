FROM gitpod/workspace-full:latest

RUN   brew tap hashicorp/tap
RUN   brew install hashicorp/tap/terraform
RUN   brew update && brew install azure-cli