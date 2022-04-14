FROM node:lts-alpine

RUN apk add --update --no-cache  \
      git \
      findutils \
      bash \
      unzip \
      curl \
      wget \
      npm \
      openjdk8-jre \
      openssh-client \
      perl \
      jq

# Install Salesforce CLI from npm
RUN npm install sfdx-cli --global
RUN sfdx --version

# Install SFDX Plugins
RUN echo y | sfdx plugins:install sfdx-git-delta
RUN sfdx plugins