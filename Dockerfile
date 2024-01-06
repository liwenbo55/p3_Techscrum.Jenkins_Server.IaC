# base image (jenkins:2.426.2-lts-jdk11) based on debian
FROM jenkins/jenkins:2.426.2-lts-jdk11

USER root

################################
# Install dependencies
################################
RUN apt-get update

# install awscli
RUN apt install awscli -y

# install docker
RUN apt install docker.io -y

# install node
SHELL ["/bin/bash", "--login", "-c"]
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
RUN nvm install 16.15.1
# Restore default shell
SHELL ["/bin/sh", "-c"]

# install npm
RUN apt install npm -y
# install yarn
RUN npm install -g yarn -y

# install terraform
RUN apt-get install -y unzip && \
    curl -fsSL https://releases.hashicorp.com/terraform/1.4.6/terraform_1.4.6_linux_amd64.zip -o terraform.zip && \
    unzip terraform.zip -d /usr/local/bin && \
    rm terraform.zip

# install jq
RUN apt-get install -y jq

USER jenkins
# install jenkins plugins
RUN jenkins-plugin-cli --plugins "blueocean pipeline-aws aws-credentials email-ext"
