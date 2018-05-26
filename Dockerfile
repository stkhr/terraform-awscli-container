FROM alpine:latest

MAINTAINER stkhr

ENV TERRAFORM_VERSION=0.11.7

RUN apk -U add \
    ca-certificates \
    git \
    openssh \
    python \
    curl \
    groff \
    py-pip \
    wget && \
    pip install awscli && \
    rm -rf /var/cache/apk/*

RUN wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -O terraform.zip && \
    unzip terraform.zip -d /bin && \
    rm -f terraform.zip
