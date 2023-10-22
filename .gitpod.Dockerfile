FROM gitpod/workspace-full:latest 

# Start with the Ubuntu base image
# FROM ubuntu:latest

# Update the package list
# RUN apt-get update

# Install curl and git
# RUN apt-get install -y curl git

# Install Homebrew
# RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to the PATH
# ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"

# Install gcc using Homebrew
# RUN brew install gcc

# Test to ensure it works
# RUN brew doctor

# Install Terraform
RUN   brew tap hashicorp/tap
RUN   brew install hashicorp/tap/terraform

# Install Azure Cli
RUN   brew update && brew install azure-cli
