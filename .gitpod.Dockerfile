# Start with the Ubuntu base image
FROM ubuntu:latest

# Update the package list
RUN apt-get update

# Install curl, git, and build-essential
RUN apt-get install -y curl git build-essential

# Clone Homebrew
RUN git clone https://github.com/Homebrew/brew /home/linuxbrew/.linuxbrew/Homebrew

# Set up the PATH for Homebrew
ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"

# Install Homebrew's dependencies
RUN /home/linuxbrew/.linuxbrew/bin/brew doctor

# Test to ensure it works
RUN brew doctor

# Install Terraform
RUN   brew tap hashicorp/tap
RUN   brew install hashicorp/tap/terraform

# Install Azure Cli
RUN   brew update && brew install azure-cli
