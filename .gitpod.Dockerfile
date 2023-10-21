# You can find the new timestamped tags here: https://hub.docker.com/r/gitpod/workspace-base/tags
FROM gitpod/workspace-full:latest

# Install custom tools, runtime, etc.
# base image only got `apt` as the package manager
# install-packages is a wrapper for `apt` that helps skip a few commands in the docker env.
RUN   brew tap hashicorp/tap
RUN   brew install hashicorp/tap/terraform
RUN   brew update && brew install azure-cli