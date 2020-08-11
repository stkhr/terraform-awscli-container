FROM alpine:latest

LABEL maintainer stkhr

ENV TERRAFORM_VERSION=0.13.0

RUN apk -U add \
    ca-certificates \
    git \
    openssh \
    python3 \
    python3-dev \
    py3-pip \
    curl \
    groff \
    wget && \
    curl -o /usr/bin/jq -L https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && chmod +x /usr/bin/jq && \
    pip3 install awscli && \
    rm -rf /var/cache/apk/*

RUN wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -O terraform.zip && \
    unzip terraform.zip -d /bin && \
    rm -f terraform.zip
