# Start with the Ubuntu base image
FROM ubuntu:latest

# Update the package list
RUN apt-get update

# Install curl, git, and build-essential
RUN apt-get install -y curl git build-essential

# Install Homebrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to the PATH
ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"

# Test to ensure it works
RUN brew doctor

# Install Terraform
RUN   brew tap hashicorp/tap
RUN   brew install hashicorp/tap/terraform

# Install Azure Cli
RUN   brew update && brew install azure-cli